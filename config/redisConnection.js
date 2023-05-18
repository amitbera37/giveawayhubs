const redis = require('redis');
var async = require('async');

// async function createRedisClient() {
//   const client = redis.createClient(
//     {
//       host: '127.0.0.1',
//       port: 6379
//     }
//   );

//   client.on('connect', () => console.log('Connected to REDIS!'));
//   client.on('error', (err) => console.log('Error connecting to REDIS: ', err));

//   await client.connect();

//   return client;
// }

// module.exports = createRedisClient();