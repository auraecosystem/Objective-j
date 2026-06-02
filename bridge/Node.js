const JSON5 = require('json5');
const fs = require('fs');

console.log("Bridge starting...");

// Load JSON5 config
const config = JSON5.parse(
  fs.readFileSync('./config/runtime.json5', 'utf8')
);

console.log("Config loaded:");
console.log(config);

// Start runtime
require('../runtime/loader.js')(config);
