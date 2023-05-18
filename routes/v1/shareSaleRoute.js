var express       = require('express')
var router        = express.Router();
var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');
var shareSaleController  = require('../../app/controlers/shareSaleControler');

router.post('/getALLStoreList', shareSaleController.getALLStoreList);
router.post('/getDealbyStore', shareSaleController.getDealbyStore);
router.post('/importFromLocal', shareSaleController.importFromLocal); 
router.post('/importFromLocalLS', shareSaleController.importFromLocal2); 

module.exports = router

