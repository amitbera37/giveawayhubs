var express       = require('express')
var router        = express.Router();
var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');
var pepperjamControler  = require('../../app/controlers/pepperjamControler');

router.post('/getALLStoreList', pepperjamControler.getALLStoreList);
router.post('/updateLink', pepperjamControler.updateLink);
router.post('/getCoupon', pepperjamControler.getCoupon);

module.exports = router

