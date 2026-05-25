// =====================================
// Simple Web4 / Objective-J Runtime
// =====================================

// Global runtime
const Runtime = {

```
classes: {},
modules: {},

registerClass(name, cls) {

    this.classes[name] = cls;
},

getClass(name) {

    return this.classes[name];
}
```

};

// =====================================
// Message Dispatcher
// =====================================

function msgSend(receiver, selector, ...args) {

```
if (!receiver) {
    throw new Error(
        `Null receiver for '${selector}'`
    );
}

const method = receiver[selector];

if (!method) {

    throw new Error(
        `Selector '${selector}' not found`
    );
}

return method.apply(receiver, args);
```

}

// =====================================
// Class Creator
// =====================================

function createClass(name, methods) {

```
class DynamicClass {

    constructor(...args) {

        if (methods.init) {
            methods.init.apply(this, args);
        }
    }
}

for (const key in methods) {

    if (key !== "init") {

        DynamicClass.prototype[key] =
            methods[key];
    }
}

Runtime.registerClass(name, DynamicClass);

return DynamicClass;
```

}

// =====================================
// Execute Runtime File
// =====================================

async function executeFile(path) {

```
const response = await fetch(path);

if (!response.ok) {

    throw new Error(
        `Failed loading ${path}`
    );
}

const source = await response.text();

// Create isolated module scope
const moduleFunc = new Function(

    "Runtime",
    "createClass",
    "msgSend",

    source
);

moduleFunc(
    Runtime,
    createClass,
    msgSend
);

Runtime.modules[path] = true;

console.log(`Loaded: ${path}`);
```

}

// =====================================
// Boot Loader
// =====================================

async function boot() {

```
await executeFile("/modules/person.sj");

const Person =
    Runtime.getClass("Person");

const user =
    new Person("KUBU");

msgSend(user, "speak");
```

}

boot();
