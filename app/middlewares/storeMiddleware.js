const redisClient   = require('../../config/redisConnection');
const common = require('../../config/common');
var async           = require('async');

module.exports = {
    async getStorePageFromRedis(req, res, next) {
        var name = "";
        
        var v = await redisClient.then((client) => {
            var data = client.get("store_page");
            return data;
        });

        let val = JSON.parse(v)
        
        if (val !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : val.obj,
                storeList: val.storeList,
                seo: val.seo,
                storeImgUrl: common.storeImgUrl,
                catImgUrl: common.catImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getListByCharecterFromRedis(req, res, next) {
        let name = req.body.name;
        
        var v = await redisClient.then((client) => {
            var data = client.get("listByCharecter_"+name);
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                storeImgUrl: common.storeImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getDetailsStoreFromRedis(req, res, next) {
        let affiliatedId = req.body.affiliatedId;
        
        var v = await redisClient.then((client) => {
            var data = client.get("detailsStore_"+affiliatedId);
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getPopularStoreFromRedis(req, res, next) {
        let affiliatedId = "";
        
        var v = await redisClient.then((client) => {
            var data = client.get("popularStore");
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                storeImgUrl: common.storeImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getHomeStoreFromRedis(req, res, next) {
        let affiliatedId = "";
        
        var v = await redisClient.then((client) => {
            var data = client.get("homePage");
            return data;
        });

        let val = JSON.parse(v)

        if (val !== null ) {
            
            res.status(200).json({
                statusCode: 200,
                Hot_deals_coupon_Store : val.Hot_deals_coupon_Store,
                FAVORITE_DEALS_OF_THE_SEASON : val.FAVORITE_DEALS_OF_THE_SEASON,
                DEALS_OF_THE_WEEK : val.DEALS_OF_THE_WEEK,
                seo : val.seo,
                storeImgUrl: common.storeImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getCouponPageFromRedis(req, res, next) {
        let affiliatedId = "";
        
        var v = await redisClient.then((client) => {
            var data = client.get("couponPage");
            return data;
        });

        let val = JSON.parse(v)

        if (val !== null ) {
            res.status(200).json({
                statusCode: 200,
                TOP_DEALS_Coupon : val.TOP_DEALS_Coupon,
                FEATURED : val.FEATURED,
                POPULAR_DEALS_Coupon : val.POPULAR_DEALS_Coupon,
                seo : val.seo,
                storeImgUrl: common.storeImgUrl,
                couponImgUrl: common.couponImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getCouponDetailsPageFromRedis(req, res, next) {
        let couponId = req.body.couponId;
        
        var v = await redisClient.then((client) => {
            var data = client.get("couponDetails_"+couponId);
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },
}
