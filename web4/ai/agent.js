class Agent {

  run(task) {
    console.log("[AI] executing task:", task);
    return `done(${task})`;
  }
}

module.exports = Agent;
