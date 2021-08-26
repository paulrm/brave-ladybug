/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */
 exports.helloWorld = (req, res) => {
    console.log("requestHelloSudamerica");
    console.log(process.env)
    res.send(`Hello ${escapeHtml(req.query.name || req.body.name || 'World')}!`);
  };
  