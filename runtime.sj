// ======================================================
// WEB4 ENGINE
// Objective-J + Haml + GLSL Runtime
// ======================================================

// ======================================================
// GLOBAL ENGINE
// ======================================================

const WEB4 = {

```
classes: {},
modules: {},
shaders: {},
cache: {}
```

};

// ======================================================
// MESSAGE DISPATCH
// ======================================================

function msgSend(receiver, selector, ...args) {

```
if (!receiver) {

    throw new Error(
        `Null receiver`
    );
}

const method =
    receiver[selector];

if (!method) {

    throw new Error(
        `Selector '${selector}' missing`
    );
}

return method.apply(
    receiver,
    args
);
```

}

// ======================================================
// CLASS FACTORY
// ======================================================

function createClass(name, methods) {

```
class RuntimeClass {

    constructor(...args) {

        this.__className = name;

        if (methods.init) {

            methods.init.apply(
                this,
                args
            );
        }
    }
}

for (const key in methods) {

    if (key !== "init") {

        RuntimeClass.prototype[key] =
            methods[key];
    }
}

WEB4.classes[name] =
    RuntimeClass;

return RuntimeClass;
```

}

// ======================================================
// OBJECTIVE-J COMPILER
// ======================================================

function compileObjectiveJ(source) {

```
return source.replace(

    /\[(\w+)\s+(\w+)\]/g,

    (_, obj, method) => {

        return `
            msgSend(
                ${obj},
                "${method}"
            )
        `;
    }
);
```

}

// ======================================================
// MINI HAML COMPILER
// ======================================================

function compileHaml(source) {

```
const lines =
    source.split("\n");

let html = "";

for (let line of lines) {

    line = line.trim();

    if (!line) continue;

    // .class syntax

    if (line.startsWith(".")) {

        const parts =
            line.split(" ");

        const className =
            parts[0].substring(1);

        const content =
            parts.slice(1).join(" ");

        html += `
            <div class="${className}">
                ${content}
            </div>
        `;

        continue;
    }

    // %tag syntax

    if (line.startsWith("%")) {

        const parts =
            line.split(" ");

        const tag =
            parts[0].substring(1);

        const content =
            parts.slice(1).join(" ");

        html += `
            <${tag}>
                ${content}
            </${tag}>
        `;
    }
}

return html;
```

}

// ======================================================
// LOAD HAML VIEW
// ======================================================

async function loadView(path) {

```
const response =
    await fetch(path);

const source =
    await response.text();

return compileHaml(source);
```

}

// ======================================================
// RENDER VIEW
// ======================================================

async function renderView() {

```
const html =
    await loadView(
        "/views/Home.haml"
    );

document.body.innerHTML =
    html;
```

}

// ======================================================
// GLSL SHADER VIEW
// ======================================================

class ShaderView {

```
constructor(config) {

    this.fragment =
        config.fragment;

    this.canvas =
        document.createElement(
            "canvas"
        );

    document.body.appendChild(
        this.canvas
    );

    this.gl =
        this.canvas.getContext(
            "webgl"
        );
}


compileShader(type, source) {

    const gl = this.gl;

    const shader =
        gl.createShader(type);

    gl.shaderSource(
        shader,
        source
    );

    gl.compileShader(shader);

    return shader;
}


render() {

    const gl = this.gl;

    const vertexShader =
        this.compileShader(

            gl.VERTEX_SHADER,

            `
            attribute vec4 position;

            void main() {

                gl_Position =
                    position;
            }
            `
        );

    const fragmentShader =
        this.compileShader(

            gl.FRAGMENT_SHADER,

            this.fragment
        );

    const program =
        gl.createProgram();

    gl.attachShader(
        program,
        vertexShader
    );

    gl.attachShader(
        program,
        fragmentShader
    );

    gl.linkProgram(program);

    gl.useProgram(program);

    const vertices =
        new Float32Array([

            -1, -1,
             1, -1,
            -1,  1,

            -1,  1,
             1, -1,
             1,  1
        ]);

    const buffer =
        gl.createBuffer();

    gl.bindBuffer(
        gl.ARRAY_BUFFER,
        buffer
    );

    gl.bufferData(

        gl.ARRAY_BUFFER,

        vertices,

        gl.STATIC_DRAW
    );

    const position =
        gl.getAttribLocation(
            program,
            "position"
        );

    gl.enableVertexAttribArray(
        position
    );

    gl.vertexAttribPointer(

        position,
        2,
        gl.FLOAT,
        false,
        0,
        0
    );

    gl.viewport(

        0,
        0,

        this.canvas.width =
            window.innerWidth,

        this.canvas.height =
            window.innerHeight
    );

    gl.drawArrays(
        gl.TRIANGLES,
        0,
        6
    );
}
```

}

// ======================================================
// MODULE EXECUTION
// ======================================================

function execute(code) {

```
const fn =
    new Function(

        "WEB4",
        "msgSend",
        "createClass",
        "ShaderView",

        code
    );

fn(
    WEB4,
    msgSend,
    createClass,
    ShaderView
);
```

}

// ======================================================
// LOAD MODULE
// ======================================================

async function loadModule(path) {

```
if (WEB4.modules[path]) {
    return;
}

const response =
    await fetch(path);

const source =
    await response.text();

const compiled =
    compileObjectiveJ(source);

execute(compiled);

WEB4.modules[path] =
    true;

console.log(
    `[WEB4] Loaded ${path}`
);
```

}

// ======================================================
// BOOT ENGINE
// ======================================================

async function boot() {

```
console.log(
    "[WEB4] Booting..."
);

await renderView();

await loadModule(
    "/app/Main.j"
);

console.log(
    "[WEB4] Ready"
);
```

}

boot();
