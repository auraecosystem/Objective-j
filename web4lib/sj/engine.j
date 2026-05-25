// ======================================================
// WEB4 / OBJECTIVE-J STYLE RUNTIME ENGINE
// ======================================================

// =======================================
// GLOBAL RUNTIME
// =======================================

const Runtime = {

```
classes: {},
modules: {},
cache: {},
hooks: {},

registerClass(name, cls) {

    this.classes[name] = cls;
},

getClass(name) {

    return this.classes[name];
},

registerHook(name, fn) {

    this.hooks[name] = fn;
},

triggerHook(name, payload) {

    if (this.hooks[name]) {
        this.hooks[name](payload);
    }
}
```

};

// =======================================
// MESSAGE DISPATCH SYSTEM
// =======================================

function msgSend(receiver, selector, ...args) {

```
if (!receiver) {

    throw new Error(
        `Null receiver for selector '${selector}'`
    );
}

const method = receiver[selector];

if (typeof method !== "function") {

    throw new Error(
        `Method '${selector}' not found`
    );
}

return method.apply(receiver, args);
```

}

// =======================================
// CLASS FACTORY
// =======================================

function createClass(
name,
methods = {},
superClass = null
) {

```
class DynamicClass {

    constructor(...args) {

        this.__className = name;

        if (methods.init) {
            methods.init.apply(this, args);
        }
    }
}

// Inheritance
if (superClass) {

    DynamicClass.prototype =
        Object.create(superClass.prototype);
}

// Attach methods
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

// =======================================
// IMPORT SYSTEM
// =======================================

async function importModule(path) {

```
// Already loaded
if (Runtime.modules[path]) {

    console.log(
        `[CACHE] ${path}`
    );

    return;
}

console.log(
    `[LOAD] ${path}`
);

const response = await fetch(path);

if (!response.ok) {

    throw new Error(
        `Cannot load module ${path}`
    );
}

const source = await response.text();

Runtime.cache[path] = source;

executeModule(source, path);

Runtime.modules[path] = true;
```

}

// =======================================
// MODULE EXECUTION
// =======================================

function executeModule(source, path) {

```
Runtime.triggerHook(
    "beforeExecute",
    path
);

const moduleScope = new Function(

    "Runtime",
    "createClass",
    "msgSend",
    "importModule",

    source
);

moduleScope(
    Runtime,
    createClass,
    msgSend,
    importModule
);

Runtime.triggerHook(
    "afterExecute",
    path
);
```

}

// =======================================
// HOT RELOAD SYSTEM
// =======================================

async function reloadModule(path) {

```
console.log(
    `[RELOAD] ${path}`
);

delete Runtime.modules[path];

await importModule(path);
```

}

// =======================================
// SIMPLE EVENT BUS
// =======================================

const EventBus = {

```
events: {},

on(event, fn) {

    if (!this.events[event]) {
        this.events[event] = [];
    }

    this.events[event].push(fn);
},

emit(event, payload) {

    const listeners =
        this.events[event] || [];

    for (const fn of listeners) {
        fn(payload);
    }
}
```

};

// =======================================
// VIRTUAL COMPONENT SYSTEM
// =======================================

function createComponent(
selector,
render
) {

```
const el =
    document.querySelector(selector);

if (!el) {

    throw new Error(
        `Component target not found`
    );
}

function update(state) {

    el.innerHTML = render(state);
}

return {
    update
};
```

}

// =======================================
// AI / DEBUG HOOKS
// =======================================

Runtime.registerHook(

```
"beforeExecute",

(path) => {

    console.log(
        `[AI] Preparing ${path}`
    );
}
```

);

Runtime.registerHook(

```
"afterExecute",

(path) => {

    console.log(
        `[AI] Finished ${path}`
    );
}
```

);

// =======================================
// BOOT ENGINE
// =======================================

async function boot() {

```
console.log(
    "WEB4 Runtime Booting..."
);

await importModule(
    "/modules/app.js"
);

console.log(
    "WEB4 Runtime Ready"
);
```

}

// =======================================
// START
// =======================================

boot();
