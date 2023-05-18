const db = require('../../config/db');
const common = require('../../config/common');

module.exports = {
    registration(params, callback) {
        if (params.shareCode == "") {
            let q = "select userId from frontend_users where emailId='" + params.emailId + "'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    callback('0');
                } else {
                    let qry = `INSERT INTO frontend_users(name, emailId, password, loginType)` +
                        `values ('${params.name}', '${params.emailId}', '${params.password}', '${params.loginType}')`;

                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        callback(id);
                    })
                }
            })
        } else if (params.shareCode != "") {
            let q = "select userId from frontend_users where emailId='" + params.emailId + "'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    var id = res[0].userId;
                    let splitCode = params.shareCode.split("_");
                    if (splitCode[0] == 'code') {
                        let qry2 = `INSERT INTO sharecode_accept_by_user(shareCodeId, accept_user_id)` +
                            `values ('${params.shareCode}', '${id}')`;

                        db.query(qry2, (err2, res2) => {
                            if (err2) throw err2;
                            callback(id);
                        })
                    } else {
                        callback("err");
                    }
                } else {
                    let qry = `INSERT INTO frontend_users(name, emailId, password, loginType)` +
                        `values ('${params.name}', '${params.emailId}', '${params.password}', '${params.loginType}')`;

                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        var id = res1.insertId;
                        let splitCode = params.shareCode.split("_");
                        if (splitCode[0] == 'code') {
                            let qry2 = `INSERT INTO sharecode_accept_by_user(shareCodeId, accept_user_id)` +
                                `values ('${params.shareCode}', '${id}')`;

                            db.query(qry2, (err2, res2) => {
                                if (err2) throw err2;
                                callback(id);
                            })
                        } else {
                            callback("err");
                        }
                    })

                }
            })
        }
    },
    login(params, callback) {
        if (params.shareCode == "") {
            let q = "SELECT `userId`, `name`  FROM `frontend_users` WHERE `emailId` = '" + params.emailId + "' and `password` = '" + params.password + "' and  status ='Y'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    callback(res)
                } else {
                    let v = "";
                    callback(v)
                }
            })
        } else if (params.shareCode != "") {
            let q = "SELECT `userId`, `name`  FROM `frontend_users` WHERE `emailId` = '" + params.emailId + "' and `password` = '" + params.password + "' and  status ='Y'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    let id = res[0].userId;
                    let splitCode = params.shareCode.split("_");
                    if (splitCode[0] == 'code') {
                        let qry2 = `INSERT INTO sharecode_accept_by_user(shareCodeId, accept_user_id)` +
                            `values ('${params.shareCode}', '${id}')`;
                        db.query(qry2, (err2, res2) => {
                            if (err2) throw err2;
                            callback(res)
                        })
                    }
                } else {
                    let v = "";
                    callback(v)
                }
            })
        }
    },
    socialLogin(params, callback) {
        if (params.shareCode == "") {
            let q = "SELECT `userId`, `name`  FROM `frontend_users` WHERE `emailId` = '" + params.emailId + "' and  status ='Y'";
            db.query(q, (err, res) => {
                if (err) throw err;
                var arr = [];
                if (res.length > 0) {
                    let obj = {
                        "userId": res[0].userId,
                        "name": res[0].name,
                        "type": "no"
                    };
                    arr.push(obj)

                    callback(arr)
                } else {
                    var arr = [];
                    let qry = `INSERT INTO frontend_users(name,emailId,loginType)` +
                        `values ('${params.name}', '${params.emailId}', '${params.loginType}')`;
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        let obj = {
                            "userId": id,
                            "name": params.name,
                            "type": "yes"
                        };
                        arr.push(obj)
                        callback(arr)
                    })
                }
            })
        } else if (params.shareCode != "") {
            let q = "SELECT `userId`, `name`  FROM `frontend_users` WHERE `emailId` = '" + params.emailId + "' and  status ='Y'";
            db.query(q, (err, res) => {
                if (err) throw err;
                var arr = [];
                if (res.length > 0) {
                    let id = res[0].userId;
                    let obj = {
                        "userId": id,
                        "name": res[0].name,
                        "type": "no"
                    };
                    arr.push(obj)

                    let splitCode = params.shareCode.split("_");
                    if (splitCode[0] == 'code') {
                        let qry2 = `INSERT INTO sharecode_accept_by_user(shareCodeId, accept_user_id)` +
                            `values ('${params.shareCode}', '${id}')`;
                        db.query(qry2, (err2, res2) => {
                            if (err2) throw err2;
                            callback(arr)
                        })
                    }
                } else {
                    var arr = [];
                    let qry = `INSERT INTO frontend_users(name,emailId,loginType)` +
                        `values ('${params.name}', '${params.emailId}', '${params.loginType}')`;

                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        let obj = {
                            "userId": id,
                            "name": params.name,
                            "type": "yes"
                        };
                        arr.push(obj)
                        let splitCode = params.shareCode.split("_");
                        if (splitCode[0] == 'code') {
                            let qry2 = `INSERT INTO sharecode_accept_by_user(shareCodeId, accept_user_id)` +
                                `values ('${params.shareCode}', '${id}')`;

                            db.query(qry2, (err2, res2) => {
                                if (err2) throw err2;
                                callback(arr);
                            })
                        }
                    })
                }
            })
        }
    },
    changePassword(params, callback) {
        let query = `UPDATE frontend_users ` +
            `SET  password = '${params.password}'` +
            ` WHERE userId =` + params.userId;

        db.query(query, (err, res) => {
            if (err) throw err;
            let q = "SELECT `emailId`  FROM `frontend_users` WHERE `userId` =" + params.userId;
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    callback(res[0].emailId)
                }
            })
        })
    },
    setPassword(params, callback) {
        let q = "select userId from frontend_users where emailId = '" + params.emailId + "'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                let q1 = "UPDATE frontend_users SET password='" + params.generatePw + "' where userId = " + res[0].userId;
                db.query(q1, (err1, res1) => {
                    if (err1) throw err1;
                    callback("Success");
                })
            } else {
                let v = [];
                callback(v)
            }
        })
    },
    profile(params, callback) {
        let q1 = "SELECT * FROM frontend_users WHERE userId =" + params.userId;
        db.query(q1, (err1, res1) => {
            if (err1) throw err1;
            if (res1.length > 0) {
                callback(res1);
            } else {
                let obj = "";
                callback(obj);
            }
        })
    },
    putProfileUpdate(params, callback) {
        let queryVal = [];

        if (params.name != "" && typeof params.name != 'undefined') {
            queryVal.push({
                "name": params.name
            });
        }
        if (params.phno != "" && typeof params.phno != 'undefined') {
            queryVal.push({
                "phno": params.phno
            });
        }
        if (params.lastName != "" && typeof params.lastName != 'undefined') {
            queryVal.push({
                "lastName": params.lastName
            });
        }
        if (params.zipCode != "" && typeof params.zipCode != 'undefined') {
            queryVal.push({
                "zipCode": params.zipCode
            });
        }
        if (params.slagName != "" && typeof params.slagName != 'undefined') {
            queryVal.push({
                "slagName": params.slagName
            });
        }
        if (params.img != "" && typeof params.img != 'undefined') {
            queryVal.push({
                "img": params.img
            });
        }
        if (params.paypalEmailId != "" && typeof params.paypalEmailId != 'undefined') {
            queryVal.push({
                "paypalEmailId": params.paypalEmailId
            });
        }
        if (params.profileImg != "" && typeof params.profileImg != 'undefined') {
            queryVal.push({
                "profileImg": params.profileImg
            });
        }
        if (params.bannerImg != "" && typeof params.bannerImg != 'undefined') {
            queryVal.push({
                "bannerImg": params.bannerImg
            });
        }

        let query = "";
        var i = 0;
        queryVal.forEach(element => {
            query += Object.keys(element) + "='" + Object.values(element) + "'";
            i++;
            if (queryVal.length != i) {
                query += ", ";
            }

        });

        let q1 = "UPDATE frontend_users SET " + query + "  where userId = " + params.userId;
        db.query(q1, (err1, res1) => {
            if (err1) throw err1;
            callback("Success");
        })
    },
    createSareCode(params, callback) {
        let qry2 = `INSERT INTO create_sharerefcode(userId, storeId, couponId, shareCode)` +
            `values ('${params.userId}', '${params.storeId}', '${params.couponId}', '${params.shareCode}')`;
        db.query(qry2, (err, res) => {
            if (err) throw err;
            let id = res.insertId;
            callback(id);
        })
    },
    getStoreId(couponId, callback) {
        let q = "SELECT `affiliated_store_id` FROM `coupon_details` WHERE id =" + couponId;

        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res[0].affiliated_store_id);
            } else {
                let v = "";
                callback(v)
            }
        })
    },
    getUserListForShareCode(userId, callback) {
        if (userId != '') {
            let q = "select y.userId, y.name, y.phno, y.emailId, y.img, x.shareCode " +
                "from " +
                "( " +
                "select b.shareCode,a.status,a.userId " +
                "from frontend_users as a " +
                "inner join create_sharerefcode as b on b.userId = a.userId " +
                ") as x " +
                "left join " +
                "( " +
                "SELECT a.userId, a.name, a.phno, a.emailId, a.img, b.shareCodeId from frontend_users as a " +
                "left join sharecode_accept_by_user as b on b.accept_user_id = a.userId " +
                "GROUP BY b.shareCodeId " +
                ") as y on x.shareCode = y.shareCodeId " +
                "WHERE x.status='Y' and x.userId =" + userId;

            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    callback(res);
                } else {
                    let d = [];
                    callback(d);
                }
            })
        }
    },
    insertBotInfo(params, callback) {
        if (params.date != "") {
            let qry = `INSERT INTO track_googlebot(date, time, url, bot, ip)` +
                `values ('${params.currentDate}', '${params.currentTime}', '${params.pageUrl}', '${params.botUser}', '${params.ipAdd}')`;

            db.query(qry, (err1, res1) => {
                if (err1) throw err1;
                let id = res1.insertId;
                callback(id);
            })
        }
    },
    getOrderInfo2(orderId, callback) {
        let q2 = "SELECT `order_history`.order_id, store_name, order_history.userId, name, Amount, status_by_backend_team as State, own_share, friend_share, EventDate, CreationDate, LockingDate, payout_status  FROM `order_history` LEFT JOIN `frontend_users` ON (frontend_users.userId = order_history.userId) LEFT JOIN `manage_cashback_point` ON (manage_cashback_point.order_id = order_history.order_id) WHERE `manage_cashback_point`.order_id ='" + orderId + "'";
        db.query(q2, (err2, res2) => {
            if (err2) throw err2;
            if (res2.length > 0) {
                callback(res2)
            } else {
                let v = [];
                callback(v)
            }
        })
    },
    getUserList(userId, callback) {
        let q1 = "SELECT DISTINCT(frontend_users.userId), frontend_users.emailId, name FROM `sharecode_accept_by_user` " +
            "LEFT JOIN frontend_users ON (sharecode_accept_by_user.accept_user_id = frontend_users.userId) " +
            "LEFT JOIN create_sharerefcode ON (sharecode_accept_by_user.shareCodeId = create_sharerefcode.shareCode) " +
            "WHERE create_sharerefcode.userId=" + userId;
        db.query(q1, (err1, res1) => {
            if (err1) throw err1;
            let newArray = [];
            if (res1.length > 0) {
                newArray = res1;
            }

            if (newArray.length > 0) {
                callback(newArray)
            } else {
                let v = [];
                callback(v)
            }
        })
    },
    getPreferenceList(userId, callback) {
        let q = "select * from preferenceData where userId=" + userId;
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res);
            } else {
                let a = [];
                callback(a);
            }
        })
    },
    preferenceAdd(params, callback) {
        let q = "select * from preferenceData where userId=" + params.userId;
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                let qry = "UPDATE preferenceData SET categoryList ='" + params.categoryList + "', storeList='" + params.storeList + "'  where userId = " + params.userId;
                db.query(qry, (err23, res23) => {
                    if (err23) throw err23;
                    callback("0")
                })
            } else {
                let qry = `INSERT INTO preferenceData(userId, categoryList, storeList)` +
                    `values ('${params.userId}', '${params.categoryList}', '${params.storeList}')`;

                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    let id = res1.insertId;
                    callback(id);
                })
            }
        })
    },
    getPreferenceData(userId, callback) {
        let q = "select * from preferenceData where userId=" + userId;
        var categoryList = [];
        var storeList = [];
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                //get store list by store id
                if (res[0].categoryList != "") {
                    let q2 = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon, y.description, y.coupon_code,y.clickUrl, x.catid from " +
                        "( select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, a.store_status,a.network, a.store_logo,a.shareSale_linkurl, b.catid " +
                        "from store as a " +
                        "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
                        "inner join store_cat_map as b on b.affiliated_store_id = a.affiliated_store_id " +
                        ") as x " +
                        "left join " +
                        "( " +
                        "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.description,a.coupon_code,a.clickUrl, a.site_status from coupon_details as a " +
                        "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
                        "GROUP BY a.affiliated_store_id " +
                        ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.catid IN(" + res[0].categoryList + ") and x.store_status='Active'";

                    db.query(q2, (err2, res2) => {
                        if (err2) throw err2;
                        if (res2.length > 0) {
                            //categoryList.push(res2);

                            if (res[0].storeList != "") {
                                let q1 = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
                                    " y.description, y.coupon_code,y.clickUrl " +
                                    "from " +
                                    "( " +
                                    "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
                                    "from store as a " +
                                    "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
                                    ") as x " +
                                    "left join " +
                                    "( " +
                                    "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.description,a.coupon_code,a.clickUrl, a.site_status from coupon_details as a " +
                                    "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
                                    "GROUP BY a.affiliated_store_id " +
                                    ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.affiliated_store_id IN(" + res[0].storeList + ") and x.store_status='Active'  LIMIT 0,4";

                                db.query(q1, (err1, res1) => {
                                    if (err1) throw err1;
                                    if (res1.length > 0) {
                                        //storeList.push(res1);
                                        // two array merge
                                        const arrdata = res2.concat(res1);

                                        if (arrdata.length > 0) {
                                            var filteredArray = arrdata.reduce((unique, o) => {
                                                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                                                    unique.push(o);
                                                }
                                                return unique;
                                            }, []);

                                            callback(filteredArray);
                                        } else {
                                            let a = [];
                                            callback(a);
                                        }
                                    } else {
                                        var filteredArray = res2.reduce((unique, o) => {
                                            if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                                                unique.push(o);
                                            }
                                            return unique;
                                        }, []);

                                        callback(filteredArray);
                                    }
                                })
                            } else {
                                var filteredArray = res2.reduce((unique, o) => {
                                    if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                                        unique.push(o);
                                    }
                                    return unique;
                                }, []);

                                callback(filteredArray);
                            }
                        } else {
                            let a = [];
                            callback(a);
                        }
                    })
                } else if (res[0].storeList != "") {
                    let q1 = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
                        " y.description, y.coupon_code,y.clickUrl " +
                        "from " +
                        "( " +
                        "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
                        "from store as a " +
                        "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
                        ") as x " +
                        "left join " +
                        "( " +
                        "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.description,a.coupon_code,a.clickUrl, a.site_status from coupon_details as a " +
                        "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
                        "GROUP BY a.affiliated_store_id " +
                        ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.affiliated_store_id IN(" + res[0].storeList + ") and x.store_status='Active'  LIMIT 0,4";

                    db.query(q1, (err1, res1) => {
                        if (err1) throw err1;
                        if (res1.length > 0) {
                            var filteredArray = res1.reduce((unique, o) => {
                                if (!unique.some(obj => obj.affiliated_store_id === o.affiliated_store_id)) {
                                    unique.push(o);
                                }
                                return unique;
                            }, []);

                            callback(filteredArray);
                        } else {
                            let a = [];
                            callback(a);
                        }
                    })
                } else {
                    let a = [];
                    callback(a);
                }
            } else {
                let a = [];
                callback(a);
            }
        })
    },

    //
    setNewsLetter(emailId, callback) {
        if (emailId != '') {
            let qry = `INSERT INTO news_letter_data(emailId)` +
                `values ('${emailId}')`
            db.query(qry, (err1, res1) => {
                if (err1) throw err1;
                let id = res1.insertId;
                callback(id);
            })
        } else {
            callback("Err");
        }
    },
}