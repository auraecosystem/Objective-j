![Objective-J logo](assets/logo.svg)

# Objective-J

Welcome to the Objective-J repository by Aura Ecosystem.

## About

This repository contains Objective-J resources and code. Objective-J is an object-oriented language that compiles to JavaScript, allowing developers to write sophisticated web applications with a syntax similar to Objective-C. It brings powerful OOP capabilities to web development while leveraging the ubiquity of JavaScript.

## Language Composition

This repository's language composition (approximate):

- Objective-J: 82.7%
- JavaScript: 9.4%
- Pascal: 6.9%
- Other: 1%

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

We included a small runnable "Hello World" example that mimics compiled Objective-J output. Open the example in your browser:

- `examples/hello/index.html` — double-click to open or serve from a local server
- `examples/hello/README.md` — instructions and info about the demo

## Usage

```javascript
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

```
Objective-j/
├── assets/           # Images and static assets
├── src/              # Source code
├── examples/         # Example projects (includes Hello example)
├── docs/             # Documentation
├── tests/            # Test suite
└── README.md         # This file
```

## Documentation

For comprehensive documentation, visit the [project homepage](https://auraecosystem.github.io/Objective-j/).

Additional resources:
- [Language Guide](https://auraecosystem.github.io/Objective-j/docs/guide)
- [API Reference](https://auraecosystem.github.io/Objective-j/docs/api)
- [Examples & Tutorials](https://auraecosystem.github.io/Objective-j/examples)

## Testing

Run the test suite:

```bash
npm test
```

## Development

### Building

```bash
npm run build
```

### Development Server

```bash
npm run dev
```

### Linting

```bash
npm run lint
```

## Roadmap

- [ ] Enhanced language features
- [ ] Performance optimizations
- [ ] Extended documentation
- [ ] Community examples
- [ ] Debugging tools

## License

For license information, please refer to the LICENSE file in the repository.

## Support

If you have any questions or need help:

- **Issues**: Open an [issue](https://github.com/auraecosystem/Objective-j/issues) on GitHub
- **Discussions**: Join our [discussions](https://github.com/auraecosystem/Objective-j/discussions)
- **Documentation**: Check the [project homepage](https://auraecosystem.github.io/Objective-j/)

---

**Happy coding with Objective-J! 🚀**
