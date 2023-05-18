var metaModel = require('../models/metaModel');

var async = require('async');
var fs = require("fs");
var path = require('path');
var dir = path.join(__dirname, '../../public');

module.exports = {
    async listMetaData(req, res, next) {
        let pageName = req.body.pageName;
        
        const contentRes = new Promise((resolve, reject) => {
            metaModel.MetaContentdata(pageName, (result, err) => {
                if (result) {
                    //console.error(` Succ: ${result}`)
                    resolve(result);
                } else {
                    //console.log(` ERROR: ${err}`)
                    reject('ERROR')
                }
            })
        });
        let contentData = await contentRes;
  
        if (contentData.length > 0) {
            res.status(200).json({
                statusCode: 200,
                data: contentData
            })
        } else {
            res.status(200).json({
                statusCode: 201,
                msg: 'No record found!'
            })
        }
    },
    
}