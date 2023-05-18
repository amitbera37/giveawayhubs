const compression = require('compression');
const express = require('express');
const app = express();
var fs = require("fs");
var http = require('http');
var path = require('path');
var https = require('https');
const bodyParser = require('body-parser');
var cors = require('cors');
const fileUpload = require('express-fileupload');
//exit;
var cookieParser = require('cookie-parser');
var session = require('express-session');
var cluster = require('cluster');

var cron = require('node-cron');


require('dotenv').config();
//
app.use(cors());
app.use(express.static('public'));
//app.use("/public", express.static(path.join(__dirname, 'public')));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(bodyParser.text())
app.use(fileUpload());



// compress all responses
const shouldCompress = (req, res) => {
    if (req.headers['x-no-compression']) {
        return false
    }
    return compression.filter(req, res);
}

app.use(compression({
    filter: shouldCompress,
    level: 7,
}));




var userService     = require('./routes/v1/userRoute');
var metaService     = require('./routes/v1/metaRoute');
var cj              = require('./routes/v1/cjRoute');
var shareSale       = require('./routes/v1/shareSaleRoute');
var impact          = require('./routes/v1/impactRoute');
var paperjam        = require('./routes/v1/paperjamRoute');
var linkShare       = require('./routes/v1/linkShareRoute');
var categories      = require('./routes/v1/categoriesRoute');
var store           = require('./routes/v1/storeRoute');
var cronJobs        = require('./routes/v1/cronJobs');

app.use(function (req, res, next) {
    res.header("Access-Control-Allow-Origin", "*");
    res.header('Access-Control-Allow-Methods', 'DELETE, PUT, GET, POST, OPTIONS');
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
    next();
});

app.use('/user', userService);
app.use('/metaInfo', metaService);
app.use('/cj', cj);
app.use('/shareSale', shareSale);
app.use('/impact', impact);
app.use('/paperjam', paperjam);
app.use('/linkShare', linkShare);
app.use('/categories', categories);
app.use('/store', store);
app.use('/cronJobs', cronJobs);

app.get('/healthcheckStaging', function (req, res) {
    res.status(200).json({
        statusCode: 200,
        msg: 'Web Service works fine.'
    })
});

var CJController = require('./app/controlers/cjControler');
var IRController = require('./app/controlers/impactControler');
var SSController = require('./app/controlers/shareSaleControler');
var couponManageController = require('./app/controlers/couponsApiController');


const servicePort = 3003;
if (cluster.isMaster) {
    var numWorkers = require('os').cpus().length;

    console.log('Master cluster setting up ' + numWorkers + ' workers...');

    for (var i = 0; i < numWorkers; i++) {
        cluster.fork();
    }

    cluster.on('online', function (worker) {
        console.log('Worker ' + worker.process.pid + ' is online');
    });

    cluster.on('exit', function (worker, code, signal) {
        console.log('Worker ' + worker.process.pid + ' died with code: ' + code + ', and signal: ' + signal);
        console.log('Starting a new worker');
        cluster.fork();
    });

    //Per hour API call from couponAPI.org
    cron.schedule('01 * * * *', () => {
        //console.log('Currently not implement.');
    });
    cron.schedule('05 0 * * *', () => {
        CJController.getDealbyStoreUseByCronJobs();
        console.log('will execute every day 12:05 AM  until stopped.');
    });
    cron.schedule('07 0 * * *', () => {
        IRController.getDealbyStoreUsedByCronjobs();
        console.log('will execute every day 12:08 AM until stopped.');
    });
    cron.schedule('09 0 * * *', () => {
        SSController.getDealbyStoreUsedByCron();
        console.log('will execute every day 12:11 AM until stopped.');
    });

    cron.schedule('10 * * * *', () => { // 0000-00-00 00:00:00 has been changed yyyy-12-31 18:29:00
        //couponManageController.defaultEndDateUpdate();
        console.log('will execute every hours 10 minutes until stopped. like 1:10,2:10');
    });
    cron.schedule('12 * * * *', () => { // IF date has been expired The coupon status is to be "0" 
        couponManageController.checkExpireCoupon();
        console.log('will execute every hours 12 minutes until stopped. like 1:12,2:12');
    });
    cron.schedule('14 * * * *', () => { // changeStoreTypeForSEASON
        couponManageController.changeStoreTypeForSEASON();
        console.log('will execute every hours 14 minutes until stopped. like 1:14,2:14');
    });
    cron.schedule('16 * * * *', () => { // changeStoreTypeForTop 
        couponManageController.changeStoreTypeForTop();
        console.log('will execute every hours 16 minutes until stopped. like 1:16,2:16');
    });
    cron.schedule('18 * * * *', () => { // changeStoreTypeForHot 
        couponManageController.changeStoreTypeForHot();
        console.log('will execute every hours 18 minutes until stopped. like 1:18,2:18');
    });
} else {
    var server = app.listen(servicePort, function () {
        var host = server.address().address
        var port = server.address().port
        console.log("Example app listening at http://%s:%s", host, port)
    })
}

