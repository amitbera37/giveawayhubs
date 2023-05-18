var categories = require('../models/categoriesModel');
var async = require('async');
const AWS = require("aws-sdk");
var path = require('path');
var CryptoJS = require("crypto-js");

const db = require('../../config/db');
const common = require('../../config/common');
var dir = path.join(__dirname, '../../public');
var nodemailer = require('nodemailer');
const md5 = require('md5');
var fs = require("fs");
var path = require('path');
var dir = path.join(__dirname, '../../public');
var shortUrl = require('node-url-shortener');
const ejs = require('ejs');

const redisClient = require('../../config/redisConnection');

/********Get data from Redis server */
var insertRedisServerForAllCategories = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => {
                client.set(name, JSON.stringify(obj));
                var timeOut = 60 * 60 * 24;
                client.expire(name, timeOut);
            });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForCatId = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => {
                client.set(name, JSON.stringify(obj));
                var timeOut = 60 * 60 * 23;
                client.expire(name, timeOut);
            });
        } else {
            callback('err');
        }
    }
}


module.exports = {
    async allCategories(req, res) {
        let name = "";
        try {
            const catRes = new Promise((resolve, reject) => {
                categories.getParentCategories(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs = await catRes;

            const catRes1 = new Promise((resolve, reject) => {
                categories.getHomeSeo('Categories', (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('seo ERROR')
                    }
                })
            });
            let rs2 = await catRes1;
            if (rs.length > 0) {
                rs.sort(function (a, b) {
                    if (a.parentName < b.parentName) { return -1; }
                    if (a.parentName > b.parentName) { return 1; }
                    return 0;
                })

                // async.waterfall([
                //     insertRedisServerForAllCategories("all_cat_data", rs)
                // ], function (error, success) {
                //     if (error) {
                //         console.log(` ERROR: ${error}`)
                //     }
                // });

                let encryptObj = {
                    data: rs,
                    seo: rs2,
                    storeImgUrl: common.storeImgUrl,
                    catImgUrl: common.catImgUrl
                }

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);
                
                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString()
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Data not found'
                })
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    async getStoreByCatId(req, res) {
        let catIdEncryp = req.body.catId;
        let decrypted = CryptoJS.AES.decrypt(catIdEncryp, common.encryptKey);
        let catId = decrypted.toString(CryptoJS.enc.Utf8);
        console.log(catId);

        try {
            if (catId != "") {
                const parentRes = new Promise((resolve, reject) => {
                    categories.getDetailsCategory(catId, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let parentRs = await parentRes;

                var arr = [];
                if (parentRs.length > 0) {
                    var i = 0;
                    parentRs.forEach(async element => {
                        const storeRes = new Promise((resolve, reject) => {
                            categories.getAllStoreDetailsByCatId(element.id, (result, err) => {
                                if (result) {
                                    resolve(result);
                                } else {
                                    reject('ERROR')
                                }
                            })
                        });
                        let storeObj = await storeRes;

                        if (storeObj.length > 0) {
                            storeObj.sort(function (a, b) {
                                if (a.store_name < b.store_name) { return -1; }
                                if (a.store_name > b.store_name) { return 1; }
                                return 0;
                            })

                            arr.push({
                                "catName": element.name,
                                "catId": element.id,
                                "seo_url": element.seo_url,
                                "storeObj": storeObj,
                                "storeImgUrl": common.storeImgUrl,
                                "catImgUrl": common.catImgUrl
                            })
                        }

                        i++;
                        if (parentRs.length == i) {
                            let obj = {
                                "categoryDetails": parentRs[0],
                                "childData": arr
                            };

                            // async.waterfall([
                            //     insertRedisServerForCatId("catId_" + catId, obj)
                            // ], function (error, success) {
                            //     if (error) {
                            //         console.log(` ERROR: ${error}`)
                            //     }
                            // });

                            let encryptObj = {
                                data: obj,
                                storeImgUrl: common.storeImgUrl,
                                catImgUrl: common.catImgUrl
                            }

                            var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);
                            
                            res.status(200).json({
                                statusCode: 200,
                                encryptObj : encrypted.toString()
                            })
                        }
                    });
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Data not found'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send a category ID.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
}

