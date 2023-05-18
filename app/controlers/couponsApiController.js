var couponsModel = require('../models/couponsModel');
var async = require('async');
var CryptoJS = require("crypto-js");
const common = require('../../config/common');
var fs = require("fs");
var path = require('path');
const csv = require('fast-csv');

var dir = path.join(__dirname, '../../public');
const axios = require('axios');
const xml2js = require('xml2js');
const {readFile } = require('fs');
var dateTime = require('node-datetime');

var insertCouponAPIList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                couponsModel.insertCouponList(obj, (result, err) => {
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

var importCouponTomysql = function (obj) { // w
    return function (callback) {
        if (obj) {
            const productRes = new Promise((resolve, reject) => {
                couponsModel.entryCoupon(obj, (result, err) => {
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

module.exports = {
    async getCouponFromCouponORGAPI(req, res) {
        try {
            //var api_url = "https://couponapi.org/api/getIncrementalFeed/?API_KEY=" + common.couponAPIKey + "&incremental=1&format=json"; //&last_extract=1675829196
            //var response = await axios.get(api_url);
            //console.log(response);
            //response.data.result == true
            var d = 1;
            if (d) {
                readFile(dir + '/config/csvjson.json', (error, data) => {
                    if (error) {
                        console.log(error);
                        return;
                    }
                    const parsedData = JSON.parse(data);
                    
                    if (parsedData.length > 0) {
                        var i = 0;
                        parsedData.forEach(element => {
                            let dt = dateTime.create();
                            let formatted = dt.format('Y-m-d H:M:S');
                            let endDate = element['end_date'];
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
                                var datetime = currentdate.getFullYear() + "-" + mm
                                    + "-" + currentdate.getDate() + " "
                                    + currentdate.getHours() + ":"
                                    + currentdate.getMinutes() + ":" + currentdate.getSeconds();
                                differentDays = 1;
                                endDateVal = datetime;
                            }
                            //console.log("==CouponAPI====endDateVal===", endDateVal)

                            let coupon_code_status = (differentDays >= 1 ? 'active' : 'Inactive');
                            let site_status = (coupon_code_status == 'Inactive' ? '0' : '1');

                            let network = "";
                            if(element['source'] == "impact"){
                                network = "IR";
                            } else if(element['source'] == "cj") {
                                network = "CJ";
                            } else if(element['source'] == "shareasale") {
                                network = "SS";
                            } 
                            if (element['code'] != "" && network != "") {
                                let couponObj = {
                                    "link_id"   : element['offer_id'],
                                    "store_name": element['store'],
                                    "category"  : element['categories'].replace(/['"]+/g, ''),
                                    "coupon_code": element['code'].replace(/['"]+/g, ''),
                                    "start_date": element['start_date'],
                                    "end_date"  : endDateVal,
                                    "commission": element['title'].replace(/['"]+/g, ''),
                                    "clickUrl"  :  element['affiliate_link'].replace(/['"]+/g, ''),
                                    "description": element['description'].replace(/['"]+/g, ''),
                                    "coupon_code_status": coupon_code_status,
                                    "site_status": site_status,
                                    "lavel": element['label'].replace(/['"]+/g, ''),
                                    "rating": element['rating'],
                                    "coupon_img_link": element['image_url'].replace(/['"]+/g, ''),
                                    "network" : network,
                                    "couponApistatus": element['status']
                                }
                                
                                console.log(couponObj)
                                async.waterfall([
                                    insertCouponAPIList(couponObj)
                                ], function (error, success) {
                                    if (error) {
                                        console.log(` ERROR: ${error}`)
                                    }
                                });
                            }

                            i++;
                            if (parsedData.length == i) {
                                res.status(200).json({
                                    statusCode: 200,
                                    msg: "Coupon insert has been successfully"
                                })
                            }
                        });
                    }
                });
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: "Coupon is not avaliable"
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
    async defaultEndDateUpdate(req, res) {
        let name = "";
        try {
            const rs = new Promise((resolve, reject) => {
                couponsModel.defaultEndDateUpdate(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let couponStatus = await rs;

            if (couponStatus == 'S') {
                console.log("Blank end-date are updated")
            } else {
                console.log("Blank end-date are not updated")
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async checkExpireCoupon(req, res) {
        let name = "";
        try {
            const rs = new Promise((resolve, reject) => {
                couponsModel.checkExpireCoupon(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let couponStatus = await rs;

            if (couponStatus == 'S') {
                console.log("Expire coupon has been updateded")
            } else { 
                console.log("Expire coupon has not been updateded")
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async changeStoreTypeForSEASON(req, res) { //Next 2 month avaliable coupon store list
        let name = "";
        try {
            const rs = new Promise((resolve, reject) => {
                couponsModel.changeStoreTypeForSEASON(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let couponStatus = await rs;

            if (couponStatus == 'S') {
                console.log("Store type has been updateded for SEASON type-4")
            } else { 
                console.log("Store type has not been updateded for SEASON type-4")
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async changeStoreTypeForTop(req, res) { //More avaliable coupon store list type -1(Top)
        let name = "";
        try {
            const rs = new Promise((resolve, reject) => {
                couponsModel.changeStoreTypeForTop(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let couponStatus = await rs;

            if (couponStatus == 'S') {
                console.log("Store type has been updateded for Top type-1")
            } else { 
                console.log("Store type has not been updateded for Top type-1")
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async changeStoreTypeForHot(req, res) { //More avaliable coupon store list type -2(Hot)
        let name = "";
        try {
            const rs = new Promise((resolve, reject) => {
                couponsModel.changeStoreTypeForHot(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let couponStatus = await rs;

            if (couponStatus == 'S') {
                console.log("Store type has been updateded for Top type-2")
            } else { 
                console.log("Store type has not been updateded for Top type-2")
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async importCSVCouponData(req, res) {
        let couponList;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(400).send('No files were uploaded.');
        }

        couponList = req.files.couponList;
        uploadPath = dir + '/couponList/' + couponList.name;
        // Use the mv() method to place the file somewhere on your server
        couponList.mv(uploadPath, function (err) {
            if (err)
                return res.status(500).send(err);
            /***********/
            let stream = fs.createReadStream(uploadPath);
            let csvData = [];
            let csvStream = csv
                .parse()
                .on("data", function (data) {
                    csvData.push(data);
                })
                .on("end", function () {
                    // Remove Header ROW
                    csvData.shift();

                    if (csvData.length > 0) {
                        let i = 0;
                        csvData.forEach(function (currentValue, index, arr) {
                            let affiliated_store_id    = currentValue[0];
                            let coupon_code            = currentValue[1];
                            let lavel           = currentValue[2];
                            let description     = currentValue[3];
                            let clickUrl        = currentValue[4];
                            let endDate         = currentValue[5];
                            let endTime         = currentValue[6];
                            let network         = currentValue[7];

                            let randomNumber = Math.floor(100 + Math.random() * 900);

                            let obj = {
                                'affiliated_coupon_id' : affiliated_store_id+''+randomNumber,
                                'affiliated_store_id': affiliated_store_id,
                                'coupon_code': coupon_code,
                                'lavel': lavel,
                                'description': description.replace(/['"]+/g, ''),
                                'clickUrl': clickUrl,
                                'endDate': endDate+' '+endTime,
                                'network' : network
                            }
                            console.log('obj', obj);
                            i++;
                            async.waterfall([
                                importCouponTomysql(obj)
                            ], function (error, success) {
                                if (error) { res.send('Something is wrong!'); }
                            });


                            if (csvData.length == i) {
                                res.status(200).json({
                                    statusCode: 200,
                                    msg: 'Import successfully.'
                                })
                            }
                        })
                    }
                });

            stream.pipe(csvStream);
            /*************/
        })
    },
}