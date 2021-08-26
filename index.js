/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */
 exports.helloWorld = (req, res) => {
    console.log("requestHellocloud");
    //console.log(process.env)
    let message = req.query.message || req.body.message || 'Hello from Cloud!';
    res.status(200).send(message);
  };
  