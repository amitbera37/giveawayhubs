var impactModel = require('../models/impactModel');
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

var insertIMStoreList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                impactModel.insertIMStoreList(obj, (result, err) => {
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
var insertIMCouponList = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                impactModel.insertIMCouponList(obj, (result, err) => {
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
async function importDeal(affiliated_store_id, CampaignId, shareSale_linkurl) { // w
    var username = affiliatedToken.impactSID;
    var password = affiliatedToken.impactToken;
    var auth = "Basic " + Buffer.from(username + ":" + password).toString("base64");
    var headers = {
        Authorization: auth
    };

    if (CampaignId != '') {
        var api_url = "https://api.impact.com/Mediapartners/" + affiliatedToken.impactSID + "/Campaigns/" + CampaignId + "/Deals";
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
                    let respons = personObject['ImpactRadiusResponse'].Deals;
                    var totalObj = [];
                    respons.forEach(element => {
                        if (element['$'].total > 0) {
                            totalObj = element.Deal
                        }
                    });
                    //console.log("===totalObj2==", totalObj);
                    if (totalObj.length > 0) {
                        var i = 0;
                        totalObj.forEach(element => {
                            let dt = dateTime.create();
                            let formatted = dt.format('Y-m-d H:M:S');
                            let endDate = element['EndDate'][0];
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
                            console.log("==IR====endDateVal===", endDateVal)

                            let coupon_code_status = (differentDays >= 1 ? 'active' : 'Inactive');
                            let site_status = (coupon_code_status == 'Inactive' ? '0' : '1');

                            if (element['State'][0] != "EXPIRED" && element['DefaultPromoCode'][0] != "") {
                                let cjCouponObj = {
                                    "link_id": element['Id'][0],
                                    "affiliated_store_id": affiliated_store_id,
                                    "category": element['Categories'][0].replace(/['"]+/g, ''),
                                    "coupon_code": element['DefaultPromoCode'][0].replace(/['"]+/g, ''),
                                    "start_date": element['StartDate'][0],
                                    "end_date": endDateVal,
                                    "commission": element['Name'][0].replace(/['"]+/g, ''),
                                    "clickUrl": shareSale_linkurl + '?' + element['Uri'][0].replace(/['"]+/g, ''),
                                    "description": element['Description'][0].replace(/['"]+/g, ''),
                                    "coupon_code_status": coupon_code_status,
                                    "site_status": site_status,
                                    "lavel" : element['Name'][0].replace(/['"]+/g, ''),
                                    "network": "IR"
                                }

                                async.waterfall([
                                    insertIMCouponList(cjCouponObj)
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

var insertOrderTable = function (obj) {
    return function (callback) {
        obj.forEach(function (currentValue, index, arr) {
            let commision_percent = ((currentValue['Payout'][0] * 100) / currentValue['Amount'][0]).toFixed(2)
            let cash_back_amount = 0;
            let user_id, status;
            if (currentValue['State'][0] == 'APPROVED') {
                status = 'Cashback ready to redeem';
            }
            if (currentValue['State'][0] == 'PENDING') {
                status = 'Cashback pending';
            }

            if (currentValue['SubId1'][0] == '') {
                user_id = 0;
            } else {
                user_id = currentValue['SubId1'][0];
            }
            let obj = {
                "order_id": currentValue['Id'][0],
                "user_id": user_id,
                "CampaignId": currentValue['CampaignId'][0],
                "CampaignName": currentValue['CampaignName'][0],

                "ActionTrackerName": currentValue['ActionTrackerName'][0],
                "ActionTrackerId": currentValue['ActionTrackerId'][0],
                "EventCode": currentValue['EventCode'][0],
                "State": currentValue['State'][0],
                "AdId": currentValue['AdId'][0],
                "Payout": currentValue['Payout'][0],


                "DeltaPayout": currentValue['DeltaPayout'][0],
                "IntendedPayout": currentValue['IntendedPayout'][0],
                "Amount": currentValue['Amount'][0],
                "DeltaAmount": currentValue['DeltaAmount'][0],
                "IntendedAmount": currentValue['IntendedAmount'][0],
                "Currency": currentValue['Currency'][0],

                "ReferringDate": currentValue['ReferringDate'][0],
                "EventDate": currentValue['EventDate'][0],
                "CreationDate": currentValue['CreationDate'][0],
                "LockingDate": currentValue['LockingDate'][0],
                "ClearedDate": currentValue['ClearedDate'][0],
                "ReferringType": currentValue['ReferringType'][0],


                "ReferringDomain": currentValue['ReferringDomain'][0],
                "PromoCode": currentValue['PromoCode'][0],
                "Oid": currentValue['Oid'][0],
                "CustomerArea": currentValue['CustomerArea'][0],
                "CustomerCity": currentValue['CustomerCity'][0],
                "CustomerRegion": currentValue['CustomerRegion'][0],

                "CustomerCountry": currentValue['CustomerCountry'][0],
                "SubId1": currentValue['SubId1'][0],
                "SubId2": currentValue['SubId2'][0],
                "SubId3": currentValue['SubId3'][0],
                "SharedId": currentValue['SharedId'][0],
                "Uri": currentValue['Uri'][0],

                "affiliate_type": "IR",
                "State_status": status,
            }
            console.log("==============obj==========", obj);
            impactModel.insertOrderHistory(obj);

        });

    }
}

module.exports = {
    async getALLStoreList(req, res) {
        var username = affiliatedToken.impactSID;
        var password = affiliatedToken.impactToken;
        var auth = "Basic " + Buffer.from(username + ":" + password).toString("base64");
        let headers = {
            Authorization: auth
        };

        var api_url = "https://api.impact.com/Mediapartners/" + affiliatedToken.impactSID + "/Campaigns";

        try {
            var response = await axios.get(api_url, { headers: headers });
            if (response.data) {
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json); //parse json string into JS object
                    let respons = personObject['ImpactRadiusResponse'].Campaigns;

                    let totalObj = []
                    respons.forEach(element => {
                        if (element['$'].total > 0) {
                            totalObj = element.Campaign
                        }
                    });

                    //console.log("=======totalObj===", totalObj);

                    if (totalObj.length > 0) {
                        var i = 0;
                        let store_parent_categories = "";
                        let child_categories = "";
                        totalObj.forEach(element => {
                            let status = "";
                            if (element['ContractStatus'][0] == 'Active') {
                                status = "Active";
                            } else {
                                status = "Inactive";
                            }

                            let cjStoreObj = {
                                "affiliated_store_id": element['CampaignId'][0], //element['AdvertiserId'][0],
                                "store_status": status,
                                "store_name": element['CampaignName'][0].replace(/['"]+/g, ''),
                                "store_website": element['CampaignUrl'][0].replace(/['"]+/g, ''),
                                "store_parent_categories": store_parent_categories,
                                "child_categories": child_categories,
                                "CampaignId": element['CampaignId'][0],
                                "network": "IR",
                                "TrackingLink": element['TrackingLink'][0],
                                "description": element['CampaignDescription'][0].replace(/['"]+/g, '')
                            }

                            async.waterfall([
                                insertIMStoreList(cjStoreObj)
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

    async getDealbyStore(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                impactModel.getStoreId(params, (result, err) => {
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
                        importDeal(e.affiliated_store_id, e.CampaignId, e.shareSale_linkurl);
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

    async getDealbyStoreUsedByCronjobs(req, res) {
        try {
            let params = {};
            const Res = new Promise((resolve, reject) => {
                impactModel.getStoreId(params, (result, err) => {
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
                        importDeal(e.affiliated_store_id, e.CampaignId, e.shareSale_linkurl);
                    }, i * 1000)

                    i++;
                    if (advertiserIdsArr.length == i) {
                        console.log("Successfully");
                    }
                })
            } else {
                console.log("Store is not avaliable")
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    // get order data from network
    //Impacet API Start
    async impactOrderHistory(req, res, next) {
        let Startdate = new Date();
        Startdate.setDate(Startdate.getDate() - 1);
        let enddate = new Date();

        let ActionDateStart = req.body.ActionDateStart;
        let ActionDateEnd = req.body.ActionDateEnd;

        try {
            var username = affiliatedToken.impactSID;
            var password = affiliatedToken.impactToken;

            var auth = 'Basic ' + Buffer.from(username + ':' + password).toString('base64');

            let headers = {
                Authorization: auth
            };
            const api_url = "https://api.impact.com/Mediapartners/" + affiliatedToken.impactSID + "/Actions?ActionDateStart=" + ActionDateStart + "&ActionDateEnd=" + ActionDateEnd;
            const response = await axios.get(api_url, { headers: headers });

            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json); //parse json string into JS object

                    let respons = personObject['ImpactRadiusResponse'].Actions;
                    let obj;
                    respons.forEach(element => {
                        if (element['$'].total > 0) {
                            obj = element.Action
                        } else {
                            res.status(200).json({
                                statusCode: 200,
                                msg: "No data found!"
                            })
                        }

                    });

                    if (obj.length > 0) {
                        /*********Start DB. insert*/
                        async.waterfall([
                            insertOrderTable(obj)
                        ], function (error, success) {
                            if (error) {
                                console.log(` ERROR: ${error}`)
                            }
                        });

                        res.status(200).json({
                            statusCode: 200,
                            msg: "Insert successfull."
                        })
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
            //console.error(`ERROR: ${ex}`)
        }
    },

    async impactOrderDetails(req, res, next) {
        let ActionId = req.body.orderId;
        try {
            var username = affiliatedToken.impactSID;
            var password = affiliatedToken.impactToken;

            var auth = 'Basic ' + Buffer.from(username + ':' + password).toString('base64');
            let headers = {
                Authorization: auth
            };
            const api_url = "https://api.impact.com/Mediapartners/" + affiliatedToken.impactSID + "/Actions/" + ActionId + "/Items";
            const response = await axios.get(api_url, { headers: headers });

            console.log("===========response=========", response);

            if (response.data) {
                // convert XML to JSON
                xml2js.parseString(response.data, (err, result) => {
                    if (err) {
                        throw err;
                    }
                    const json = JSON.stringify(result, null, 4);
                    var personObject = JSON.parse(json); //parse json string into JS object

                    //console.log("personObject===",personObject)
                    console.log("personObject===", personObject['ImpactRadiusResponse'].ActionItems)

                    let respons = personObject['ImpactRadiusResponse'].ActionItems;
                    console.log("responsObj===", respons)
                    let obj;
                    let obj_respons = [];
                    respons.forEach(element => {
                        if (element['$'].total > 0) {
                            obj = element.ActionItem;

                            obj.forEach(element => {
                                let obj_data = {
                                    "Sku": element['Sku'][0],
                                    "ItemName": element['ItemName'][0],
                                    "Category": element['Category'][0],
                                    "Quantity": element['Quantity'][0],
                                    "Amount": element['SaleAmount'][0],
                                }
                                obj_respons.push(obj_data)
                            });


                            res.status(200).json({
                                statusCode: 200,
                                data: obj_respons
                            })
                        } else {
                            res.status(200).json({
                                statusCode: 200,
                                msg: "No data found!"
                            })
                        }

                    });
                });
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: "No data"
                })
            }

        } catch (ex) {
            //console.error(`ERROR: ${ex}`)
        }
    }

}

