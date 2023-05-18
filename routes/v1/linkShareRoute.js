var express       = require('express')
var router        = express.Router();
var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');
var linkController  = require('../../app/controlers/linkShareControler'); 

router.post('/getALLStoreList', linkController.getALLStoreList);
router.post('/updateCatName', linkController.updateCatName);
router.post('/getCouponbyStore', linkController.getCouponbyStore);

router.post('/updateURL', linkController.updateURL);

//router.get('/webScraping', linkController.webScraping)

module.exports = router

