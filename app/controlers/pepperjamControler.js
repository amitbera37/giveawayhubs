var pepperjamModel = require('../models/pepperjamModel');
var async = require('async');
const AWS = require("aws-sdk");
var path = require('path');
var CryptoJS = require("crypto-js");

const db = require('../../config/db');
const common = require('../../config/common');
var fs = require("fs");
var dir = path.join(__dirname, '../../public');
const axios = require('axios');
const xml2js = require('xml2js');
var affiliatedToken = require('../../config/affiliated');
var dateTime = require('node-datetime');

var insertPaperjamStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                pepperjamModel.insertPaperjamStoreList(obj, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
        } else {
            callback('err');
        }
    }
}

async function updateShareLink(affiliated_store_id) { // w
    if(affiliated_store_id != ''){
        var api_url = "https://api.pepperjamnetwork.com/20120402/publisher/creative/text?apiKey="+ affiliatedToken.paperjamKey +"&format=json&programId="+affiliated_store_id;
        var response = await axios.get(api_url);
        
        var xx = response.data;
        if (xx.data.length > 0) {
            let obj = {
                "affiliated_store_id" : affiliated_store_id,
                "TrackingLink" : xx.data[0].tracking_url
            }
            const Res = new Promise((resolve, reject) => {
                pepperjamModel.updateShareSaleLinkurl(obj, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
        }
    }
}

async function getCouponCode(affiliated_store_id) { // w
    if(affiliated_store_id != ''){
        var api_url = "https://api.pepperjamnetwork.com/20120402/publisher/creative/coupon?apiKey="+ affiliatedToken.paperjamKey +"&format=json&programId="+affiliated_store_id;
        var response = await axios.get(api_url);
        var xx = response.data;
        
        if (xx.data.length > 0) {
            var i = 0;
            xx.data.forEach(element => {
                let coupon_code_status = element.status;
                if(coupon_code_status == 'active'){
                    let paperCouponObj = {
                        "link_id" : element.id,
                        "affiliated_store_id": affiliated_store_id,
                        "category": element.category_name.replace(/['"]+/g, ''),
                        "coupon_code": element.coupon,
                        "start_date": element.start_date,
                        "end_date": element.end_date,
                        "commission": '',
                        "clickUrl": element.code,
                        "description" : element.description.replace(/['"]+/g, ''),
                        "coupon_code_status" : coupon_code_status,
                        "network": "PJ"
                    };
                    console.log("======paperCouponObj===", paperCouponObj);

                    const Res = new Promise((resolve, reject) => {
                        pepperjamModel.insertPaperjamCouponList(paperCouponObj, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });
                }
            });
        }
    }
}

module.exports = {
    // paperjam 
    async getALLStoreList(req, res) {
        let pageNo = req.body.pageNo;
        var api_url = "https://api.pepperjamnetwork.com/20120402/publisher/advertiser?apiKey="+ affiliatedToken.paperjamKey +"&status=joined&format=json&page="+pageNo;
        try {
            var response = await axios.get(api_url);
            //console.log("===========response=========", response.data);
            //let arr = response.data;
            var xx = response.data;

            if (xx.data.length > 0) {
                //console.log("===========response=========", xx.data.length);
                var i  = 0;
                let store_parent_categories = "";
                let child_categories = "";

                xx.data.forEach(async element => {
                    setTimeout(() => {
                        //console.log("=====", element.category)
                        let status = "";
                        if(element.status == 'joined'){
                            status = "Active"; 
                        } else {
                            status = "Inactive";
                        }
                        if (element.category.length > 0) {
                            var j=0;
                            var catName = [];
                            element.category.forEach(e => {
                                catName.push(e.name);
                                j++;
                                if(element.category.length == j){
                                    store_parent_categories = catName.toString().replace(/['"]+/g,'');
                                }
                            })
                        }
                        let paperStoreObj = {
                            "affiliated_store_id": element.id,
                            "store_status": status,
                            "store_name": element.name.replace(/['"]+/g,''),
                            "store_website": element.website,
                            "store_parent_categories": store_parent_categories,
                            "child_categories": child_categories,
                            "network": "PJ",
                            "TrackingLink" : ""
                        };

                        async.waterfall([
                            insertPaperjamStoreList(paperStoreObj)
                        ], function (error, success) {
                            if (error) {
                                console.log(` ERROR: ${error}`)
                            }
                        });
                      }, i*1000);
                    i++;
                    if (xx.data.length == i) {
                        res.status(200).json({
                            statusCode: 200,
                            msg: "Data insert has been successfully"
                        })
                    }
                });
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: "Insert not successfull."
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
            res.status(200).json({
                statusCode: 201,
                msg: "Request failed with status code 400"
            })
        }
    },

    async updateLink(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                pepperjamModel.getStoreId(params, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let advertiserIdsArr = await Res;
            if (advertiserIdsArr.length > 0) {
                var i = 0;
                advertiserIdsArr.forEach(async e => {
                    setTimeout(function(){
                        updateShareLink(e.affiliated_store_id);
                    },i * 1000)

                    i++;
                    if (advertiserIdsArr.length == i) {
                        res.status(200).json({
                            statusCode: 200,
                            msg: "Successfully"
                        })
                    }
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: "Store is not avaliable"
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
            res.status(200).json({
                statusCode: 201,
                msg: "Request failed with status code 400"
            })
        }
    },

    async getCoupon(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                pepperjamModel.getStoreId(params, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let advertiserIdsArr = await Res;
            if (advertiserIdsArr.length > 0) {
                var i = 0;
                advertiserIdsArr.forEach(async e => {
                    setTimeout(function(){
                        getCouponCode(e.affiliated_store_id);
                    },i * 1000)

                    i++;
                    if (advertiserIdsArr.length == i) {
                        res.status(200).json({
                            statusCode: 200,
                            msg: "Successfully"
                        })
                    }
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: "Store is not avaliable"
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
            res.status(200).json({
                statusCode: 201,
                msg: "Request failed with status code 400"
            })
        }
    },
}

