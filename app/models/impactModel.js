const db        = require('../../config/db');
const common    = require('../../config/common');

module.exports = {
    insertIMStoreList(params, callback) {
        if (params.affiliated_store_id != "") {
            var today = new Date();
            var dd = String(today.getDate()).padStart(2, '0');
            var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
            var yyyy = today.getFullYear();

            today = yyyy + '-' + mm + '-' + dd;

            let q = "select affiliated_store_id from store where network = '"+params.network+"' and affiliated_store_id=" + params.affiliated_store_id;
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    
                    let qry = "UPDATE store SET " +
                        "store_status = '"+params.store_status+"', description='"+params.description+"', store_parent_categories = '"+params.store_parent_categories+"', child_categories='"+params.child_categories+"', network='IR', modified_date = '"+today+"', shareSale_linkurl='"+params.TrackingLink+"' where affiliated_store_id=" + params.affiliated_store_id ;
                    
                        db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        callback('0');
                    })
                } else {
                    let qry = `INSERT INTO store(affiliated_store_id, store_name, store_status, description, store_parent_categories, child_categories, network, store_website, CampaignId, shareSale_linkurl)` +
                        `values ('${params.affiliated_store_id}', '${params.store_name}', '${params.store_status}', '${params.description}', '${params.store_parent_categories}', '${params.child_categories}', '${params.network}', '${params.store_website}', '${params.CampaignId}', '${params.TrackingLink}')`;
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
        let q1 = "SELECT affiliated_store_id, CampaignId, shareSale_linkurl FROM store WHERE store_status = 'Active' and network = 'IR'";
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

    insertIMCouponList(params, callback) {
        if (params.affiliated_store_id != "") {
            let q = "select affiliated_store_id from coupon_details where affiliated_coupon_id=" + params.link_id + " and coupon_code = '"+params.coupon_code+"'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    console.log("IR===coupon_update");
                    let qry = "UPDATE coupon_details SET " +
                        "coupon_code_status = '"+params.coupon_code_status+"', site_status = '"+params.site_status+"', commission = '"+params.commission+"', lavel='' where affiliated_coupon_id=" + params.link_id + " and coupon_code = '"+params.coupon_code+"'";
                    
                        db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        callback('0');
                    })
                } else {
                    console.log("IR===coupon_insert");
                    let qry = `INSERT INTO coupon_details(affiliated_coupon_id, affiliated_store_id, category, network, coupon_code, end_date, commission, clickUrl, description, coupon_code_status, lavel)` +
                        `values ('${params.link_id}','${params.affiliated_store_id}', '${params.category}', '${params.network}', '${params.coupon_code}', '${params.end_date}', '${params.commission}', '${params.clickUrl}', '${params.description}', '${params.coupon_code_status}', '${params.lavel}')`;
                        
                    db.query(qry, (err1, res1) => {
                        if (err1) throw err1;
                        let id = res1.insertId;
                        callback(id);
                    })
                }
            })
        } 
    },

    insertOrderHistory(params) {
        let q = "select id from order_history where order_id = '"+params.order_id+"'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                let qry = "UPDATE order_history SET " +
                    "State = '"+params.State+"', Payout = '"+params.Payout+"' where order_id='"+params.order_id+"'";
                //console.log("========",qry);
                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    //callback('0');
                })
            } else {
                let qry = `INSERT INTO order_history(order_id, userId, affiliated_store_id, store_name, `+
                    `ActionTrackerName, ActionTrackerId, EventCode, State, AdId, Payout, `+ 
                    `DeltaPayout, IntendedPayout, Amount, DeltaAmount, IntendedAmount, Currency, `+
                    `ReferringDate, EventDate, CreationDate, LockingDate, ClearedDate, ReferringType, `+
                    `ReferringDomain, PromoCode, Oid, CustomerArea, CustomerCity, CustomerRegion, `+
                    `CustomerCountry, SubId1, SubId2, SubId3, SharedId, Uri, `+
                    `affiliate_type, `+
                    `State_status) `+
                `values('${params.order_id}','${params.user_id}', `+
                `'${params.CampaignId}', '${params.CampaignName}', `+
                `'${params.ActionTrackerName}', '${params.ActionTrackerId}', '${params.EventCode}', '${params.State}', '${params.AdId}', '${params.Payout}', `+
                `'${params.DeltaPayout}', '${params.IntendedPayout}', '${params.Amount}', '${params.DeltaAmount}', '${params.IntendedAmount}', '${params.Currency}', `+
                `'${params.ReferringDate}', '${params.EventDate}', '${params.CreationDate}', '${params.LockingDate}', '${params.ClearedDate}', '${params.ReferringType}', `+
                `'${params.ReferringDomain}', '${params.PromoCode}', '${params.Oid}', '${params.CustomerArea}', '${params.CustomerCity}', '${params.CustomerRegion}', `+
                `'${params.CustomerCountry}', '${params.SubId1}', '${params.SubId2}', '${params.SubId3}', '${params.SharedId}', '${params.Uri}', `+
                `'${params.affiliate_type}', `+
                `'${params.State_status}')`;
                    
                db.query(qry, (err1, res1) => {
                    if (err1) throw err1;
                    let id = res1.insertId;
                    //callback(id);
                })
            }
        })
    },
}