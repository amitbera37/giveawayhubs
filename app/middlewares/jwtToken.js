var common = require('../../config/common');
var async = require('async');

const jwt = require("jsonwebtoken");
const jwtKey = common.jwtKey;
const jwtExpirySeconds = common.jwtExpirySeconds;

const AWS = require("aws-sdk");
// Create a new SES object. 
var ses = new AWS.SES();

var sendMail = function () {
    return function (callback) {
        var params = {
            Enabled: false
        };
        
        exports.handler = (event, context, callback) => {
            // Pause sending for your entire SES account
            ses.updateAccountSendingEnabled(params, function(err, data) {
                if(err) {
                    console.log(err.message);
                } else {
                    console.log(data);
                }
            });
        };
    }
}

module.exports = {
    async verifyToken(req, res, next) {
        try {
            const bearerHeader = req.headers['authorization'];
            if(typeof bearerHeader !== 'undefined'){
                const bearer = bearerHeader.split(' ');
                const bearerToken = bearer[1];
                req.token = bearerToken;
                const verified = jwt.verify(req.token, jwtKey);
                if(verified){
                    next();
                }
            } else {
                let obj = {
                    msg : "Please provide valid token",
                    code : 403
                }
                res.send(obj)
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
            let obj = {
                msg : `ERROR: ${ex}`,
                code : 401
            }
            res.send(obj)
        }
    },

    async createToken(req, res, next) {
        try {
            let mrn = "123456";
            const token = jwt.sign({ mrn }, jwtKey, {
                algorithm: "HS256",
                expiresIn: jwtExpirySeconds,
            })

            let obj = {
                token : token,
                code : 200
            }
            res.send(obj)
            
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    async mailEnableTest(req, res, next) {
        async.series([
            function (callback) {
                setTimeout(function () {
                    console.log('Task 1');
                    sendMail();
                    callback(null, 1);
                }, 1000);
            }
        ], function (error, results) {
            //console.log(results);
        });

        res.status(200).json({
            statusCode: 200,
            msg: 'Import successfully.'
        })
    },
}
