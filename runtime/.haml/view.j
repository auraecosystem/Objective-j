async function loadView(path) {

```
const response =
    await fetch(path);

const source =
    await response.text();

return compileHaml(source);
```

}
