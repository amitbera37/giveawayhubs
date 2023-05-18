var user = require('../models/userModel');
var async = require('async');
const AWS = require("aws-sdk");
var path = require('path');
var CryptoJS = require("crypto-js");

const db = require('../../config/db');
const common = require('../../config/common');
const awsConfig = require('../../config/awsConfig');
var dir = path.join(__dirname, '../../public');
var nodemailer = require('nodemailer');
const md5 = require('md5');
var fs = require("fs");

var shortUrl = require('node-url-shortener');
const ejs = require('ejs');

// using SMTP
var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: common.smtpUser,
        pass: common.smtpPassword
    }
});

var sendMailBack = function (emailId, userId) {
    return function (callback) {
        if (emailId != "") {
            const mailOptions = {
                from: common.smtpEmailId,
                to: emailId,
                subject: 'congratulations!',
                html: ejs.render(fs.readFileSync(dir + '/template/welcome.ejs', 'utf-8'), { userId: userId })
            }

            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
        } else {
            callback('err');
        }
    }
}
var sendMailForChangePasswordBack = function (emailId) {
    return function (callback) {
        if (emailId != "") {
            var mailOptions = {
                from: common.smtpEmailId,
                to: emailId,
                subject: 'congratulations!',
                text: "You have changed password successfully."
            };

            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
        } else {
            callback('err');
        }
    }
}
var sendPasswordBack = function (emailId, pw) {
    return function (callback) {
        if (emailId != "") {
            var mailOptions = {
                from: common.smtpEmailId,
                to: emailId,
                subject: 'congratulations!',
                text: "You current password is " + pw
            };

            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
        } else {
            callback('err');
        }
    }
}
var sendContactUsMailBack = function (Email, name, Subject, Message) {
    return function (callback) {
        if (Email != "") {
            const mailOptions = {
                from: Email,
                to: common.smtpEmailId,
                subject: Subject,
                html: ejs.render(fs.readFileSync(dir + '/template/contact.ejs', 'utf-8'), { Email: Email, Subject: Subject, name: name, Message: Message })
            }

            transporter.sendMail(mailOptions, function (error, info) {
                if (error) {
                    console.log(error);
                } else {
                    console.log('Email sent: ' + info.response);
                }
            });
        } else {
            callback('err');
        }
    }
}

function newsLettermailsend(email, id) {
    let fromNameVal = 'marketing@giveawayhubs.com';
    let campName = 'The biggest sale ever — Check out today!';
    const mailOptions = {
        from: fromNameVal,
        to: email,
        subject: campName,
        text: campName,
        html: ejs.render(fs.readFileSync(dir + '/template/newsLetter.ejs', 'utf-8'), { first_name: '', camId: id, email: email })
    }

    //console.log("===========mailOptions==========", mailOptions);

    transporter.sendMail(mailOptions, function (err, res) {
        console.log("============err========", err);
        console.log("============Newsletter mailsend res========", res);
    });
}
// using AWS 
// Set the region 
AWS.config.update({
    region      : awsConfig.region,
    accessKeyId : awsConfig.accessKeyId,
    secretAccessKey : awsConfig.secretAccessKey
});

