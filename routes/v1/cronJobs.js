var express     = require('express')
var router      = express.Router();
var cron        = require('node-cron');
const AWS = require("aws-sdk");


var couponController  = require('../../app/controlers/couponsApiController');
router.get('/getCoupons', couponController.getCouponFromCouponORGAPI);
router.post('/importCSVforCoupon', couponController.importCSVCouponData);

// createJWTtoken

var tokenData  = require('../../app/middlewares/jwtToken');
router.get('/getToken', tokenData.createToken);
router.get('/mailEnableTest', tokenData.mailEnableTest);


module.exports = router