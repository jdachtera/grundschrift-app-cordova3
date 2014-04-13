#!/usr/local/bin/node

var http = require('http'),
    url = require('url'),
    path = require('path'),
    fs = require('fs'),
    exec        = require('child_process').exec,
    os          = require("os");

var mimeTypes = {
    "html": "text/html",
    "jpeg": "image/jpeg",
    "jpg": "image/jpeg",
    "png": "image/png",
    "js": "text/javascript",
    "css": "text/css"};

http.createServer(function(req, res) {
    var uri = url.parse(req.url).pathname;
    var filename = path.join(process.cwd() + '/src/', uri);
    path.exists(filename, function(exists) {
        if(!exists) {
            console.log("not exists: " + filename);
            res.writeHead(200, {'Content-Type': 'text/plain'});
            res.write('404 Not Found\n');
            res.end();
            return;
        }
        var mimeType = mimeTypes[path.extname(filename).split(".")[1]];
        res.writeHead(200, mimeType);

        var fileStream = fs.createReadStream(filename);
        fileStream.pipe(res);

    }); //end path.exists
}).listen(8099);

console.log("Server is running at: http://127.0.0.1:8099");
console.log("Attempting to open your browser at http://127.0.0.1:8099/debug.html");

if (os.platform() == 'darwin') {
    exec('open http://127.0.0.1:8099/debug.html');
} else if (os.platform() == 'linux') {
    exec('xdg-open http://127.0.0.1:8099/debug.html');
} else if (os.platform() == 'win32') {
    exec('cmd /c "start http://127.0.0.1:8099/debug.html"');
}