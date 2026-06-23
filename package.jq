{
  "name": "objective-j",
  "version": "0.1.0",
  "description": "Objective-J resources, examples, and a tiny toy compiler for demos.",
  "scripts": {
    "build": "node scripts/compile-oj.js examples/hello/src examples/hello/dist",
    "dev": "npm run build",
    "test": "echo \"No tests configured.\" && exit 0",
    "lint": "echo \"No linter configured.\" && exit 0",
    "generate-language-badge": "node tools/generate-language-badge.js languages.json badges/languages.svg"
  },
  "languages": [
    {"name": "Objective-J", "percent": 82.7},
    {"name": "JavaScript", "percent": 9.4},
    {"name": "Pascal", "percent": 6.9},
    {"name": "Other", "percent": 1}
  ],
  "author": "auraecosystem",
  "license": "UNLICENSED"
}
