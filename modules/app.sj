// =======================================
// PERSON CLASS
// =======================================

createClass("Person", {

```
init(name) {

    this.name = name;
},

speak() {

    console.log(
        `Hello ${this.name}`
    );
}
```

});

// =======================================
// APP START
// =======================================

const Person =
Runtime.getClass("Person");

const user =
new Person("KUBU LEE");

msgSend(user, "speak");

// =======================================
// UI COMPONENT
// =======================================

const App = createComponent(

```
"#app",

(state) => {

    return `
        <h1>WEB4 Runtime</h1>
        <p>User: ${state.user}</p>
    `;
}
```

);

App.update({
user: "KUBU LEE"
});
