/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */
 exports.helloWorld = (req, res) => {
    console.log("requestHellocloud");
    const http = require('http');
    var options = {
      host: 'us-central1-brave-ladybug.cloudfunctions.net',
      port: 80,
      path: '/helloHttp',
      method: 'GET'
    };
  
    http.request(options, function(resp) {
      console.log('STATUS: ' + resp.statusCode);
      console.log('HEADERS: ' + JSON.stringify(resp.headers));
      resp.setEncoding('utf8');
      resp.on('data', function (chunk) {
        console.log('BODY: ' + chunk);
        res.writeHead(200);
        res.end('Hello, World! from ' + chunk);
      });
    }).end();
  };
  