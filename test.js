
// const http = require('http');
// var options = {
//   host: 'ifconfig.me',
//   port: 80,
//   path: '/ip',
//   method: 'GET'
// };

// http.request(options, function(res) {
//   console.log('STATUS: ' + res.statusCode);
//   console.log('HEADERS: ' + JSON.stringify(res.headers));
//   res.setEncoding('utf8');
//   res.on('data', function (chunk) {
//     console.log('BODY: ' + chunk);
//   });
// }).end();

const requestListener = function (req, res) {
  res.writeHead(200);
  res.end('Hello, World!');
}

const http = require('http');
const server = http.createServer(requestListener);
server.listen(8080);