const {GoogleAuth} = require('google-auth-library');
const targetAudience = "cloud-function-url"

async function run() {
	const auth = new GoogleAuth();

	const client = await auth.getIdTokenClient(targetAudience);
	const res = await client.request({ url });
	console.info(res.data);
}

exports.helloHttp = (req, res) => {

    run();

    var name = "";
    if(req.query.name)
        name = req.query.name;
    else
        if(req.body.name)
            name = req.body.name;
        else    
            name = "Unknow";

    var ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress;
    var agent = req.headers['user-agent'];
    var host = req.headers['host'];
    var appengineCity = req.headers['x-appengine-city'] || "Unknow";
    var appengineCitylatlong = req.headers['x-appengine-citylatlong'] || "Unknow";
    var appengineCountry = req.headers['x-appengine-country'] || "Unknow";


    console.log('helloHttp req=', JSON.stringify(req.headers));
    console.log(`helloHttp name=${name} ip=${ip} agent=${agent} appengineCity=${appengineCity} appengineCitylatlong=${appengineCitylatlong} appengineCountry=${appengineCountry}`);
    res.send(`Hello ${name} / name=${name} ip=${ip} agent=${agent} appengineCity=${appengineCity} appengineCitylatlong=${appengineCitylatlong} appengineCountry=${appengineCountry}`);

};