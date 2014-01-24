var app = require('express')()
  , server = require('http').createServer(app)
  , io = require('socket.io').listen(server)
  , stdin = process.stdin;

var lastSend = new Date().getTime();
var deltaSend = 500;
var d = new Date;
var buff = '';

stdin.resume();
stdin.setEncoding('utf8');
io.set('log level', 0);

process.stdin.on('data', function(chunk) {
	buff += chunk;
	if (buff.length >= 99) readIn();
});

function readIn() {
	function conv (i) {
		switch (buff.substring(7 * i + 1, 7 * (i + 1) + 1)) {
		case "1111110": return 0;
		case "0110000": return 1;
		case "1101101": return 2;
		case "1111001": return 3;
		case "0110011": return 4;
		case "1011011": return 5;
		case "1011111": return 6;
		case "1110000": return 7;
		case "1111111": return 8;
		case "1111011": return 9;
		default: return -1;
		}
	}
	
	var time = new Date().getTime();
	if (time - lastSend > deltaSend) {
		lastSend = time;
		d.a = ((conv(11) * 10 + conv(10)) * 10 + conv(13)) * 10 + conv(12));
		d.m = conv(9) * 10 + conv(8));
		d.j = conv(7) * 10 + conv(6));
		d.h = conv(5) * 10 + conv(4));
		d.mn(conv(3) * 10 + conv(2));
		d.s(conv(1) * 10 + conv(0));
		io.sockets.emit('update', { date: d });
		process.stdout.write('\r' + d);
	}
	buff = buff.substring(99);
}

console.log('Clock server listening on port 3616');
server.listen(3616);

app
.get('/', function (req, res) {
	res.sendfile(__dirname + '/clock.html');
})
.get('/raphael.js', function (req, res) {
	res.sendfile(__dirname + '/raphael.js');
})
;

