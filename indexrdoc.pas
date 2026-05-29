const ConfigLoader = require('./config-loader');

const config = new ConfigLoader();

const runtimeConfig = config.get('runtime');

console.log('=== OBJECTIVE-J RUNTIME ===');

console.log(runtimeConfig);

if (runtimeConfig.web4.realtimeSync) {
    console.log('Realtime sync enabled');
}

if (runtimeConfig.ai.enabled) {
    console.log('AI runtime active');
}


