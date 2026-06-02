// =====================================================
// lmlm MODULE SYSTEM
// =====================================================

WEB4-ai = {

```
prompts: {},
agents: {}
```

};

// =====================================================
// LOAD AI MODULE
// =====================================================

async function loadPromptModule(path) {

```
const response =
    await fetch(path);

const source =
    await response.text();

parsePromptModule(
    source
);
```

}

// =====================================================
// RDF-LIKE PARSER
// =====================================================

function parsePromptModule(source) {

```
const lines =
    source.split("\n");

const module = {};

for (const line of lines) {

    const parts =
        line.split(":");

    if (parts.length < 2)
        continue;

    const key =
        parts[0].trim();

    const value =
        parts
        .slice(1)
        .join(":")
        .trim();

    module[key] = value;
}

WEB4.ai.prompts[
    module.name
] = module;

console.log(
    "[AI] Prompt Loaded:",
    module.name
);
```

}
