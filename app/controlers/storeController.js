var categories = require('../models/categoriesModel');
var storeModel = require('../models/storeModel');
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
var insertRedisServerForStorePage = function (name, obj, storeRsU, rs2) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            let ob = {
                "obj" : obj,
                "storeList": storeRsU,
                "seo": rs2,
            }
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(ob));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForListByCharecter = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForDetailsStore = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForPopularStore = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForHomeStore = function (name, Hot_deals_coupon_StoreU, FAVORITE_DEALS_OF_THE_SEASONU, DEALS_OF_THE_WEEKU, rs2) { // w
    return function (callback) {
        if (Object.keys(TRENDING2XU).length > 0) {
            var obj = {
                Hot_deals_coupon_Store: Hot_deals_coupon_StoreU,
                FAVORITE_DEALS_OF_THE_SEASON: FAVORITE_DEALS_OF_THE_SEASONU,
                DEALS_OF_THE_WEEK: DEALS_OF_THE_WEEKU,
                seo: rs2
            }
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForCouponPage = function (name, TOP_DEALS_CouponU, FEATUREDU, POPULAR_DEALS_CouponU, rs2) { // w
    return function (callback) {
        if (Object.keys(TOP_DEALS_CouponU).length > 0) {
            var obj = {
                TOP_DEALS_Coupon: TOP_DEALS_CouponU,
                FEATURED: FEATUREDU,
                POPULAR_DEALS_Coupon: POPULAR_DEALS_CouponU,
                seo: rs2
            }
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*23;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

var insertRedisServerForCouponDetails = function (name, obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            redisClient.then((client) => { 
                client.set(name, JSON.stringify(obj));
                var timeOut = 60*60*16;
                client.expire(name, timeOut);
              });
        } else {
            callback('err');
        }
    }
}

module.exports = {
    async storePage(req, res) {
        let name = "";
        try {
            const storeRes = new Promise((resolve, reject) => {
                storeModel.getTopStore(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('Store ERROR')
                    }
                })
            });
            let storeRs = await storeRes;

            let storeNameArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "0-9"]
            //get seo key work
            const catRes1 = new Promise((resolve, reject) => {
                categories.getHomeSeo('all', (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs2 = await catRes1;

            //
            const catRes2 = new Promise((resolve, reject) => {
                storeModel.listByCharecter("A", (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs3 = await catRes2;

            rs3.sort(function (a, b) {
                if (a.store_name < b.store_name) { return -1; }
                if (a.store_name > b.store_name) { return 1; }
                return 0;
            })

            let storeRsU = rs3.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])

            let obj = {
                "storeNameArr": storeNameArr,
                "storeTopList": storeRs
            }

            if (storeRs.length > 0) {

                // async.waterfall([
                //     insertRedisServerForStorePage("store_page", obj, storeRsU, rs2)
                // ], function (error, success) {
                //    if (error) {
                //        console.log(` ERROR: ${error}`)
                //    }
                // });

                let encryptObj = {
                    data: obj,
                    storeList: storeRsU,
                    seo: rs2,
                    storeImgUrl: common.storeImgUrl,
                    catImgUrl: common.catImgUrl
                };

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);
                

                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString()
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    data: []
                })
            }

        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async listByCharecter(req, res) {
        let nameEncryp = req.body.name;

        let decrypted = CryptoJS.AES.decrypt(nameEncryp, common.encryptKey);
        let someStr = decrypted.toString(CryptoJS.enc.Utf8);
        
        var name = someStr.replace(/['"]+/g, '');
        console.log(name);

        try {
            const catRes = new Promise((resolve, reject) => {
                storeModel.listByCharecter(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs = await catRes;
            if (rs.length > 0) {
                rs.sort(function (a, b) {
                    if (a.store_name < b.store_name) { return -1; }
                    if (a.store_name > b.store_name) { return 1; }
                    return 0;
                })

                let storeRsU = rs.reduce((unique, o) => {
                    if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                        unique.push(o);
                    }
                    return unique;
                }, [])

                // async.waterfall([
                //     insertRedisServerForListByCharecter("listByCharecter_"+name,  storeRsU)
                // ], function (error, success) {
                //    if (error) {
                //        console.log(` ERROR: ${error}`)
                //    }
                // });

                let encryptObj = {
                    data: storeRsU,
                    storeImgUrl: common.storeImgUrl
                };

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);
                

                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString()
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    data: 'Data not found'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getDetailstoStore(req, res) {
        let affiliatedIdEncryp = req.body.affiliatedId;

        let decrypted = CryptoJS.AES.decrypt(affiliatedIdEncryp, common.encryptKey);
        let affiliatedId = decrypted.toString(CryptoJS.enc.Utf8);
    
        try {
            if (affiliatedId != "") {
                const rs = new Promise((resolve, reject) => {
                    storeModel.getStoreDetails(affiliatedId, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let storeDetails = await rs;
                    
                if (storeDetails.length > 0) {
                    var ID = storeDetails[0].affiliated_store_id;
                    const couRes = new Promise((resolve, reject) => {
                        storeModel.getCouponDetails(ID, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });
                    let couponRs = await couRes;
    
                    let obj = {
                        "storeDetails"      : storeDetails[0],
                        "couponDetails"     : couponRs,
                        "storeImgUrl"       : common.storeImgUrl,
                        "couponImgUrl"      : common.couponImgUrl
                    };

                    // async.waterfall([
                    //     insertRedisServerForDetailsStore("detailsStore_"+affiliatedId,  obj)
                    // ], function (error, success) {
                    //    if (error) {
                    //        console.log(` ERROR: ${error}`)
                    //    }
                    // });

                    var encrypted = CryptoJS.AES.encrypt(JSON.stringify(obj), common.encryptKey);
                    res.status(200).json({
                        statusCode: 200,
                        data: encrypted.toString()
                    })       
                     
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
    async getHomePage(req, res) {
        let name = "";
        try {
            //HOT DEALS
            const storeRes5 = new Promise((resolve, reject) => {
                storeModel.get_TOP_DEALS_Store(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let Hot_deals_coupon_Store = await storeRes5;
            let Hot_deals_coupon_StoreU = Hot_deals_coupon_Store.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])

            // SOME OF OUR FAVORITE DEALS OF THE SEASON
            const storeRes6 = new Promise((resolve, reject) => {
                storeModel.get_FAVORITE_DEALS_OF_THE_SEASON_coupon_Store(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let FAVORITE_DEALS_OF_THE_SEASON = await storeRes6;
            let FAVORITE_DEALS_OF_THE_SEASONU = FAVORITE_DEALS_OF_THE_SEASON.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])

            //DEALS OF THE WEEK
            const storeRes7 = new Promise((resolve, reject) => {
                storeModel.getDEALS_OF_THE_WEEKStore(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let DEALS_OF_THE_WEEK = await storeRes7;
            let DEALS_OF_THE_WEEKU = DEALS_OF_THE_WEEK.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])

            const catRes1 = new Promise((resolve, reject) => {
                categories.getHomeSeo('Home', (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs2 = await catRes1;

            if ( FAVORITE_DEALS_OF_THE_SEASONU.length > 0) {
                let encryptObj = {
                    Hot_deals_coupon_Store: Hot_deals_coupon_StoreU,
                    FAVORITE_DEALS_OF_THE_SEASON: FAVORITE_DEALS_OF_THE_SEASONU,
                    DEALS_OF_THE_WEEK: DEALS_OF_THE_WEEKU,
                    seo: rs2,
                    storeImgUrl: common.storeImgUrl,
                };

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);

                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString(),
                    msg:"No chache"
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    data: "No record found!"
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getCouponPage(req, res) {
        let name = "";
        try {
            //FEATURED STORES
            const storeRes2 = new Promise((resolve, reject) => {
                storeModel.get_FEATURED_Store(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let FEATURED = await storeRes2;
            let FEATUREDU = FEATURED.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])


            // POPULAR DEALS
            const storeRes3 = new Promise((resolve, reject) => {
                storeModel.get_POPULAR_DEALS_Store(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let POPULAR_DEALS_Coupon = await storeRes3;
            let POPULAR_DEALS_CouponU = POPULAR_DEALS_Coupon.reduce((unique, o) => {
                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                    unique.push(o);
                }
                return unique;
            }, [])

            const catRes1 = new Promise((resolve, reject) => {
                categories.getHomeSeo('deals', (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let rs2 = await catRes1;

            if ( FEATURED.length > 0 || POPULAR_DEALS_Coupon.length > 0) {
                let encryptObj = {
                    FEATURED: FEATUREDU,
                    POPULAR_DEALS_Coupon: POPULAR_DEALS_CouponU,
                    seo: rs2,
                    storeImgUrl: common.storeImgUrl,
                    couponImgUrl: common.couponImgUrl
                };

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);

                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString()
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    data: "No record found!"
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getPopularStore(req, res) {
        let name = "";
        try {
            const storeRes = new Promise((resolve, reject) => {
                storeModel.getPopularStore(name, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });

            let storeRs = await storeRes;

            if (storeRs.length > 0) {
                let storeRsU = storeRs.reduce((unique, o) => {
                    if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                        unique.push(o);
                    }
                    return unique;
                }, [])

                storeRsU.sort(function (a, b) {
                    if (a.store_name < b.store_name) { return -1; }
                    if (a.store_name > b.store_name) { return 1; }
                    return 0;
                })

                // async.waterfall([
                //     insertRedisServerForPopularStore("popularStore", storeRsU)
                // ], function (error, success) {
                //    if (error) {
                //        console.log(` ERROR: ${error}`)
                //    }
                // });

                let encryptObj = {
                    data: storeRsU,
                    storeImgUrl: common.storeImgUrl
                };

                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(encryptObj), common.encryptKey);

                res.status(200).json({
                    statusCode: 200,
                    encryptObj: encrypted.toString()
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    data: "No record found!"
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    //New
    async getMarchantLink(req, res) {
        let couponIdEncryp = req.body.couponId;
        let decrypted = CryptoJS.AES.decrypt(couponIdEncryp, common.encryptKey);
        let couponId = decrypted.toString(CryptoJS.enc.Utf8);
    
        try {
            if (couponId != "") {
                const couRes = new Promise((resolve, reject) => {
                    storeModel.getCouponDetailsByIdForMarchentLink(couponId, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let couponRs = await couRes;
    
                
    
                if (couponRs.length > 0) {
                    let obj = {
                        "couponDetails": couponRs
                    };

                    var encrypted = CryptoJS.AES.encrypt(JSON.stringify(obj), common.encryptKey);
                    res.status(200).json({
                        statusCode: 200,
                        data: encrypted.toString()
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Data not found'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send a couponId ID.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getSearchResult(req, res) {
        let searchValEncryp   = req.body.searchVal;
        let decrypted = CryptoJS.AES.decrypt(searchValEncryp, common.encryptKey);
        let someStr = decrypted.toString(CryptoJS.enc.Utf8);
        var searchVal = someStr.replace(/['"]+/g, '');


        let pageNoEncryp      = req.body.pageNo;
        let decrypted1 = CryptoJS.AES.decrypt(pageNoEncryp, common.encryptKey);
        let pageStr = decrypted1.toString(CryptoJS.enc.Utf8);
        var pageNo = pageStr.replace(/['"]+/g, '');

        let perPageRec  = 10;

        let ofset = 0;
        if (pageNo > 1) {
            ofset = (perPageRec * (pageNo - 1));
        }

        try {
            if (searchVal != "") {
                // totalCount
                const couTotalRes = new Promise((resolve, reject) => {
                    storeModel.getSearchTotalResult(searchVal, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let totalRs = await couTotalRes;

                let couponTotalRs = totalRs.length;

                let totalPage = "";
                let totalPageT = Math.ceil(couponTotalRs / perPageRec);
                if (totalPageT === 'Infinity') {
                    totalPage = 0;
                } else {
                    totalPage = totalPageT;
                }

                const couRes = new Promise((resolve, reject) => {
                    storeModel.getSearchResult(searchVal, perPageRec, ofset, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let couponRs = await couRes;

                if (couponRs.length > 0) {
                    let couponRsU = couponRs.reduce((unique, o) => {
                        if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id && obj.couponId === o.couponId)) {
                            unique.push(o);
                        }
                        return unique;
                    }, [])

                    let obj = {
                        "totalPage": totalPage,
                        "couponResult": couponRsU,
                        "totalNoData": couponTotalRs, 
                        "storeImgUrl": common.storeImgUrl,
                        "couponImgUrl": common.couponImgUrl
                    };

                    var encrypted = CryptoJS.AES.encrypt(JSON.stringify(obj), common.encryptKey);
                    res.status(200).json({
                        statusCode: 200,
                        data: encrypted.toString()
                    })
                } else if (couponRs.length == 0 || couponRs.length == '') {
                    // get by
                    const rs = new Promise((resolve, reject) => {
                        storeModel.getStoreDetailsBySEOName(searchVal, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });
                    let storeDetails = await rs;

                    // similar coupon
                    var similarCouponRS = [];
                    var ID = "";
                    var store_name = "";
                    var store_logo = "";
                    var seo_url = "";
                    let total = "";
                    let totalRec = "";

                    if (storeDetails.length > 0) {
                        ID = storeDetails[0].affiliated_store_id;
                        store_name = storeDetails[0].store_name;
                        store_logo = storeDetails[0].store_logo;
                        seo_url = storeDetails[0].seo_url;

                        // total
                        const couTotalRes = new Promise((resolve, reject) => {
                            storeModel.getCouponDetails(ID, (result, err) => {
                                if (result) {
                                    resolve(result);
                                } else {
                                    reject('ERROR')
                                }
                            })
                        });
                        total = await couTotalRes;
                        totalRec = total.length;

                        const couRes = new Promise((resolve, reject) => {
                            storeModel.getCouponSearchDetails(ID, perPageRec, ofset, (result, err) => {
                                if (result) {
                                    resolve(result);
                                } else {
                                    reject('ERROR')
                                }
                            })
                        });
                        similarCouponRS = await couRes;
                    }

                    let totalPage = "";
                    let totalPageT = Math.ceil(totalRec / perPageRec);
                    if (totalPageT === 'Infinity') {
                        totalPage = 0;
                    } else {
                        totalPage = totalPageT;
                    }

                    let couA = [];
                    let i = 0;

                    if(similarCouponRS.length > 0){
                        similarCouponRS.forEach(e => {
                            couA.push({
                                "store_name": store_name,
                                "store_logo": store_logo,
                                "seo_url": seo_url,
                                "couponId": e.couponId,
                                "affiliated_store_id": e.affiliated_store_id,
                                "coupon_code": e.coupon_code,
                                "commission": e.commission,
                                "start_date": e.start_date,
                                "end_date": e.end_date,
                                "network": e.network,
                                "clickUrl": e.clickUrl,
                                "description": e.description,
                                "likeCount": e.likeCount,
                                "disLikeCount": e.disLikeCount,
                                "totalComment": e.totalComment
                            })
                            i++;
                            if (similarCouponRS.length == i) {
                                let obj = {
                                    "totalPage": totalPage,
                                    "couponResult": couA,
                                    "totalNoData": totalRec, 
                                    "storeImgUrl": common.storeImgUrl,
                                    "couponImgUrl": common.couponImgUrl
                                };

                                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(obj), common.encryptKey);
                                res.status(200).json({
                                    statusCode: 200,
                                    data: encrypted.toString()
                                })
                            }
                        })
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: 'Data not found'
                        })
                    }
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Data not found'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send a couponId ID.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getAllStore(req, res) {
        let couponId = "";
        try {
            const storeRes = new Promise((resolve, reject) => {
                storeModel.getAllStore(couponId, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let storeRS = await storeRes;

            if (storeRS.length > 0) {
                var encrypted = CryptoJS.AES.encrypt(JSON.stringify(storeRS), common.encryptKey);
                res.status(200).json({
                    statusCode: 200,
                    data: encrypted.toString()
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

}

