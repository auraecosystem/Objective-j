module.exports = function(config) {

  class CPObject {
    constructor() {
      this.id = Math.random().toString(36).substr(2);
    }
  }

  class Runtime extends CPObject {
    start() {
      console.log("Objective-J VM running...");
      console.log("Distributed mode:", config.web4.distributed);
      console.log("Realtime sync:", config.web4.realtimeSync);
    }
  }

  const vm = new Runtime();
  vm.start();

  console.log("\nSYSTEM ONLINE ✔");
};
