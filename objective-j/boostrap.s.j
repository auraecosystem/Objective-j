// =====================================================
// WEB4 ENGINE v0.2
// Objective-J + GLSL + GPU Runtime
// =====================================================

// =====================================================
// GLOBAL ENGINE
// =====================================================

const WEB4 = {

```
classes: {},
shaders: {},
modules: {},
renderer: null,

registerClass(name, cls) {

    this.classes[name] = cls;
},

getClass(name) {

    return this.classes[name];
}
```

};

// =====================================================
// MESSAGE DISPATCH
// =====================================================

function msgSend(receiver, selector, ...args) {

```
const method =
    receiver[selector];

if (!method) {

    throw new Error(
        `Selector ${selector} missing`
    );
}

return method.apply(
    receiver,
    args
);
```

}

// =====================================================
// OBJECTIVE-J COMPILER
// =====================================================

function compileObjectiveJ(source) {

```
// [obj method]
// ->
// msgSend(obj,"method")

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

// =====================================================
// MODULE LOADER
// =====================================================

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

WEB4.modules[path] = true;

console.log(
    `[WEB4] Loaded ${path}`
);
```

}

// =====================================================
// EXECUTOR
// =====================================================

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

// =====================================================
// CLASS FACTORY
// =====================================================

function createClass(name, methods) {

```
class RuntimeClass {

    constructor(...args) {

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

WEB4.registerClass(
    name,
    RuntimeClass
);

return RuntimeClass;
```

}

// =====================================================
// WEBGL RENDERER
// =====================================================

class Renderer {

```
constructor(canvas) {

    this.gl =
        canvas.getContext("webgl");

    if (!this.gl) {

        throw new Error(
            "WebGL unsupported"
        );
    }
}
```

}

// =====================================================
// SHADER VIEW
// =====================================================

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

    this.program = null;
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

    if (
        !gl.getShaderParameter(
            shader,
            gl.COMPILE_STATUS
        )
    ) {

        console.error(
            gl.getShaderInfoLog(shader)
        );
    }

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

    this.program = program;

    const vertices = new Float32Array([

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

        this.canvas.width = window.innerWidth,

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

// =====================================================
// ENGINE BOOT
// =====================================================

async function boot() {

```
console.log(
    "[WEB4] Booting..."
);

await loadModule(
    "/app/Main.j"
);

console.log(
    "[WEB4] Ready"
);
```

}

boot();

