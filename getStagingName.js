const fs = require('fs');
let rawdata = fs.readFileSync(`./temp.staging`);
let data = JSON.parse(rawdata);
//console.log(data);
//console.log('parse data')
console.log(data.sid)