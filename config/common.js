require('dotenv').config();

const baseURL           = 'https://giveawayhubs.com/login';  
const storeImgUrl       = 'https://staging-api.giveawayhubs.com/store'; //process.env.s3Url+
const catImgUrl         = 'https://staging-api.giveawayhubs.com/category';
const couponImgUrl      = 'https://staging-api.giveawayhubs.com/coupon';


const profileImg        = 'https://staging-api.giveawayhubs.com/userImg'; // process.env.baseUrl+
const fileForContact    = 'https://staging-api.giveawayhubs.com/fileForContact';
// sender ID
const smtpEmailId       = "info@giveawayhubs.com"; 
const smtpUser          = "info@giveawayhubs.com"; 
const smtpPassword      = "Anisofttech2023@"; 

const couponAPIKey      = "76069d430806ee26b5fb193a3a612566"; 
const encryptKey        = "softech@maa#$baba&*"; 
const jwtKey            = "ani@#soft";
const jwtExpirySeconds  = 300;

module.exports = {
    baseURL,
    storeImgUrl,
    catImgUrl,
    couponImgUrl,
    profileImg,
    fileForContact,
    smtpEmailId,
    smtpUser,
    smtpPassword,
    couponAPIKey,
    encryptKey,
    jwtKey,
    jwtExpirySeconds
}
