const db = require('../../config/db');
const common = require('../../config/common');

module.exports = {
    getTopStore(name, callback) { //Top store StorePage
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
            " y.commission as description, y.coupon_code, y.clickUrl, y.site_status, y.lavel, y.coupon_img_link, y.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,b.type_id,a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
            "from store as a " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.commission,a.coupon_code,a.clickUrl, a.site_status, a.lavel, a.coupon_img_link, a.rating from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id =1 and x.store_status='Active' and y.site_status='1' ORDER BY y.totalCoupon DESC";

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
    listByCharecter(name, callback) {
        let q = "";
        if (name == "0-9") {
            q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_logo, x.store_status, y.totalCoupon " +
                "from " +
                "( " +
                "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,a.store_status, a.store_logo from store as a " +
                "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
                ") as x " +
                "left join " +
                "( " +
                "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon,a.site_status from coupon_details as a " +
                "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
                "GROUP BY a.affiliated_store_id " +
                ") as y on x.affiliated_store_id = y.affiliated_store_id " +
                "WHERE x.store_name LIKE '0%' OR x.store_name LIKE '1%' OR x.store_name LIKE '2%' " +
                "OR x.store_name LIKE '3%' OR x.store_name LIKE '4%' OR x.store_name LIKE '5%' OR x.store_name LIKE '6%' OR x.store_name LIKE '7%' OR x.store_name LIKE '8%' " +
                "OR x.store_name LIKE '9%' and x.store_status='Active' and y.site_status ='1' and y.totalCoupon > 0";
        } else {
            q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.store_logo, y.totalCoupon " +
                "from " +
                "( " +
                "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,a.store_status, a.store_logo from store as a " +
                "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
                ") as x " +
                "left join " +
                "( " +
                "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.site_status from coupon_details as a " +
                "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
                "GROUP BY a.affiliated_store_id " +
                ") as y on x.affiliated_store_id = y.affiliated_store_id " +
                "WHERE x.store_name LIKE '" + name + "%' and x.store_status='Active' and y.site_status ='1' and y.totalCoupon > 0";
        }


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
    getStoreDetails(affiliated_store_id, callback) {
        let q = "SELECT affiliated_store_id, store_name, store_status, network, store_logo, description, shareSale_linkurl, seo_title, seo_description, keyword, banner_title, banner_text, banner_image, seo_url FROM `store` WHERE `seo_url` = " + affiliated_store_id;
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
    getCouponDetails(affiliated_store_id, callback) {
        let q = "select x.couponId,x.affiliated_store_id, x.coupon_code, x.commission, x.start_date, x.end_date, " +
            "x.network, x.clickUrl, x.description, x.site_status, x.lavel, x.coupon_img_link, x.rating " +
            "from " +
            "( " +
            "select a.id as couponId, a.affiliated_store_id, a.coupon_code, a.commission, a.start_date, a.end_date, a.network, a.clickUrl, a.description,a.site_status,a.lavel,a.coupon_img_link, a.rating " +
            "from coupon_details as a ORDER BY end_date ASC " +
            ") as x " +
            "WHERE x.site_status ='1' and x.affiliated_store_id = " + affiliated_store_id;

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

    // home page
    getDEALS_OF_THE_WEEKStore(name, callback) { // HOT DEALS - Home Page
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
            " y.commission as description, y.coupon_code, y.clickUrl, y.site_status, y.lavel, y.coupon_img_link, y.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,b.type_id,a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
            "from store as a " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.commission,a.coupon_code,a.clickUrl, a.site_status, a.lavel, a.coupon_img_link, a.rating from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id =2 and x.store_status='Active' and y.site_status='1' LIMIT 0,10";

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
    get_FAVORITE_DEALS_OF_THE_SEASON_coupon_Store(name, callback) { //SOME OF OUR FAVORITE DEALS OF THE SEASON - Home Page
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
            " y.commission as description, y.coupon_code, y.clickUrl, y.site_status, y.lavel, y.coupon_img_link, y.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,b.type_id,a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
            "from store as a " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.commission,a.coupon_code,a.clickUrl, a.site_status, a.lavel, a.coupon_img_link, a.rating from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id =4 and x.store_status='Active' and y.site_status='1' LIMIT 0,12";


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
    get_TOP_DEALS_Store(name, callback) { // coupon HOT DEALS - Home Page
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon, y.commission as description, y.coupon_code,y.clickUrl, y.end_date, y.lavel, y.coupon_img_link, y.rating, y.id as couponId" +
            " from(select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, b.type_id, a.store_status, a.network, a.store_logo, a.shareSale_linkurl from store as a inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id) as x" +
            " left join(SELECT t.affiliated_store_id, r.totalCoupon, t.coupon_code, t.commission, t.end_date, t.clickUrl, t.site_status, t.lavel, t.coupon_img_link, t.rating, t.id" +
            " FROM coupon_details t JOIN(" +
            " SELECT DISTINCT(affiliated_store_id) as affiliated_store_id, COUNT(DISTINCT id) as totalCoupon, MIN(end_date) Mindatetime" +
            " FROM coupon_details" +
            " GROUP BY affiliated_store_id" +
            " ) r ON t.affiliated_store_id = r.affiliated_store_id AND t.end_date = r.Mindatetime" +
            " WHERE t.site_status = '1'" +
            " ORDER BY t.end_date ASC) as y" +
            " on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id = 2 and x.store_status = 'Active' and y.site_status = '1' LIMIT 0, 100";

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

    // end 
    getPopularStore(name, callback) { //SEASON store - Home Page
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
            " y.commission as description, y.coupon_code, y.clickUrl, y.site_status, y.lavel, y.coupon_img_link, y.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,b.type_id,a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
            "from store as a " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.commission,a.coupon_code,a.clickUrl, a.site_status, a.lavel, a.coupon_img_link, a.rating from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id =4 and x.store_status='Active' and y.site_status='1' LIMIT 0,12";

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
    // coupon page
    get_POPULAR_DEALS_Store(name, callback) { // get coupon //SOME OF OUR FAVORITE DEA
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon, y.commission as description, y.coupon_code,y.clickUrl, y.end_date, y.lavel, y.coupon_img_link, y.rating, y.id as couponId" +
            " from(select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name, b.type_id, a.store_status, a.network, a.store_logo, a.shareSale_linkurl from store as a inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id) as x" +
            " left join(SELECT t.affiliated_store_id, r.totalCoupon, t.coupon_code, t.commission, t.end_date, t.clickUrl, t.site_status, t.lavel, t.coupon_img_link, t.rating, t.id" +
            " FROM coupon_details t JOIN(" +
            " SELECT DISTINCT(affiliated_store_id) as affiliated_store_id, COUNT(DISTINCT id) as totalCoupon, MIN(end_date) Mindatetime" +
            " FROM coupon_details" +
            " GROUP BY affiliated_store_id" +
            " ) r ON t.affiliated_store_id = r.affiliated_store_id AND t.end_date = r.Mindatetime" +
            " WHERE t.site_status = '1'" +
            " ORDER BY t.end_date ASC) as y" +
            " on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id = 4 and x.store_status = 'Active' and y.site_status = '1' LIMIT 0, 100";

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
    get_FEATURED_Store(name, callback) { //FEATURED STORES
        let q = "select x.affiliated_store_id, x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, y.totalCoupon," +
            " y.commission as description, y.coupon_code, y.clickUrl, y.site_status, y.lavel, y.coupon_img_link, y.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,b.type_id,a.store_status,a.network, a.store_logo,a.shareSale_linkurl " +
            "from store as a " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            ") as x " +
            "left join " +
            "( " +
            "select a.affiliated_store_id, COUNT(DISTINCT a.id) as totalCoupon, a.commission,a.coupon_code,a.clickUrl, a.site_status, a.lavel, a.coupon_img_link, a.rating from coupon_details as a " +
            "left join store as b on b.affiliated_store_id = a.affiliated_store_id " +
            "GROUP BY a.affiliated_store_id " +
            ") as y on x.affiliated_store_id = y.affiliated_store_id WHERE x.type_id =7 and x.store_status='Active' and y.site_status='1'";

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


    // search function start
    getStoreDetailsBySEOName(affiliated_store_id, callback) {
        let q = "SELECT affiliated_store_id, store_name, store_logo, seo_url FROM `store` WHERE `store_name` LIKE '%" + affiliated_store_id + "%'";
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
    getSearchTotalResult(name, callback) {
        let q = "select x.affiliated_store_id,x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, " +
            " x.coupon_code,x.clickUrl,x.couponId, x.description, x.start_date, x.end_date,x.catName,x.site_status,x.lavel,x.coupon_img_link,x.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,a.store_status,a.network, a.store_logo,a.shareSale_linkurl, " +
            "c.id as couponId, c.coupon_code, c.clickUrl, c.description, c.start_date, c.end_date, c.site_status, d.name as catName, c.lavel, c.coupon_img_link, c.rating from store as a " +
            "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            "inner join cashback_categories as d on d.id = b.catid " +
            ") as x " +
            "WHERE x.store_name LIKE '%" + name + "%' or x.catName LIKE '%" + name + "%' and x.store_status='Active' and x.site_status='1'";


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
    getSearchResult(name, perPageRec, ofset, callback) {
        let q = "select x.affiliated_store_id,x.seo_url, x.store_name, x.store_status, x.network, x.store_logo, x.shareSale_linkurl, " +
            "x.coupon_code,x.clickUrl,x.couponId, x.description, x.start_date, x.end_date,x.catName,x.site_status,x.lavel,x.coupon_img_link,x.rating " +
            "from " +
            "( " +
            "select DISTINCT(a.affiliated_store_id) as affiliated_store_id, a.seo_url, a.store_name,a.store_status,a.network, a.store_logo,a.shareSale_linkurl, " +
            "c.id as couponId, c.coupon_code, c.clickUrl, c.description, c.start_date, c.end_date, c.site_status, d.name as catName,c.lavel,c.coupon_img_link,c.rating from store as a " +
            "inner join coupon_details as c on c.affiliated_store_id = a.affiliated_store_id " +
            "inner join cashback_store_type_map as b on b.affiliated_store_id = a.affiliated_store_id " +
            "inner join cashback_categories as d on d.id = b.catid " +
            ") as x " +
            "WHERE  x.store_name LIKE '%" + name + "%' or x.catName LIKE '%" + name + "%' and x.site_status='1' and x.store_status='Active' LIMIT " + ofset + ", " + perPageRec;


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
    getCouponSearchDetails(affiliated_store_id, perPageRec, ofset, callback) {
        let q = "select x.couponId,x.affiliated_store_id, x.coupon_code, x.commission, x.start_date, x.end_date, " +
            "x.network, x.clickUrl, x.description, x.site_status,x.lavel,x.coupon_img_link,x.rating " +
            "from " +
            "( " +
            "select a.id as couponId, a.affiliated_store_id, a.coupon_code, a.commission, a.start_date, a.end_date, a.network, a.clickUrl, a.description, a.site_status,a.lavel, a.coupon_img_link, a.rating " +
            "from coupon_details as a " +
            ") as x " +
            "WHERE  x.affiliated_store_id = " + affiliated_store_id + " LIMIT " + ofset + ", " + perPageRec;

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

    // All search function start
    getCouponDetailsByIdForMarchentLink(couponId, callback) {
        let q = "SELECT clickUrl FROM `coupon_details` WHERE `id`=" + couponId;
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
    getAllStore(couponId, callback) {
        let q = "SELECT affiliated_store_id, store_name FROM `store` WHERE store_status='Active'";
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