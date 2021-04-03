const http = require('http');
const os = require('os');

console.log('server is listening ...');
var handler = function(request, response)
{
	console.log("Received request from " + request.connection.remoteAddress);
	response.writeHead(200);
	response.end(os.hostname() + ": Thank you so much for your request\n");
};

var www = http.createServer(handler);
www.listen(8080);
