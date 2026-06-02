const JSON5 = require("json5");
const fs = require("fs");

class VM {

  constructor() {
    this.config = JSON5.parse(
      fs.readFileSync("./config/runtime.json5", "utf8")
    );
  }

  start() {
    console.log("[VM] Objective-J Web4 Runtime Starting...");

    if (this.config.runtime.sandbox) {
      console.log("[VM] Sandbox mode enabled");
    }

    this.bootScheduler();
    this.bootAI();
  }

  bootScheduler() {
    console.log("[VM] Scheduler online");
  }

  bootAI() {
    if (this.config.ai.enabled) {
      console.log("[AI] Hooks active");
    }
  }
}

module.exports = VM;
