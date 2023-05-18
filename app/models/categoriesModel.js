const db = require('../../config/db');
const common = require('../../config/common');

module.exports = {
    getParentCategories(params, callback) {
        let q = "SELECT  id, `name` as parentCatagory, image, banner_title, banner_image, seo_title, seo_description, keyword, seo_url FROM `cashback_categories` WHERE `parent_cat_id` = 0 and status='1'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res)
            } else {
                let v = "";
                callback(v)
            }
        })
    },
    getHomeSeo(params, callback) {
        let q = "SELECT  * FROM `seo` WHERE `page` = '" + params + "'";

        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res)
            } else {
                let v = [];
                callback(v)
            }
        })
    },
    getDetailsCategory(catId, callback) {
        if (catId != "") {
            let q = "SELECT  id, `name`, description, image, banner_title, banner_text, banner_image, seo_title, seo_description, keyword, seo_url FROM `cashback_categories` WHERE `seo_url` = " + catId + " and status='1'";
            db.query(q, (err, res) => {
                if (err) throw err;
                if (res.length > 0) {
                    callback(res)
                } else {
                    let v = [];
                    callback(v)
                }
            })
        }
    },
    getAllStoreDetailsByCatId(catId, callback) {
        let q = "select x.seo_url, x.store_name, x.store_logo, x.store_status, y.totalCoupon, x.catid " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, a.store_status, a.store_logo, b.catid " +
            "from store as a " +
            "inner join store_cat_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.catid = " + catId + " and x.store_status = 'Active'";

        //console.log("===========q===", q);

        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res)
            } else {
                let v = [];
                callback(v)
            }
        })
    },
}