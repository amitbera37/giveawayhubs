var linkShareModel = require('../models/linkShareModel');
var async = require('async');
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
//const bearerToken = require('express-bearer-token');
//const cheerio = require('cheerio');

var insertStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                linkShareModel.insertStoreList(obj, (result, err) => {
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
var insertCouponList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                linkShareModel.insertCouponList(obj, (result, err) => {
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

var updateStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                linkShareModel.updateStoreList(obj, (result, err) => {
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

async function importUrl(affiliated_store_id, token) { // w
    var auth = "Bearer " + token;
    var headers = {
        Authorization: auth
    };

    if (affiliated_store_id != '') {
        var api_url = "https://api.linksynergy.com/v2/advertisers/" + affiliated_store_id;
        var response = await axios.get(api_url, { headers: headers });
        if (response.data) {
            let storeObj = {
                "affiliated_store_id"   : affiliated_store_id,
                "store_website"         : response.data.advertiser.url,
                "network"               : "LS",
                "TrackingLink"          : "https://click.linksynergy.com/deeplink?id=ZWK8/Jf45i4&mid="+affiliated_store_id+"&murl="+response.data.advertiser.url //https%3A%2F%2Fpurple.com%2F
            }
            async.waterfall([
                updateStoreList(storeObj)
            ], function (error, success) {
                if (error) {
                    console.log(` ERROR: ${error}`)
                }
            });
        }
    }
}



module.exports = {
    async getALLStoreList(req, res) {
        var username    = affiliatedToken.linkShareClientId;
        var password    = affiliatedToken.linkShareClientSec;
        var scope       = "3891711";
        var applicationStatus = req.body.applicationStatus;
        var token       = req.body.token;

        var auth = "Bearer "+token;
        var headers = {
            Authorization: auth
        };

        var api_url = "https://api.linksynergy.com/linklocator/1.0/getMerchByAppStatus/"+applicationStatus;

        try {
            var response = await axios.get(api_url, { headers: headers });
            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json);
                    let totalObj = personObject['ns1:getMerchByAppStatusResponse']['ns1:return'];
                    
                    if (totalObj.length > 0) {
                        var i = 0;
                        let store_parent_categories = "";
                        let child_categories = "";
                        totalObj.forEach(element => {
                            //console.log("===========xxx=====", element['ns1:offer'][0]);
                            let status = "";
                            if( element['ns1:applicationStatus'][0] =="Approved"){
                                status = "Active";
                            } else {
                                status = "Inactive";
                            }
                            
                            let storeObj = {
                                "affiliated_store_id"   : element['ns1:mid'][0],
                                "store_status"          : status,
                                "store_name"            : element['ns1:name'][0].replace(/['"]+/g, ''),
                                "store_website"         : "",
                                "store_parent_categories": "",
                                "child_categories"      : child_categories,
                                "network"               : "LS",
                                "TrackingLink"          : "https://click.linksynergy.com/deeplink?id=ZWK8/Jf45i4&mid="+element['ns1:mid'][0]+"&murl=", //https%3A%2F%2Fpurple.com%2F
                                "network_approve_type"  : "CK"
                            }

                            console.log("==========storeObj====", storeObj);

                            async.waterfall([
                                insertStoreList(storeObj)
                            ], function (error, success) {
                                if (error) {
                                    console.log(` ERROR: ${error}`)
                                }
                            });

                            i++;
                            if (totalObj.length == i) {
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

    async updateCatName(req, res) {
        var username = affiliatedToken.linkShareClientId;
        var password = affiliatedToken.linkShareClientSec;
        var scope = "3891711";
        var catId = req.body.catId;
        var token = req.body.token;

        var auth = "Bearer "+token;
        var headers = {
            Authorization: auth
        };

        
        var api_url = "https://api.linksynergy.com/linklocator/1.0/getMerchByID/"+catId;

        try {
            var response = await axios.get(api_url, { headers: headers });
            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json          = JSON.stringify(result, null, 4);
                    var personObject    = JSON.parse(json);
                    console.log("==========personObject===", personObject);

                    let totalObj        = personObject['ns1:getMerchByIDResponse']['ns1:return'];
                    console.log("==========totalObj===", totalObj);
                    
                    // if (totalObj.length > 0) {
                    //     var i = 0;
                    //     let store_parent_categories = "";
                    //     let child_categories = "";
                    //     totalObj.forEach(element => {
                    //         console.log("===========xxx=====", element['ns1:offer'][0]);
                            
                    //         let storeObj = {
                    //             "affiliated_store_id"   : element['ns1:mid'][0],
                    //             "store_status"          : element['ns1:applicationStatus'][0],
                    //             "store_name"            : element['ns1:name'][0].replace(/['"]+/g, ''),
                    //             "store_website"         : "",
                    //             "store_parent_categories": element['ns1:categories'][0],
                    //             "child_categories"      : child_categories,
                    //             "network"               : "linkShare",
                    //             "TrackingLink"          : ""
                    //         }

                    //         console.log("==========storeObj====", storeObj);

                    //         // async.waterfall([
                    //         //     insertStoreList(storeObj)
                    //         // ], function (error, success) {
                    //         //     if (error) {
                    //         //         console.log(` ERROR: ${error}`)
                    //         //     }
                    //         // });

                    //         i++;
                    //         if (totalObj.length == i) {
                    //             res.status(200).json({
                    //                 statusCode: 200,
                    //                 msg: "Data insert has been successfully"
                    //             })
                    //         }
                    //     });
                    // } else {
                    //     res.status(200).json({
                    //         statusCode: 201,
                    //         msg: "Data is not available"
                    //     })
                    // }
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
    

    async getCouponbyStore(req, res) {
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
                        // convert it to a JSON string
                        const json = JSON.stringify(result, null, 4);
                        var personObject = JSON.parse(json); //parse json string into JS object
                        let totalObj = personObject['cj-api'].links[0].$['records-returned'];

                        console.log("==========totalObj===", totalObj);
                        if (totalObj > 0) {
                            let productListArr = personObject['cj-api'].links[0].link;
                            console.log("==========productListArr===", productListArr);
                            var i = 0;
                            productListArr.forEach(element => {
                                var dt = dateTime.create();
                                var formatted = dt.format('Y-m-d H:M:S');
                                var endDate = element['promotion-end-date'][0];
                                var timeDifference = Math.abs((new Date(endDate).getTime() - new Date(formatted).getTime()));
                                let differentDays = Math.ceil(timeDifference / (1000 * 3600 * 24));


                                let coupon_code_status = (differentDays >= 1 ? 'Active' : 'InActive');

                                let cjCouponObj = {
                                    "link_id": element['link-id'][0],
                                    "affiliated_store_id": element['advertiser-id'][0],
                                    "category": element['category'][0],
                                    "coupon_code": element['coupon-code'][0].replace(/['"]+/g, ''),
                                    "start_date": element['promotion-start-date'][0],
                                    "end_date": element['promotion-end-date'][0],
                                    "commission": element['sale-commission'][0].replace(/['"]+/g, ''),
                                    "clickUrl": element['clickUrl'][0].replace(/['"]+/g, ''),
                                    "description": element['description'][0].replace(/['"]+/g, ''),
                                    "coupon_code_status": coupon_code_status,
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
                msg: "Request failed with status code 400"
            })
        }
    },

    async updateURL(req, res) {
        var username = affiliatedToken.linkShareClientId;
        var password = affiliatedToken.linkShareClientSec;
        var scope =  "3999003";// "3891711";
        var token = req.body.token;

        var auth = "Bearer " + token;
        var headers = {
            Authorization: auth
        };


        try {
            //start 
            let params = {};
            const Res = new Promise((resolve, reject) => {
                linkShareModel.getStoreId(params, (result, err) => {
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
                        importUrl(e.affiliated_store_id, token);
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


    // async webScraping(req, res) {

    //     const url = `https://www.amazon.in/?&ext_vrnc=hi&tag=googhydrabk1-21&ref=pd_sl_4d1ohbptwj_e&adgrpid=58490306106&hvpone=&hvptwo=&hvadid=486391490878&hvpos=&hvnetw=g&hvrand=8621823182181392564&hvqmt=e&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=1007828&hvtargid=kwd-298187295805&hydadcr=5657_2175734&gclid=Cj0KCQjw0JiXBhCFARIsAOSAKqAQPOp3nes61FC8RqZEcQjFvvUvM6GLBfip1HIDNyjnVdFj_d9KpjkaAih-EALw_wcB`;
    //     //const url = `https://staging.couponknight.com/`;
    //     try {
    //         const response = await axios.get(url);
    //         const $ = cheerio.load(response.data);
    //         console.log("======response=====", response.data);

    //         const noOfProperties = $('h1>strong').text();
    //         console.log(`===============hellow ==================${noOfProperties} `);
    //     } catch (e) {
    //         console.error(`Error while fetching rental properties for - ${e.message}`);
    //     }
    // },

}

