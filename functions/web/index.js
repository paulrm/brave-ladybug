// const {GoogleAuth} = require('google-auth-library');
// const targetAudience = "cloud-function-url"



exports.helloHttp = (req, res) => {

    // console.info("helloHttp / Start");

    //  async () => { 

    // console.info("run / Start");
    
    // const url = 'https://us-central1-brave-ladybug.cloudfunctions.net/helloHttp';
    // let targetAudience = 'unauthenticated';

    // if (!targetAudience) {
    //     // Use the request URL hostname as the target audience for requests.
    //     const {URL} = require('url');
    //     targetAudience = new URL(url);
    //   }




	// const auth = new GoogleAuth();

	// const client = await auth.getIdTokenClient(targetAudience);
	// const res = await client.request({ url });
	// console.info(res.data);
    // console.info("run / End");
    // }

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
    var functionExecutionId = req.headers['function-execution-id'] || "Unknow";


    console.log('helloHttp req=', JSON.stringify(req.headers));
    console.log(`helloHttp name=${name} functionExecutionId=${functionExecutionId} host=${host} ip=${ip} agent=${agent} appengineCity=${appengineCity} appengineCitylatlong=${appengineCitylatlong} appengineCountry=${appengineCountry}`);
    res.send(`Hello ${name} /           functionExecutionId=${functionExecutionId} host=${host} ip=${ip} agent=${agent} appengineCity=${appengineCity} appengineCitylatlong=${appengineCitylatlong} appengineCountry=${appengineCountry}`);;

};