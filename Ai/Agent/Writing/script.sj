class Agent {
```
constructor(config) {

    this.name =
        config.name;

    this.role =
        config.role;

    this.objective =
        config.objective;
}

think(input) {

    console.log(

        `[${this.name}]`,
        input
    );
}
```

}

function spawnAgent(name) {

```
const config =
    WEB4.ai.prompts[name];

return new Agent(config);
```

}
