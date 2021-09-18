/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */
 exports.helloWorld = (reqS, res) => {
    console.log("requestHellocloud");
    const https = require('https');
    const data = JSON.stringify({
      name: 'Jane'
    })

    var options = {
      hostname: 'us-central1-brave-ladybug.cloudfunctions.net',
      port: 443,
      path: '/helloHttp',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': data.length
      }
    };

    const req = https.request(options, res => {
      console.log(`statusCode: ${res.statusCode}`)
    
      res.on('data', d => {
        //process.stdout.write(d)
            res.writeHead(200);
          res.end('Hello, World!', d );
      })
    })
    
    req.on('error', error => {
      console.error(error)
    })
    
    req.write(data)
    req.end()
  
    // res.writeHead(200);
    // res.end('Hello, World!');


    // https.request(options, function(resp) {
    //   console.log('STATUS: ' + resp.statusCode);
    //   console.log('HEADERS: ' + JSON.stringify(resp.headers));
    //   resp.setEncoding('utf8');
    //   resp.on('data', function (chunk) {
    //     console.log('BODY: ' + chunk);
    //     res.writeHead(200);
    //     res.end('Hello, World! from ' + chunk);
    //   });
    // }).end();
  };
  