var sendMail = function (emailId, userId) {
    return function (callback) {
        if (emailId != "") {
            // Create sendEmail params 
            var params = {
                Destination: {
                    ToAddresses: [
                        emailId
                    ]
                },
                Message: {
                    Body: {
                        Html: {
                            Charset: "UTF-8",
                            Data: ejs.render(fs.readFileSync(dir + '/template/welcome.ejs', 'utf-8'), { userId: userId })
                        }
                    },
                    Subject: {
                        Charset: 'UTF-8',
                        Data: 'congratulations!'
                    }
                },
                Source: common.smtpEmailId
            };

            // Create the promise and SES service object
            var sendPromise = new AWS.SES({ apiVersion: '2010-12-01' }).sendEmail(params).promise();

            // Handle promise's fulfilled/rejected states
            sendPromise.then(
                function (data) {
                    console.log(data.MessageId);
                }).catch(
                    function (err) {
                        console.error(err, err.stack);
                    });
        } else {
            callback('err');
        }
    }
}
var sendMailForChangePassword = function (emailId) {
    return function (callback) {
        if (emailId != "") {
            // Create sendEmail params 
            var params = {
                Destination: {
                    ToAddresses: [
                        emailId
                    ]
                },
                Message: {
                    Body: {
                        Text: {
                            Charset: "UTF-8",
                            Data: "You have changed password successfully."
                        }
                    },
                    Subject: {
                        Charset: 'UTF-8',
                        Data: 'congratulations!'
                    }
                },
                Source: common.smtpEmailId
            };

            // Create the promise and SES service object
            var sendPromise = new AWS.SES({ apiVersion: '2010-12-01' }).sendEmail(params).promise();

            // Handle promise's fulfilled/rejected states
            sendPromise.then(
                function (data) {
                    console.log(data.MessageId);
                }).catch(
                    function (err) {
                        console.error(err, err.stack);
                    });
        } else {
            callback('err');
        }
    }


}
var sendPassword = function (emailId, pw) {
    return function (callback) {
        if (emailId != "") {
            // Create sendEmail params 
            var params = {
                Destination: {
                    ToAddresses: [
                        emailId
                    ]
                },
                Message: {
                    Body: {
                        Text: {
                            Charset: "UTF-8",
                            Data: "Your current password is " + pw
                        }
                    },
                    Subject: {
                        Charset: 'UTF-8',
                        Data: 'congratulations!'
                    }
                },
                Source: common.smtpEmailId
            };

            // Create the promise and SES service object
            var sendPromise = new AWS.SES({ apiVersion: '2010-12-01' }).sendEmail(params).promise();

            // Handle promise's fulfilled/rejected states
            sendPromise.then(
                function (data) {
                    console.log(data.MessageId);
                }).catch(
                    function (err) {
                        console.error(err, err.stack);
                    });
        } else {
            callback('err');
        }
    }


}
var sendContactUsMail = function (emailId, name, Subject, Message) {
    return function (callback) {
        if (emailId != "") {
            // Create sendEmail params 
            var params = {
                Destination: {
                    ToAddresses: [
                        emailId
                    ]
                },
                Message: {
                    Body: {
                        Html: {
                            Charset: "UTF-8",
                            Data: ejs.render(fs.readFileSync(dir + '/template/contact_to_user.ejs', 'utf-8'), { Email: emailId, Subject: Subject, name: name, Message: Message })
                        }
                    },
                    Subject: {
                        Charset: 'UTF-8',
                        Data: Subject
                    }
                },
                Source: common.smtpEmailId
            };

            // Create the promise and SES service object
            var sendPromise = new AWS.SES({ apiVersion: '2010-12-01' }).sendEmail(params).promise();

            // Handle promise's fulfilled/rejected states
            sendPromise.then(
                function (data) {
                    console.log(data.MessageId);
                }).catch(
                    function (err) {
                        console.error(err, err.stack);
                    });
        } else {
            callback('err');
        }
    }


}
var sendContactUsMailToAdmin = function (emailId, name, Subject, Message, url) {
    return function (callback) {
        if (emailId != "") {
            // Create sendEmail params 
            var params = {
                Destination: {
                    ToAddresses: [
                        emailId
                    ]
                },
                Message: {
                    Body: {
                        Html: {
                            Charset: "UTF-8",
                            Data: ejs.render(fs.readFileSync(dir + '/template/contact.ejs', 'utf-8'), { Email: emailId, Subject: Subject, name: name, Message: Message, url: url })
                        }
                    },
                    Subject: {
                        Charset: 'UTF-8',
                        Data: Subject
                    }
                },
                Source: common.smtpEmailId
            };

            // Create the promise and SES service object
            var sendPromise = new AWS.SES({ apiVersion: '2010-12-01' }).sendEmail(params).promise();

            // Handle promise's fulfilled/rejected states
            sendPromise.then(
                function (data) {
                    console.log(data.MessageId);
                }).catch(
                    function (err) {
                        console.error(err, err.stack);
                    });
        } else {
            callback('err');
        }
    }


}
var insertBotInfo = function (obj) { // w
    return function (callback) {
        if (Object.keys(obj).length > 0) {
            const Res = new Promise((resolve, reject) => {
                user.insertBotInfo(obj, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
        } else {
            callback('err');
        }
    }
}

module.exports = {
    async registration(req, res) {
        let name = req.body.name;
        var emailId = req.body.emailId;
        let password = req.body.password;
        let loginType = req.body.loginType;
        let shareCode = req.body.shareCode;

        var params = {
            "name": name,
            "emailId": emailId,
            "password": password,
            "loginType": loginType,
            "shareCode": shareCode
        };

        try {
            if (params.loginType == 'normal') {
                if (params.emailId != '' && params.password != '') {
                    const userRes = new Promise((resolve, reject) => {
                        user.registration(params, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });

                    let userId = await userRes;

                    if (userId != 0) {
                        // Notification send to user
                        async.waterfall([
                            sendMail(emailId, userId),
                        ], function (error, success) {
                            if (error) { res.send('Something is wrong!'); }
                        });

                        if (userId == "err") {
                            res.status(200).json({
                                statusCode: 201,
                                msg: 'The code is not valid.'
                            })
                        } else {
                            res.status(200).json({
                                statusCode: 200,
                                msg: 'Registration has been successfully.'
                            })
                        }
                    } else if (userId == 0) {
                        res.status(200).json({
                            statusCode: 201,
                            msg: 'This user already exit.'
                        })
                    } else if (userId == "err") {
                        res.status(200).json({
                            statusCode: 201,
                            msg: 'The code is not valid.'
                        })
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: 'Insert not sucessfully!'
                        })
                    }
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Parameter has been missing.'
                    })
                }
            } else if (params.loginType != 'normal') {
                if (params.emailId != '') {
                    const userRes = new Promise((resolve, reject) => {
                        user.socialLogin(params, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });

                    let userData = await userRes;

                    if (userData) {
                        if (userData[0].type == "yes") {
                            // Notification send to user
                            async.waterfall([
                                sendMail(emailId, userData[0].userId),
                            ], function (error, success) {
                                if (error) { res.send('Something is wrong!'); }
                            });
                        }

                        res.status(200).json({
                            statusCode: 200,
                            data: userData,
                            msg: 'login has been successfully.'
                        })
                    } else {
                        res.status(200).json({
                            statusCode: 201,
                            msg: 'Insert not sucessfully!'
                        })
                    }
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Parameter has been missing.'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Some issue has been arise.Pleae try again!'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async login(req, res) {
        let name = req.body.name;
        var emailId = req.body.emailId;
        let password = req.body.password;
        let loginType = req.body.loginType;
        let shareCode = req.body.shareCode;


        try {
            if (loginType == 'normal') {
                let params = {
                    "emailId": emailId,
                    "shareCode": shareCode,
                    "password": password,
                    "loginType": loginType
                };
                const userRes = new Promise((resolve, reject) => {
                    user.login(params, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                            res.status(200).json({
                                statusCode: 201,
                                msg: 'Password or Username is wrong!'
                            })
                        }
                    })
                });
                let userInfo = await userRes;
                if (userInfo) {
                    res.status(200).json({
                        statusCode: 200,
                        data: userInfo,
                        msg: 'login has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Password or Username is wrong!'
                    })
                }
            } else if (loginType == 'gmail' || loginType == 'fb') {
                let params = {
                    "emailId": emailId,
                    "shareCode": shareCode,
                    "password": password,
                    "loginType": loginType
                };
                const userRes = new Promise((resolve, reject) => {
                    user.socialLogin(params, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                            res.status(200).json({
                                statusCode: 201,
                                msg: 'Password or Username is wrong!'
                            })
                        }
                    })
                });

                let userInfo = await userRes;

                if (userInfo) {
                    res.status(200).json({
                        statusCode: 200,
                        data: userInfo,
                        msg: 'login has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Password or Username is wrong!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Some issue has been arise.Pleae try again!'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async changePassword(req, res, next) {
        let params = {
            "userId": req.body.userId,
            "password": req.body.password
        };

        try {
            if (params.userId != '' && params.password != '') {
                const userRes = new Promise((resolve, reject) => {
                    user.changePassword(params, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let userEmailId = await userRes;

                if (userEmailId) {
                    // Notification send to user
                    async.waterfall([
                        sendMailForChangePassword(userEmailId),
                    ], function (error, success) {
                        if (error) { res.send('Something is wrong!'); }
                    });
                    res.status(200).json({
                        statusCode: 200,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Some issue has been arise.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async forgotPassword(req, res, next) {
        let randomNumber = Math.floor(1000 + Math.random() * 9000);
        let generatePw = 'Password$' + randomNumber;

        let params = {
            "emailId": req.body.emailId,
            "generatePw": generatePw
        };

        try {
            if (params.emailId != '') {
                const pwRes = new Promise((resolve, reject) => {
                    user.setPassword(params, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });
                let pw = await pwRes;

                if (pw.length > 0) {
                    // Notification send to user
                    async.waterfall([
                        sendPassword(params.emailId, generatePw),
                    ], function (error, success) {
                        if (error) { res.send('Something is wrong!'); }
                    });

                    res.status(200).json({
                        statusCode: 200,
                        password: "Send password through the email."
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'This user is not avaliable!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please submit a password.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async profile(req, res, next) {
        let params = {
            "userId": req.body.userId
        };

        try {
            if (params.userId != '') {
                let path = common.profileImg + '/';
                const payRes = new Promise((resolve, reject) => {
                    user.profile(params, (result, err) => {
                        if (result) {
                            resolve(result);
                            res.status(200).json({
                                statusCode: 200,
                                data: result,
                                path: path
                            })
                        } else {
                            reject('ERROR')
                            res.status(200).json({
                                statusCode: 201,
                                data: '',
                                msg: 'No record found!'
                            })
                        }
                    })
                });
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please submit all parameters.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async userProfileUpdate(req, res, next) {
        let userId = req.body.userId;
        let name = req.body.name;
        let lastName = req.body.lastName;
        let phno = req.body.phno;
        let zipCode = req.body.zipCode;

        try {
            if (userId != '' && name != '') {
                let paramsData = {};
                paramsData = {
                    "userId": userId,
                    "name": name,
                    "phno": phno,
                    "lastName": lastName,
                    "zipCode": zipCode
                };

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async imageUpload(req, res, next) {
        let userId = req.body.userId;

        let uploader_file;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(200).json({
                statusCode: 201,
                msg: 'No files were uploaded.'
            })
        }

        let random = Math.random().toString(36).substring(2, 15);
        uploader_file = req.files.profileImg;
        let fileName = random + '_' + uploader_file.name;
        uploadPath = dir + '/userImg/' + fileName;
        let k = fileName.lastIndexOf('.');
        let fileExe = (k < 0) ? '' : fileName.substr(k);

        try {
            if (userId != '') {
                let paramsData = {};

                if (fileExe == ".jpg" || fileExe == ".png" || fileExe == ".jpeg" || fileExe == ".webp") {
                    uploader_file.mv(uploadPath, function (err) {
                        if (err)
                            return res.status(500).send(err);
                        //end
                    });
                    paramsData = {
                        "userId": userId,
                        "img": fileName
                    };
                }

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                let path = common.profileImg + '/' + fileName;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        path: path,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async slagNameUpdate(req, res, next) {
        let userId = req.body.userId;
        let slagName = req.body.slagName;
        try {
            if (userId != '') {
                let paramsData = {};

                paramsData = {
                    "userId": userId,
                    "slagName": slagName
                };

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async paypalEmailIdUpdate(req, res, next) {
        let userId = req.body.userId;
        let paypalEmailId = req.body.paypalEmailId;
        try {
            if (userId != '') {
                let paramsData = {};

                paramsData = {
                    "userId": userId,
                    "paypalEmailId": paypalEmailId
                };

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async createSareCode(req, res) {
        let randomNumber = Math.floor(1000 + Math.random() * 9000);
        var shareCode = 'code_' + randomNumber;

        var userId = req.body.userId;
        var storeId = req.body.storeId;
        var couponId = req.body.couponId;

        let params = {
            "userId": userId,
            "shareCode": shareCode,
            "storeId": storeId,
            "couponId": couponId
        };

        try {
            if (params.userId != '') {
                const pwRes = new Promise((resolve, reject) => {
                    user.createSareCode(params, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let pw = await pwRes;

                // get storeId
                var pwRes1 = "";
                var getStoreId = "";
                if (couponId != "") {
                    pwRes1 = new Promise((resolve, reject) => {
                        user.getStoreId(couponId, (result, err) => {
                            if (result) {
                                resolve(result);
                            } else {
                                reject('ERROR')
                            }
                        })
                    });
                    getStoreId = await pwRes1;
                }
                var url = common.baseURL + '?code=' + shareCode;

                if (pw) {
                    setTimeout(() => {
                        res.status(200).json({
                            statusCode: 200,
                            url: url
                        })
                    }, 100)


                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Not successfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please submit a password.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async contactUs(req, res) {
        let Email = req.body.Email;
        var name = req.body.name;
        var Lname = req.body.lname;
        let Subject = req.body.Subject;
        let Message = req.body.Message;
        let concatName = name + " " + Lname;

        let uploader_file;
        let uploadPath;
        let fileName = "";
        let url = "";

        if (req.files) { // || Object.keys(req.files).length != 0
            let random = Math.random().toString(36).substring(2, 15);
            uploader_file = req.files.attachImg;
            fileName = random + '_' + uploader_file.name;
            uploadPath = dir + '/fileForContact/' + fileName;
            let k = fileName.lastIndexOf('.');
            let fileExe = (k < 0) ? '' : fileName.substr(k);

            uploader_file.mv(uploadPath, function (err) {
                if (err)
                    return res.status(500).send(err);
                //end
            });

            url = common.fileForContact + '/' + fileName;
        }

        var params = {
            "name": concatName,
            "Email": Email,
            "Subject": Subject,
            "Message": Message
        };

        try {
            if (params.Email != '') {
                async.waterfall([
                    sendContactUsMail(Email, name, Subject, Message),
                ], function (error, success) {
                    if (error) { res.send('Something is wrong!'); }
                });

                // send mail to admin
                async.waterfall([
                    sendContactUsMailToAdmin("admin@giveawayhubs.com", name, Subject, Message, url),
                ], function (error, success) {
                    if (error) { res.send('Something is wrong!'); }
                });

                res.status(200).json({
                    statusCode: 200,
                    msg: 'You has been sent successfully.'
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Parameter has been missing.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getUserListForShareCode(req, res, next) {
        let userId = req.body.userId;
        try {
            const payRes = new Promise((resolve, reject) => {
                user.getUserListForShareCode(userId, (result, err) => {
                    if (result.length > 0) {
                        resolve(result);
                        res.status(200).json({
                            statusCode: 200,
                            data: result
                        })
                    } else {
                        reject('ERROR')
                        res.status(200).json({
                            statusCode: 201,
                            data: '',
                            msg: 'No record found!'
                        })
                    }
                })
            });
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async trackInfoForBot(req, res) {
        let botUser = req.body.botUser;
        let pageUrl = req.body.pageUrl;
        let currentDate = req.body.currentDate;
        let currentTime = req.body.currentTime;
        let ipAdd = req.body.ipAdd;

        try {
            if (botUser != "" && pageUrl != "" && currentDate != "" && currentTime != "") {
                // get user details
                let params = {
                    "botUser": botUser,
                    "pageUrl": pageUrl,
                    "currentDate": currentDate,
                    "currentTime": currentTime,
                    "ipAdd": ipAdd
                }

                async.waterfall([
                    insertBotInfo(params)
                ], function (error, success) {
                    if (error) {
                        console.log(` ERROR: ${error}`)
                    }
                });

                res.status(200).json({
                    statusCode: 200,
                    msg: "Insert has been Successfully in beta DB"
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send all parameters!'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    // new implement by feb 2023
    async getOrderItem(req, res) {
        let userId = req.body.userId;
        let orderId = req.body.orderId;

        try {
            const payRes = new Promise((resolve, reject) => {
                user.getOrderInfo2(orderId, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let orderInfo = await payRes;

            //
            const userRes = new Promise((resolve, reject) => {
                user.getUserList(userId, (result, err) => {
                    if (result) {
                        resolve(result);
                    } else {
                        reject('ERROR')
                    }
                })
            });
            let userList = await userRes;

            if (orderInfo.length > 0) {
                res.status(200).json({
                    statusCode: 200,
                    orderInfo: orderInfo,
                    userList: userList,
                    msg: "Successfully"
                })
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'No record found!'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async preferenceDataList(req, res) {
        let userId = req.body.userId;

        try {
            if (userId != '') {
                const pwRes = new Promise((resolve, reject) => {
                    user.getPreferenceList(userId, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let pw = await pwRes;

                if (pw.length > 0) {
                    res.status(200).json({
                        statusCode: 200,
                        data: pw,
                        msg: "Successfully"
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'No record found'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send valid parameters.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async preferenceDataAdd(req, res) {
        let userId = req.body.userId;
        let categoryList = req.body.categoryList;
        let storeList = req.body.storeList;

        try {
            if (userId != '' && (categoryList != '' || storeList != '')) {
                let params = {
                    "userId": userId,
                    "categoryList": categoryList,
                    "storeList": storeList
                };

                const pwRes = new Promise((resolve, reject) => {
                    user.preferenceAdd(params, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let pw = await pwRes;

                if (pw) {
                    if (pw != 0) {
                        res.status(200).json({
                            statusCode: 200,
                            msg: "Your submission has been Successfully"
                        })
                    } else if (pw == 0) {
                        res.status(200).json({
                            statusCode: 200,
                            msg: 'Your submission has been updated Successfully'
                        })
                    }
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send valid parameters.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async addProfileImg(req, res, next) {
        let userId = req.body.userId;

        let uploader_file;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(200).json({
                statusCode: 201,
                msg: 'No files were uploaded.'
            })
        }

        let random = Math.random().toString(36).substring(2, 15);
        uploader_file = req.files.profileImg;
        let fileName = random + '_' + uploader_file.name;
        uploadPath = dir + '/userImg/' + fileName;
        let k = fileName.lastIndexOf('.');
        let fileExe = (k < 0) ? '' : fileName.substr(k);

        try {
            if (userId != '') {
                let paramsData = {};

                if (fileExe == ".jpg" || fileExe == ".png" || fileExe == ".jpeg" || fileExe == ".webp") {
                    uploader_file.mv(uploadPath, function (err) {
                        if (err)
                            return res.status(500).send(err);
                        //end
                    });
                    paramsData = {
                        "userId": userId,
                        "profileImg": fileName
                    };
                }

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                let path = common.profileImg + '/' + fileName;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        path: path,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async addBannerImg(req, res, next) {
        let userId = req.body.userId;

        let uploader_file;
        let uploadPath;

        if (!req.files || Object.keys(req.files).length === 0) {
            return res.status(200).json({
                statusCode: 201,
                msg: 'No files were uploaded.'
            })
        }

        let random = Math.random().toString(36).substring(2, 15);
        uploader_file = req.files.profileImg;
        let fileName = random + '_' + uploader_file.name;
        uploadPath = dir + '/userImg/' + fileName;
        let k = fileName.lastIndexOf('.');
        let fileExe = (k < 0) ? '' : fileName.substr(k);

        try {
            if (userId != '') {
                let paramsData = {};

                if (fileExe == ".jpg" || fileExe == ".png" || fileExe == ".jpeg" || fileExe == ".webp") {
                    uploader_file.mv(uploadPath, function (err) {
                        if (err)
                            return res.status(500).send(err);
                        //end
                    });
                    paramsData = {
                        "userId": userId,
                        "bannerImg": fileName
                    };
                }

                const userRes = new Promise((resolve, reject) => {
                    user.putProfileUpdate(paramsData, (result, err) => {
                        if (result) {
                            //console.error(` Succ: ${result}`)
                            resolve(result);
                        } else {
                            //console.log(` ERROR: ${err}`)
                            reject('ERROR')
                        }
                    })
                });

                let rs = await userRes;

                let path = common.profileImg + '/' + fileName;

                if (rs == 'Success') {
                    res.status(200).json({
                        statusCode: 200,
                        path: path,
                        data: 'Update has been successfully.'
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'Update not sucessfully!'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send the mendetory fild value.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },
    async getPreferenceData(req, res) {
        let userId = req.body.userId;

        try {
            if (userId != '') {
                const pwRes = new Promise((resolve, reject) => {
                    user.getPreferenceData(userId, (result, err) => {
                        if (result) {
                            resolve(result);
                        } else {
                            reject('ERROR')
                        }
                    })
                });
                let pw = await pwRes;

                if (pw.length > 0) {
                    res.status(200).json({
                        statusCode: 200,
                        data: pw,
                        storeImgUrl: common.storeImgUrl,
                        msg: "Successfully"
                    })
                } else {
                    res.status(200).json({
                        statusCode: 201,
                        msg: 'No record found'
                    })
                }
            } else {
                res.status(200).json({
                    statusCode: 201,
                    msg: 'Please send valid parameters.'
                })
            }
        } catch (ex) {
            console.error(`ERROR: ${ex}`)
        }
    },

    //
    async newsLetter(req, res, next) {
        let emailId = req.body.emailId;
        const updateRes = new Promise((resolve, reject) => {
            campaign.setNewsLetter(emailId, (result, err) => {
                if (result) {
                    resolve(result);
                } else {
                    reject('ERROR')
                }
            })
        });
        let updateData = await updateRes;

        if (updateData != "Err") {
            async.series([
                function (callback) {
                    setTimeout(function () {
                        console.log('Task 1');
                        newsLettermailsend(emailId, updateData);
                        callback(null, 1);
                    }, 100);
                }
            ], function (error, results) {
                //console.log(results);
            });

            res.status(200).json({
                statusCode: 200,
                msg: "Successfully"
            })
        } else {
            res.status(200).json({
                statusCode: 201,
                msg: 'No record found!'
            })
        }
    },

}

