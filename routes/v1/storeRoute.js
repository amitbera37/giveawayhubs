var express       = require('express')
var router        = express.Router();

var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');

// Require controller modules.
var storeController = require('../../app/controlers/storeController');
//var storeMiddleware = require('../../app/middlewares/storeMiddleware');

router.get('/storePage',  storeController.storePage); //storeMiddleware.getStorePageFromRedis,
router.post('/listByCharecter',  storeController.listByCharecter); //storeMiddleware.getListByCharecterFromRedis,
router.post('/getDetailstoStore', storeController.getDetailstoStore); //storeMiddleware.getDetailsStoreFromRedis,
router.get('/getHomePage', storeController.getHomePage); //storeMiddleware.getHomeStoreFromRedis,
router.get('/getCouponPage', storeController.getCouponPage);
router.post('/getPopularStore',  storeController.getPopularStore); //storeMiddleware.getPopularStoreFromRedis,


router.post('/getMarchantLink', storeController.getMarchantLink);
router.post('/getSearchResult', storeController.getSearchResult);
router.get('/getAllStore', storeController.getAllStore);


module.exports = router

