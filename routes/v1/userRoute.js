var express       = require('express')
var router        = express.Router();

var fs            = require("fs");
var http          = require('http');
var path          = require('path');
var https         = require('https');
var multer        = require('multer');
var bodyParser    = require('body-parser');

// Require controller modules.
var userController = require('../../app/controlers/user');

router.post('/registration', userController.registration);
router.post('/login', userController.login);
router.post('/getProfile', userController.profile);
router.post('/editProfile', userController.userProfileUpdate);
router.post('/changePassword', userController.changePassword);
router.post('/forgotPassword', userController.forgotPassword);

// imageUpload
router.post('/imageUpload', userController.imageUpload);
router.post('/slagNameUpdate', userController.slagNameUpdate);
router.post('/paypalEmailIdUpdate', userController.paypalEmailIdUpdate);

router.post('/createSareCode', userController.createSareCode);
router.post('/getUserListForShareCode', userController.getUserListForShareCode);
router.post('/contactUs', userController.contactUs);
router.post('/trackInfoForBot', userController.trackInfoForBot);


router.post('/getOrderItem', userController.getOrderItem);

router.post('/preferenceDataList', userController.preferenceDataList);
router.post('/preferenceDataAdd', userController.preferenceDataAdd);

router.post('/addProfileImg', userController.addProfileImg);
router.post('/addBannerImg', userController.addBannerImg);
router.post('/getPreferenceData', userController.getPreferenceData);

//router.post('/newsLetter', userController.newsLetter);

module.exports = router

