var cjModel = require('../models/cjModel');
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

var insertCJStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                cjModel.insertCJStoreList(obj, (result, err) => {
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
var insertCJCouponList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                cjModel.insertCJCouponList(obj, (result, err) => {
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
    async getALLStoreList(req, res) {
        let pageNo = req.body.pageNo;
        let headers = {
            Authorization: `Bearer ` + affiliatedToken.cjToken,
        };
        var api_url = "https://advertiser-lookup.api.cj.com/v2/advertiser-lookup?requestor-cid=" + affiliatedToken.cjCID + "&advertiser-ids=joined&records-per-page=100&page-number=" + pageNo;

        try {
            var response = await axios.get(api_url, { headers: headers });
            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json); //parse json string into JS object
                    let totalObj = personObject['cj-api'].advertisers[0].$['records-returned'];

                    if (totalObj > 0) {
                        /*********Start DB. insert*/
                        let productListArr = personObject['cj-api'].advertisers[0].advertiser;
                        console.log("====productListArr===", productListArr);

                        var i = 0;
                        let store_parent_categories = "";
                        let child_categories = "";
                        let status = "";
                        productListArr.forEach(element => {
                            if (element['account-status'][0] == 'Active') {
                                status = "Active";
                            } else {
                                status = "Inactive";
                            }
                            if (element['primary-category'][0] != '') {
                                if (Object.keys(element['primary-category'][0]['parent']).length > 0) {
                                    store_parent_categories = element['primary-category'][0]['parent'].toString().replace(/['"]+/g, '');
                                }
                                if (Object.keys(element['primary-category'][0]['child']).length > 0) {
                                    child_categories = element['primary-category'][0]['child'].toString().replace(/['"]+/g, '');
                                }
                            }

                            let cjStoreObj = {
                                "affiliated_store_id": element['advertiser-id'][0],
                                "store_status": status,
                                "store_name": element['advertiser-name'][0].replace(/['"]+/g, ''),
                                "store_website": element['program-url'][0].replace(/['"]+/g, ''),
                                "store_parent_categories": store_parent_categories,
                                "child_categories": child_categories,
                                "network": "CJ",
                                "TrackingLink": "https://www.jdoqocy.com/links/" + affiliatedToken.CJWebsiteId + "/type/dlg/" + element['program-url'][0].replace(/['"]+/g, '')
                            }

                            async.waterfall([
                                insertCJStoreList(cjStoreObj)
                            ], function (error, success) {
                                if (error) {
                                    console.log(` ERROR: ${error}`)
                                }
                            });


                            i++;
                            if (productListArr.length == i) {
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
        let headers = {
            Authorization: `Bearer ` + affiliatedToken.cjToken,
        };

        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                cjModel.getStoreId(params, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let advertiserIdsArr = await Res;
            if (advertiserIdsArr.length > 0) {
                const affiliatedStoreIds = advertiserIdsArr.map(a => `${Object.values(a).join(",")}`)
                    .join(",")

                var api_url = "https://link-search.api.cj.com/v2/link-search?website-id=" + affiliatedToken.CJWebsiteId + "&promotion-type=coupon&advertiser-ids=" + affiliatedStoreIds;
                var response = await axios.get(api_url, { headers: headers });
                if (response.data) {
                    // convert XML to JSON
                    xml2js.parseString(response.data, (err, result) => {
                        if (err) {
                            throw err;
                        }
                        if (Object.keys(result).length != 0 && result.constructor === Object) {
                            // convert it to a JSON string
                            const json = JSON.stringify(result, null, 4);
                            var personObject = JSON.parse(json); //parse json string into JS object
                            let totalObj = personObject['cj-api'].links[0].$['records-returned'];

                            if (totalObj > 0) {
                                let productListArr = personObject['cj-api'].links[0].link;

                                var i = 0;
                                productListArr.forEach(element => {
                                    let dt = dateTime.create();
                                    let formatted = dt.format('Y-m-d H:M:S');
                                    let endDate = element['promotion-end-date'][0];
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

                                    console.log("====endDateVal====", endDateVal);
                                    let coupon_code_status = (differentDays >= 1 ? 'active' : 'Inactive');
                                    let site_status = (coupon_code_status == 'Inactive' ? '0' : '1');

                                    let cjCouponObj = {
                                        "link_id": element['link-id'][0],
                                        "affiliated_store_id": element['advertiser-id'][0],
                                        "category": element['category'][0],
                                        "coupon_code": element['coupon-code'][0].replace(/['"]+/g, ''),
                                        "start_date": element['promotion-start-date'][0],
                                        "end_date": endDateVal,
                                        "commission": element['sale-commission'][0].replace(/['"]+/g, ''),
                                        "clickUrl": element['clickUrl'][0].replace(/['"]+/g, ''),
                                        "description": element['description'][0].replace(/['"]+/g, ''),
                                        "coupon_code_status": coupon_code_status,
                                        "site_status": site_status,
                                        "network": "CJ"
                                    }

                                    async.waterfall([
                                        insertCJCouponList(cjCouponObj)
                                    ], function (error, success) {
                                        if (error) {
                                            console.log(` ERROR: ${error}`)
                                        }
                                    });

                                    i++;
                                    if (productListArr.length == i) {
                                        res.status(200).json({
                                            statusCode: 200,
                                            msg: "Coupon insert has been successfully"
                                        })
                                    }
                                });
                            } else {
                                res.status(200).json({
                                    statusCode: 201,
                                    msg: "Coupon is not avaliable."
                                })
                            }
                        } else {
                            res.status(200).json({
                                statusCode: 201,
                                msg: "Coupon is not avaliable."
                            })
                        }
                    });
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: "Coupon is not avaliable."
                    })
                }
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
                msg: ex
            })
        }
    },

    async getDealbyStoreUseByCronJobs(req, res) {
        let headers = {
            Authorization: `Bearer ` + affiliatedToken.cjToken,
        };

        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                cjModel.getStoreId(params, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let advertiserIdsArr = await Res;
            if (advertiserIdsArr.length > 0) {
                const affiliatedStoreIds = advertiserIdsArr.map(a => `${Object.values(a).join(",")}`)
                    .join(",")

                var api_url = "https://link-search.api.cj.com/v2/link-search?website-id=" + affiliatedToken.CJWebsiteId + "&promotion-type=coupon&advertiser-ids=" + affiliatedStoreIds;
                var response = await axios.get(api_url, { headers: headers });
                if (response.data) {
                    // convert XML to JSON
                    xml2js.parseString(response.data, (err, result) => {
                        if (err) {
                            throw err;
                        }
                        if (Object.keys(result).length != 0 && result.constructor === Object) {
                            // convert it to a JSON string
                            const json = JSON.stringify(result, null, 4);
                            var personObject = JSON.parse(json); //parse json string into JS object
                            let totalObj = personObject['cj-api'].links[0].$['records-returned'];

                            if (totalObj > 0) {
                                let productListArr = personObject['cj-api'].links[0].link;

                                var i = 0;
                                productListArr.forEach(element => {
                                    let dt = dateTime.create();
                                    let formatted = dt.format('Y-m-d H:M:S');
                                    let endDate = element['promotion-end-date'][0];
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

                                    console.log("====endDateVal====", endDateVal);
                                    let coupon_code_status = (differentDays >= 1 ? 'active' : 'Inactive');
                                    let site_status = (coupon_code_status == 'Inactive' ? '0' : '1');

                                    let cjCouponObj = {
                                        "link_id": element['link-id'][0],
                                        "affiliated_store_id": element['advertiser-id'][0],
                                        "category": element['category'][0],
                                        "coupon_code": element['coupon-code'][0].replace(/['"]+/g, ''),
                                        "start_date": element['promotion-start-date'][0],
                                        "end_date": endDateVal,
                                        "commission": element['sale-commission'][0].replace(/['"]+/g, ''),
                                        "clickUrl": element['clickUrl'][0].replace(/['"]+/g, ''),
                                        "description": element['description'][0].replace(/['"]+/g, ''),
                                        "coupon_code_status": coupon_code_status,
                                        "site_status": site_status,
                                        "network": "CJ"
                                    }

                                    async.waterfall([
                                        insertCJCouponList(cjCouponObj)
                                    ], function (error, success) {
                                        if (error) {
                                            console.log(` ERROR: ${error}`)
                                        }
                                    });

                                    i++;
                                    if (productListArr.length == i) {
                                        console.error("Coupon insert has been successfully");
                                    }
                                });
                            } else {
                                console.error("Coupon is not avaliable.")
                            }
                        } else {
                            console.error("Coupon is not avaliable.")
                        }
                    });
                } else {
                    console.error("Coupon is not avaliable.")
                }
            } else {
                console.error("Store is not avaliable.")
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

}

