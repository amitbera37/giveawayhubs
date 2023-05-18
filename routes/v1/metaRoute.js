var express = require('express')
var router = express.Router();

var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');

// Require controller modules.
var metaContentController = require('../../app/controlers/metaInfo');

router.post('/listMetaData', metaContentController.listMetaData);

module.exports = router