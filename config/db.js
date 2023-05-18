const mysql = require('mysql');
require('dotenv').config();

var pool  = mysql.createPool({
  connectionLimit : 5,
  host            : 'localhost',
  user            : 'root',
  password        : '', 
  database        : 'giveawayhubs' 
});

module.exports = {
  query: (text, params, callback) => {
    return pool.query(text, params, callback)
  },
}