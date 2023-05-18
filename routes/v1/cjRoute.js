var express       = require('express')
var router        = express.Router();
var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');

var cjController  = require('../../app/controlers/cjControler');
var jwtToken      = require('../../app/middlewares/jwtToken');


router.post('/getALLStoreList', cjController.getALLStoreList);
router.post('/getDealbyStore', cjController.getDealbyStore);

module.exports = router

