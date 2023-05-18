const db = require('../../config/db');

module.exports = {
    MetaContentdata(pageName, callback){
        let q = "SELECT `page_title`, `keywords`, `author`, `meta_description`, `robots` FROM `seo_info` where page_name='"+pageName+"' and  status = 'Y'";
        db.query(q, (err, res) => {
            if (err) throw err;
            if (res.length > 0) {
                callback(res);
            } else {
                let arr = [];
			    callback(arr)
            }
        })
    },
    
}