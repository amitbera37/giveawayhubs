const redisClient   = require('../../config/redisConnection');
//var categories      = require('../models/categoriesModel');
const common = require('../../config/common');
var async           = require('async');

module.exports = {
    async getAllCategoriesFromRedis(req, res, next) {
        var name = "";

        const catRes1 = new Promise((resolve, reject) => {
            categories.getHomeSeo('Category', (result, err) => {
                if (result) {
                    resolve(result);
                } else {
                    reject('seo ERROR')
                }
            })
        });
        let rs2 = await catRes1;
        
        var v = await redisClient.then((client) => {
            var data = client.get("all_cat_data",);
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                seo: rs2,
                storeImgUrl: common.storeImgUrl,
                catImgUrl: common.catImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },

    async getStoreByCatIdFromRedis(req, res, next) {
        var catId = req.body.catId;
        
        var v = await redisClient.then((client) => {
            var data = client.get("catId_"+catId);
            return data;
        });

        if (v !== null ) {
            res.status(200).json({
                statusCode: 200,
                data : JSON.parse(v),
                storeImgUrl: common.storeImgUrl,
                catImgUrl: common.catImgUrl,
                msg: 'It has been successfully send from cache.'
            })
        } else {
            next();
        }
    },
}
