module.exports = function(config) {

  console.log("\n=== WEB4 RUNTIME BOOT ===");

  console.log("App:", config.app.name);
  console.log("Version:", config.app.version);

  if (config.web4.p2p) {
    console.log("P2P network: ENABLED");
  }

  if (config.ai.enabled) {
    console.log("AI Engine: ACTIVE →", config.ai.model);
  }

  console.log("\nLaunching Objective-J VM...\n");

  require('../vm/objectivej-runtime.js')(config);
};
