var shareSaleModel = require('../models/shareSaleModel');
var async = require('async');
const AWS = require("aws-sdk");
var path = require('path');
var CryptoJS = require("crypto-js");
var crypto = require('crypto');

const db = require('../../config/db');
const common = require('../../config/common');
var fs = require("fs");
var dir = path.join(__dirname, '../../public');
const axios = require('axios');
const xml2js = require('xml2js');
const csv = require('fast-csv');
var affiliatedToken = require('../../config/affiliated');
var dateTime = require('node-datetime');

var insertSAStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                shareSaleModel.insertSAStoreList(obj, (result, err) => {
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

var insertLSStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                shareSaleModel.insertLSStoreList(obj, (result, err) => {
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

var insertSACouponList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                shareSaleModel.insertSACouponList(obj, (result, err) => {
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

async function importDeal(affiliated_store_id) { // w
    var myAffiliateId = affiliatedToken.shareSaleAffiliatedId;
    var apiToken = affiliatedToken.shareSaleToken;
    var apiSecretKey = affiliatedToken.shareSaleSecretKey;
    var apiVersion = 2.3;
    var actionVerb = 'couponDeals';
    var myTimestamp = new Date().toUTCString()
    var format = "xml";
    var sig = apiToken + ":" + myTimestamp + ":" + actionVerb + ":" + apiSecretKey
    var sig_hash = crypto.createHash('sha256').update(sig).digest('hex')
    var headers = { 'x-ShareASale-Date': myTimestamp, 'x-ShareASale-Authentication': sig_hash }


    if (affiliated_store_id != '') {
        var api_url = "https://api.shareasale.com/x.cfm?affiliateId=" + myAffiliateId + "&token=" + apiToken + '&version=' + apiVersion + '&action=' + actionVerb + '&merchantId=' + affiliated_store_id + "&format=" + format;
        var response = await axios.get(api_url, { headers: headers });
        if (response.data) {
            // convert XML to JSON
            xml2js.parseString(response.data, (err, result) => {
                if (err) {
                    throw err;
                }
                // convert it to a JSON string
                if (Object.keys(result).length != 0 && result.constructor === Object) {
                    const json = JSON.stringify(result, null, 4);
                    var couponObject = JSON.parse(json); //parse json string into JS object
                    var totalObj = couponObject['dealcouponlistreport'].dealcouponlistreportrecord;

                    if (totalObj.length > 0) {
                        var i = 0;
                        totalObj.forEach(element => {
                            let dt = dateTime.create();
                            let formatted = dt.format('Y-m-d H:M:S');
                            let endDate = element['enddate'][0];
                            let timeDifference = "";
                            let differentDays = "";
                            let endDateVal = "";

                            if (endDate != "") {
                                endDateVal = endDate;
                                if (endDate >= formatted) {
                                    timeDifference = Math.abs((new Date(endDate).getTime() - new Date(formatted).getTime()));
                                    differentDays = Math.ceil(timeDifference / (1000 * 3600 * 24));
                                } else {
                                    differentDays = 0;
                                }
                            } else {
                                var currentdate = new Date();
                                var mm = currentdate.getMonth() + 3;
                                var date = currentdate.getFullYear() + "-" + mm
                                    + "-" + currentdate.getDate() + " "
                                    + currentdate.getHours() + ":"
                                    + currentdate.getMinutes() + ":" + currentdate.getSeconds();
                                
                                differentDays = 1;
                                endDateVal = date;
                            }

                            console.log("==SS====endDateVal===", endDateVal)

                            let coupon_code_status = (differentDays >= 1 ? 'active' : 'Inactive');
                            let site_status = (coupon_code_status == 'Inactive' ? '0' : '1');

                            if (coupon_code_status == "active" && element['couponcode'][0] != "") {
                                let cjCouponObj = {
                                    "dealid": element['dealid'][0],
                                    "affiliated_store_id": element['merchantid'][0],
                                    "category": element['category'][0].replace(/['"]+/g, ''),
                                    "coupon_code": element['couponcode'][0].replace(/['"]+/g, ''),
                                    "start_date": element['startdate'][0],
                                    "end_date": element['enddate'][0],
                                    "commission": element['description'][0].replace(/['"]+/g, ''),
                                    "clickUrl": element['trackingurl'][0].replace(/['"]+/g, ''),
                                    "description": element['description'][0].replace(/['"]+/g, ''),
                                    "coupon_code_status": coupon_code_status,
                                    "site_status": site_status,
                                    "network": "SS"
                                }

                                //console.log("====SS====", cjCouponObj);

                                async.waterfall([
                                    insertSACouponList(cjCouponObj)
                                ], function (error, success) {
                                    if (error) {
                                        console.log(` ERROR: ${error}`)
                                    }
                                });
                            }

                        });
                    }
                }
            });
        }
    }
}

module.exports = {
    async getALLStoreList(req, res) {
        var myAffiliateId = affiliatedToken.shareSaleAffiliatedId;
        var apiToken = affiliatedToken.shareSaleToken;
        var apiSecretKey = affiliatedToken.shareSaleSecretKey;
        var apiVersion = 2.3;
        var actionVerb = 'merchantStatus';
        var myTimestamp = new Date().toUTCString()
        var sortCol = "merchantId";
        var sortDir = "asc";
        var format = "xml";


        var sig = apiToken + ":" + myTimestamp + ":" + actionVerb + ":" + apiSecretKey
        var sig_hash = crypto.createHash('sha256').update(sig).digest('hex')
        var headers = { 'x-ShareASale-Date': myTimestamp, 'x-ShareASale-Authentication': sig_hash }
        var api_url = "https://api.shareasale.com/x.cfm?affiliateId=" + myAffiliateId + "&token=" + apiToken + '&version=' + apiVersion + '&action=' + actionVerb + "&sortCol=" + sortCol + "&sortDir=" + sortDir + "&format=" + format;


        try {
            var response = await axios.get(api_url, { headers: headers });
            console.log("===========response=========", response);
            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json); //parse json string into JS object
                    let responsObj = personObject['merchantstatusreport'].merchantstatusreportrecord;
                    console.log("=====responsObj===", responsObj);

                    if (responsObj.length > 0) {
                        var i = 0;
                        let store_parent_categories = "";
                        let child_categories = "";
                        let status = "";
                        responsObj.forEach(element => {
                            if (element['approved'][0] == 'Yes') {
                                status = 'Active';
                            } else {
                                status = 'InActive';
                            }
                            if (element['programcategory'][0] != '') {
                                if (Object.keys(element['programcategory'][0]).length > 0) {
                                    store_parent_categories = element['programcategory'][0].toString().replace(/['"]+/g, '');
                                }
                            }
                            let cjStoreObj = {
                                "affiliated_store_id": element['merchantid'][0],
                                "store_status": status,
                                "store_name": element['merchant'][0].replace(/['"]+/g, ''),
                                "store_website": element['www'][0].replace(/['"]+/g, ''),
                                "store_parent_categories": store_parent_categories,
                                "child_categories": child_categories,
                                "network": "SS",
                                "shareSale_linkurl": element['linkurl'][0].replace(/['"]+/g, ''),
                            }

                            async.waterfall([
                                insertSAStoreList(cjStoreObj)
                            ], function (error, success) {
                                if (error) {
                                    console.log(` ERROR: ${error}`)
                                }
                            });

                            i++;
                            if (responsObj.length == i) {
                                res.status(200).json({
                                    statusCode: 200,
                                    msg: "Data insert has been successfully"
                                })
                            }
                        });
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: "Data is not available"
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

    async getDealbyStore(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                shareSaleModel.getStoreId(params, (result, err) => {
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
                    setTimeout(function () {
                        importDeal(e.affiliated_store_id);
                    }, i * 1000)

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

    async getDealbyStoreUsedByCron(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                shareSaleModel.getStoreId(params, (result, err) => {
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
                    setTimeout(function () {
                        importDeal(e.affiliated_store_id);
                    }, i * 1000)

                    i++;
                    if (advertiserIdsArr.length == i) {
                        console.log("Successfully");
                    }
                })
            } else {
                console.log("Store is not avaliable");
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
            
        }
    },

    async importFromLocal(req, res, next) {
        let storeList;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(400).send('No files were uploaded.');
        }

        storeList = req.files.storeList;
        console.log(storeList);
        uploadPath = dir + '/storeList/' + storeList.name;

        // Use the mv() method to place the file somewhere on your server
        storeList.mv(uploadPath, function (err) {
            if (err)
                return res.status(500).send(err);
            /***********/
            let stream = fs.createReadStream(uploadPath);
            let responsObj = [];
            let csvStream = csv
                .parse()
                .on("data", function (data) {
                    responsObj.push(data);
                })
                .on("end", function () {
                    // Remove Header ROW
                    responsObj.shift();

                    if (responsObj.length > 0) {
                        var i = 0;
                        responsObj.forEach(element => {
                            let cjStoreObj = {
                                "affiliated_store_id": element[0],
                                "store_status": element[2],
                                "store_name": element[1],
                                "store_website": element[6],
                                "store_parent_categories": element[3],
                                "child_categories": element[4],
                                "network": "SS",
                                "shareSale_linkurl": element[12],
                            }

                            async.waterfall([
                                insertSAStoreList(cjStoreObj)
                            ], function (error, success) {
                                if (error) {
                                    console.log(` ERROR: ${error}`)
                                }
                            });

                            i++;
                            if (responsObj.length == i) {
                                res.status(200).json({
                                    statusCode: 200,
                                    msg: "Data insert has been successfully"
                                })
                            }
                        });
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: "Data is not available"
                        })
                    }
                });

            stream.pipe(csvStream);

            /*************/
        })
    },

    async importFromLocal2(req, res, next) {
        let storeList;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(400).send('No files were uploaded.');
        }

        storeList = req.files.storeList;
        console.log(storeList);
        uploadPath = dir + '/storeList/' + storeList.name;

        // Use the mv() method to place the file somewhere on your server
        storeList.mv(uploadPath, function (err) {
            if (err)
                return res.status(500).send(err);
            /***********/
            let stream = fs.createReadStream(uploadPath);
            let responsObj = [];
            let csvStream = csv
                .parse()
                .on("data", function (data) {
                    responsObj.push(data);
                })
                .on("end", function () {
                    // Remove Header ROW
                    responsObj.shift();

                    if (responsObj.length > 0) {
                        var i = 0;
                        responsObj.forEach(element => {
                            let cjStoreObj = {
                                "affiliated_store_id": element[0],
                                "store_status": element[2],
                                "store_name": element[1],
                                "store_website": element[6],
                                "store_parent_categories": element[3],
                                "child_categories": element[4],
                                "network": "LS",
                                "shareSale_linkurl": element[12],
                            }

                            async.waterfall([
                                insertLSStoreList(cjStoreObj)
                            ], function (error, success) {
                                if (error) {
                                    console.log(` ERROR: ${error}`)
                                }
                            });

                            i++;
                            if (responsObj.length == i) {
                                res.status(200).json({
                                    statusCode: 200,
                                    msg: "Data insert has been successfully"
                                })
                            }
                        });
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: "Data is not available"
                        })
                    }
                });

            stream.pipe(csvStream);

            /*************/
        })
    },
}

