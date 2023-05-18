var express       = require('express')
var router        = express.Router();

var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');


// Require controller modules.
var categoriesController = require('../../app/controlers/categoriesController');
//var catMiddleware = require('../../app/middlewares/categoryMiddleware');

router.post('/allCategories',   categoriesController.allCategories);
router.post('/getStoreByCatId',  categoriesController.getStoreByCatId);

module.exports = router

