const fs = require('fs');
const path = require('path');
const JSON5 = require('json5');

class ConfigLoader {
    constructor(configDir = './config') {
        this.configDir = configDir;
        this.cache = {};
    }

    load(name) {
        const file = path.join(this.configDir, `${name}.json5`);

        if (!fs.existsSync(file)) {
            throw new Error(`Missing config: ${file}`);
        }

        const raw = fs.readFileSync(file, 'utf8');

        const parsed = JSON5.parse(raw);

        this.cache[name] = parsed;

        return parsed;
    }

    reload(name) {
        delete this.cache[name];
        return this.load(name);
    }

    get(name) {
        return this.cache[name] || this.load(name);
    }
}

module.exports = ConfigLoader;
