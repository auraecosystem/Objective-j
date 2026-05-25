// ========================================
// main.sj
// WEB4 Runtime Loader
// ========================================

const Runtime = {

```
loaded: {},
classes: {}
```

};

// ========================================
// Message Dispatcher
// ========================================

function msgSend(
receiver,
selector,
...args
) {

```
const method =
    receiver[selector];

if (!method) {

    throw new Error(
        `Missing selector ${selector}`
    );
}

return method.apply(
    receiver,
    args
);
```

}

// ========================================
// Objective-J Parser
// ========================================

function compileObjectiveJ(source) {

```
// Transform:
// [obj method]
// ->
// msgSend(obj, "method")

return source.replace(

    /\[(\w+)\s+(\w+)\]/g,

    (_, obj, method) => {

        return `msgSend(${obj}, "${method}")`;
    }
);
```

}

// ========================================
// File Loader
// ========================================

async function loadFile(path) {

```
const response =
    await fetch(path);

const source =
    await response.text();

const compiled =
    compileObjectiveJ(source);

execute(compiled);
```

}

// ========================================
// Execute
// ========================================

function execute(code) {

```
const fn =
    new Function(

        "msgSend",
        code
    );

fn(msgSend);
```

}

// ========================================
// BOOT
// ========================================

loadFile("/app/Main.j");
