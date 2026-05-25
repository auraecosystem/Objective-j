// ========================================
// MAIN APPLICATION
// ========================================

createClass("AppController", {

```
start() {

    console.log(
        "WEB4 Started"
    );
}
```

});

const app =
new WEB4.classes.AppController();

[app start]

const shader = new ShaderView({

```
fragment: `

    precision mediump float;

    void main() {

        vec2 uv =
            gl_FragCoord.xy /
            vec2(800.0, 600.0);

        gl_FragColor =
            vec4(
                uv.x,
                uv.y,
                1.0,
                1.0
            );
    }
`
```

});

[shader render]
