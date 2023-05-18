var express       = require('express')
var router        = express.Router();
var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');
var impactControler  = require('../../app/controlers/impactControler');

router.post('/getALLStoreList', impactControler.getALLStoreList);
router.post('/getDealbyStore', impactControler.getDealbyStore);
router.post('/impactOrderHistory', impactControler.impactOrderHistory);
router.post('/impactOrderDetails', impactControler.impactOrderDetails);


module.exports = router

