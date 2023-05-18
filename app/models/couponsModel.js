const db = require('../../config/db');

module.exports = {
    insertCouponList(params, callback) {
        if (params.store_name != "") {
            let firstQ = "select affiliated_store_id from store where store_name like '%" + params.store_name + "%' OR store_website like '%" + params.store_name + "%' AND network='" + params.network + "' AND store_status='Active'";
            db.query(firstQ, (errQ, resQ) => {
                if (errQ) throw errQ;
                if (resQ.length > 0) {
                    let q = "select affiliated_coupon_id from coupon_details where affiliated_store_id=" + resQ[0].affiliated_store_id + " and coupon_code = '" + params.coupon_code + "'";
                    db.query(q, (err, res) => {
                        if (err) throw err;
                        if (res.length > 0) {
                            console.log("API===coupon_update");
                            let qry = "UPDATE coupon_details SET " +
                                "coupon_code_status = '" + params.coupon_code_status + "', site_status = '" + params.site_status + "', commission = '" + params.commission + "', lavel='" + params.lavel + "' where affiliated_coupon_id=" + res[0].affiliated_coupon_id + " and coupon_code = '" + params.coupon_code + "'";

                            db.query(qry, (err1, res1) => {
                                if (err1) throw err1;
                                callback('0');
                            })
                        } else {
                            console.log("API===coupon_insert");
                            let qry = `INSERT INTO coupon_details(affiliated_coupon_id, affiliated_store_id, category, network, coupon_code, end_date, commission, clickUrl, description, coupon_code_status, lavel, rating, coupon_img_link)` +
                                `values ('${params.link_id}','${resQ[0].affiliated_store_id}', '${params.category}', '${params.network}', '${params.coupon_code}', '${params.end_date}', '${params.commission}', '${params.clickUrl}', '${params.description}', '${params.coupon_code_status}', '${params.lavel}', '${params.rating}', '${params.coupon_img_link}')`;

                            db.query(qry, (err1, res1) => {
                                if (err1) throw err1;
                                let id = res1.insertId;
                                callback(id);
                            })
                        }
                    })
                }
            })
        }
    },

    defaultEndDateUpdate(name, callback) {
        const d = new Date();
        let year = d.getFullYear();
        let endDate = year + "-12-31 18:29:00";

        let q = "SELECT * FROM `coupon_details` WHERE `end_date` = '0000-00-00 00:00:00' and site_status = '1'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                let qry = "UPDATE coupon_details SET " +
                    "end_date = '" + endDate + "' where `end_date` = '0000-00-00 00:00:00' and site_status = '1'";

                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    callback('S');
                })
            } else {
                callback('F')
            }
        })
    },

    checkExpireCoupon(name, callback) {
        var currentdate = new Date();
        var mm = currentdate.getMonth() + 1;
        var datetime = currentdate.getFullYear() + "-" + mm
            + "-" + currentdate.getDate() + " "
            + currentdate.getHours() + ":"
            + currentdate.getMinutes() + ":" + currentdate.getSeconds();

        console.log("=========datetime===checkExpireCoupon==", datetime)

        let q = "SELECT * FROM `coupon_details` WHERE `end_date` < '" + datetime + "' and site_status = '1'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                let qry = "UPDATE coupon_details SET " +
                    "site_status = '0' where `end_date` < '" + datetime + "' and coupon_code_status !=''";

                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    callback('S');
                })
            } else {
                callback('F')
            }
        })
    },

    changeStoreTypeForSEASON(name, callback) { //Next 2 month avaliable coupon store list   
        let currentdate = new Date();
        let yy = currentdate.getFullYear();
        let mm = currentdate.getMonth() + 1;
        let startDate = yy + '-' + mm + '-01 00:00:00';
        //console.log(startDate);
        // end Date
        let dt = new Date();
        let yy1 = dt.getFullYear();
        //let mm1 = dt.getMonth() + 3;
        let endDate = yy1 + '-12-31 23:59:00';
        
        let q = "select x.affiliated_store_id, x.totalCoupon from (select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon,"+
        " a.end_date from coupon_details as a WHERE `end_date` BETWEEN '"+startDate+"' and '"+endDate+"' AND site_status ='1'"+
        " GROUP BY a.affiliated_store_id ) as x WHERE x.totalCoupon >=4 ORDER BY x.totalCoupon DESC";
        
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 8) {
                let qry = "DELETE FROM `cashback_store_type_map` WHERE type_id=4";
                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    var i=0;
                    res.forEach(element => {
                        let qry = `INSERT INTO cashback_store_type_map( affiliated_store_id, type_id)` +
                            `values ('${element.affiliated_store_id}', '4')`;

                        db.query(qry, (err1, res1) => {
                            if (err1) throw err1;
                            let id = res1.insertId;
                            i++;
                            if(res.length == i){
                                callback('S');
                            }
                            
                        })

                    });
                })
            } else {
                callback('F')
            }
        })
    },

    changeStoreTypeForTop(name, callback) { //More avaliable coupon store list type -1(Top)
        let q = "SELECT DISTINCT(t.affiliated_store_id) as affiliated_store_id, r.totalCoupon"+
        " FROM coupon_details t JOIN(SELECT DISTINCT(affiliated_store_id) as affiliated_store_id,"+
        " COUNT(DISTINCT id) as totalCoupon, MAX(end_date) Maxdatetime FROM coupon_details GROUP BY affiliated_store_id) r"+
        " ON t.affiliated_store_id = r.affiliated_store_id AND t.end_date = r.Maxdatetime WHERE t.site_status = '1' AND r.totalCoupon >=5 ORDER BY r.totalCoupon desc";
        db.query(q, (err, res) => {
            if (err) throw err;
            let arr = [];
            if (res.length > 6 ) {
                let qry = "DELETE FROM `cashback_store_type_map` WHERE type_id=1";
                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    var i=0;
                    res.forEach(element => {
                        console.log("===element===", element);
                        let qry = `INSERT INTO cashback_store_type_map( affiliated_store_id, type_id)` +
                            `values ('${element.affiliated_store_id}', '1')`;

                        db.query(qry, (err1, res1) => {
                            if (err1) throw err1;
                            let id = res1.insertId;
                            i++;
                            if(res.length == i){
                                callback('S');
                            }
                            
                        })

                    });
                })
            } else {
                callback('F')
            }
        })
    },

    changeStoreTypeForHot(name, callback) { //Current month avaliable coupon store list 
        let currentdate = new Date();
        let yy = currentdate.getFullYear();
        let mm = currentdate.getMonth() + 1;
        let startDate = yy + '-' + mm + '-01 00:00:00';
        //console.log(startDate);
        // end Date
        let dt = new Date();
        let yy1 = dt.getFullYear();
        let mm1 = dt.getMonth() + 3;
        let endDate = yy1 + '-' + mm1 + '-07 23:59:00';
        
        let q = "select x.affiliated_store_id, x.totalCoupon from (select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon,"+
        " a.end_date from coupon_details as a WHERE `end_date` BETWEEN '"+startDate+"' and '"+endDate+"' AND site_status ='1'"+
        " GROUP BY a.affiliated_store_id ) as x WHERE x.totalCoupon >=4 ORDER BY x.totalCoupon DESC";
        
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 5) {
                let qry = "DELETE FROM `cashback_store_type_map` WHERE type_id=2";
                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    var i=0;
                    res.forEach(element => {
                        console.log("===element===", element);
                        let qry = `INSERT INTO cashback_store_type_map( affiliated_store_id, type_id)` +
                            `values ('${element.affiliated_store_id}', '2')`;

                        db.query(qry, (err1, res1) => {
                            if (err1) throw err1;
                            let id = res1.insertId;
                            i++;
                            if(res.length == i){
                                callback('S');
                            }
                            
                        })

                    });
                })
            } else {
                callback('F')
            }
        })
    },
    entryCoupon(params, callback) {
        if (params.affiliated_store_id != "" && params.coupon_code != "") { 
            let qry = `INSERT INTO coupon_details(affiliated_coupon_id, affiliated_store_id,  network, coupon_code, end_date,  clickUrl, description, lavel)` +
                        `values ('${params.affiliated_coupon_id}','${params.affiliated_store_id}',  '${params.network}', '${params.coupon_code}', '${params.endDate}', '${params.clickUrl}', '${params.description}', '${params.lavel}')`;
                
            db.query(qry, (err1, res1) => {
                if (err1) throw err1;
                let id = res1.insertId;
                callback(id);
            })
        } 
    },
}