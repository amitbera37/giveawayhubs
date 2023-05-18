const db        = require('../../config/db');
const common    = require('../../config/common');

module.exports = {
    insertSAStoreList(params, callback) {
        if (params.affiliated_store_id != "") {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;

            let q = "select affiliated_store_id from store where network = '"+params.network+"' and affiliated_store_id='" + params.affiliated_store_id + "'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    let qry = "UPDATE store SET " +
                        "store_status = '"+params.store_status+"', store_parent_categories = '"+params.store_parent_categories+"', child_categories='"+params.child_categories+"', network='SS', modified_date = "+today+", shareSale_linkurl='"+params.TrackingLink+"' where affiliated_store_id=" + params.affiliated_store_id ;
                    //console.log("========",qry);
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        callback('0');
                    })
                } else {
                    let qry = `INSERT INTO store(affiliated_store_id, store_name, store_status, store_parent_categories, child_categories, network, store_website, shareSale_linkurl)` +
                        `values ('${params.affiliated_store_id}', '${params.store_name}', '${params.store_status}', '${params.store_parent_categories}', '${params.child_categories}', '${params.network}', '${params.store_website}', '${params.shareSale_linkurl}')`;
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        callback(id);
                    })
                }
            })
        } 
    },

    insertLSStoreList(params, callback) {
        if (params.affiliated_store_id != "") {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;

            let q = "select affiliated_store_id from store where network = '"+params.network+"' and affiliated_store_id='" + params.affiliated_store_id + "'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    let qry = "UPDATE store SET " +
                        "store_status = '"+params.store_status+"', store_parent_categories = '"+params.store_parent_categories+"', child_categories='"+params.child_categories+"', network='LS', modified_date = "+today+", shareSale_linkurl='"+params.TrackingLink+"' where affiliated_store_id=" + params.affiliated_store_id ;
                    //console.log("========",qry);
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        callback('0');
                    })
                } else {
                    let qry = `INSERT INTO store(affiliated_store_id, store_name, store_status, store_parent_categories, child_categories, network, store_website, shareSale_linkurl)` +
                        `values ('${params.affiliated_store_id}', '${params.store_name}', '${params.store_status}', '${params.store_parent_categories}', '${params.child_categories}', '${params.network}', '${params.store_website}', '${params.shareSale_linkurl}')`;
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        callback(id);
                    })
                }
            })
        } 
    },

    getStoreId(params, callback) {
        let q1 = "SELECT affiliated_store_id FROM store WHERE store_status = 'Active' and network = 'SS'";
        db.query(q1, (err1, res1) => {
            if (err1) throw err1;
            if (res1.length > 0) {
                callback(res1);
            } else {
                let obj = [];
                callback(obj);
            }
        })
    },

    insertSACouponList(params, callback) {
        if (params.affiliated_store_id != "") {
            let q = "select affiliated_store_id from coupon_details where affiliated_coupon_id=" + params.dealid + " and coupon_code = '"+params.coupon_code+"'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    console.log("SS===coupon_update");
                    let qry = "UPDATE coupon_details SET " +
                        "coupon_code_status = '"+params.coupon_code_status+"', site_status = '"+params.site_status+"', commission='"+params.commission+"' where affiliated_coupon_id=" + params.dealid + " and coupon_code = '"+params.coupon_code+"'";
                    
                        db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        callback('0');
                    })
                } else {
                    console.log("SS===coupon_insert");
                    let qry = `INSERT INTO coupon_details(affiliated_coupon_id, affiliated_store_id, category, network, coupon_code, end_date, commission, clickUrl, description, coupon_code_status)` +
                        `values ('${params.dealid}','${params.affiliated_store_id}', '${params.category}', '${params.network}', '${params.coupon_code}', '${params.end_date}', '${params.commission}', '${params.clickUrl}', '${params.description}', '${params.coupon_code_status}')`;
                        
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        callback(id);
                    })
                }
            })
        } 
    },
}