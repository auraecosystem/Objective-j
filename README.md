![Objective-J logo](assets/logo.svg)

[![Languages](badges/languages.svg)](https://github.com/auraecosystem/Objective-j/blob/main/languages.json)

# Objective-J

Welcome to the Objective-J repository by Aura Ecosystem.

## About

This repository contains Objective-J resources and code. Objective-J is an object-oriented language that compiles to JavaScript, allowing developers to write sophisticated web applications with a syntax similar to Objective-C. It brings powerful OOP capabilities to web development while leveraging the ubiquity of JavaScript.

## Language Composition

This repository's language composition (approximate):

- Objective-J: 77.7%
- Objective-C++-like: 5%
- JavaScript: 9.4%
- Pascal: 6.9%
- Other: 1%

Machine-readable data: `languages.json` at the repository root: https://github.com/auraecosystem/Objective-j/blob/main/languages.json

## About "Objective-C++-like"

`Objective-C++-like` refers to code and patterns that combine Objective-C–style messaging and object model with C++-style types, idioms, or lower-level constructs adapted for the Objective-J ecosystem. In this repository the label indicates code that:
- Mixes message-based APIs with lower-level or templated C++-style constructs (for example, when interfacing with performance-critical modules or ported native code).
- Uses performance-oriented or static-like patterns while preserving Objective-J messaging syntax.
- May require glue or shims to interoperate smoothly with plain Objective-J and JavaScript modules.

Practical implications

- Interoperability: Modules labeled Objective-C++-like often need explicit wrapper layers or conversion utilities to interact with other parts of the codebase.
- Tooling: These modules may require special handling in tooling (extra parsing, different lint rules, or separate compilation steps).
- Documentation and examples: Provide small examples showing both the source form and the compiled/shimmed JS form, plus tests covering interoperability edges.
- When to use: Prefer plain Objective-J for new high-level features. Use Objective-C++-like patterns when performance or existing API compatibility justifies the added complexity.

Example (pseudo-code, illustrative)

```Objective‑C++‑like```
```.mm
// Pseudo Objective‑C++‑like source
@implementation FastVector : CPObject
{
    CppVector<int> _buf; // conceptual backing buffer
}

- (void)push:(int)value
{
    _buf.push_back(value); // low-level operation handled by backing engine
}

- (CPNumber)sum
{
    return _buf.reduce((acc, v) => acc + v, 0);
}
@end
```

# Recommendations

- Document these modules under `docs/` and add examples under `examples/` showing source + compiled/shim output.
- Add focused tests for boundaries (serialization, API contracts, memory/ownership if relevant).

## Features

- **Object-Oriented Programming**: Full OOP support with classes, inheritance, and protocols
- **Objective-C-like Syntax**: Familiar syntax for developers experienced with Objective-C
- **JavaScript Compilation**: Compiles directly to clean, efficient JavaScript
- **Cross-Platform**: Runs anywhere JavaScript runs
- **Framework Support**: Compatible with modern web frameworks and libraries
- **Type Safety**: Optional static typing for better code reliability

## Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn package manager
- Basic knowledge of JavaScript and web development

### Installation

To get started with this project, clone the repository and explore the available resources:

```bash
git clone https://github.com/auraecosystem/Objective-j.git
cd Objective-j
npm install
```

## Try the example

We included a small runnable "Hello World" example that compiles a constrained Objective-J-like source file to JavaScript using the included toy compiler.

Build and run the example:

```bash
npm run build
# then open examples/hello/index.html in a browser
```

## Usage

```sj
// Example Objective-J code
@implementation MyClass : CPObject
{
    CPString name;
}

- (void)setName:(CPString)aName
{
    name = aName;
}

- (CPString)name
{
    return name;
}

@end
```

## Project Structure

```bash
Objective-j/
├── assets/           # Images and static assets
├── scripts/          # Tooling (toy compiler)
├── src/              # Source code
├── examples/         # Example projects (includes Hello example)
├── docs/             # Documentation
├── tools/            # Utility scripts
├── badges/           # Generated badges
├── .github/          # GitHub workflows
└── README.md         # This file
```

## Development

### Building the examples

```bash
npm run build
```

### Development server (manual)

You can serve the repository with a simple static server, for example using Python:

```bash
python -m http.server 8000
# then open https://localhost:8000/examples/hello/index.html
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing.

## Code of Conduct

Please follow the guidelines in [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

## License

For license information, please refer to the LICENSE file in the repository if present.

## Support

If you have any questions or need help:

- **Issues**: Open an [issue](https://github.com/auraecosystem/Objective-j/issues) on GitHub
- **Discussions**: Join our [discussions](https://github.com/auraecosystem/Objective-j/discussions)
- **Documentation**: Check the [project homepage](https://auraecosystem.github.io/Objective-j/)

---

**Happy coding with Objective-J! 🚀**
