
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

const requestListener = function (req, resq) {

  //--async request----------------------------
  const http = require('http');
  var options = {
    host: 'ifconfig.me',
    port: 80,
    path: '/ip',
    method: 'GET'
  };

  http.request(options, function(resp) {
    console.log('STATUS: ' + resp.statusCode);
    console.log('HEADERS: ' + JSON.stringify(resp.headers));
    resp.setEncoding('utf8');
    resp.on('data', function (chunk) {
      console.log('BODY: ' + chunk);
      resq.writeHead(200);
      resq.end('Hello, World!' + chunk);
    });
  }).end();
  //----------------------------------------


}

const http = require('http');
const server = http.createServer(requestListener);
server.listen(8080);