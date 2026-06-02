const Web4Node = require("./node");

class Cluster {

  constructor(size = 3) {
    this.nodes = [];

    for (let i = 0; i < size; i++) {
      this.nodes.push(new Web4Node(i));
    }
  }

  start() {
    console.log("[CLUSTER] starting Web4 network");

    this.nodes.forEach(node => {
      node.broadcast("init");
    });
  }
}

module.exports = Cluster;
