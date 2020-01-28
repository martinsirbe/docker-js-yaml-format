yaml = require('js-yaml');
fs   = require('fs');

try {
    console.log("failed", yaml.safeDump(yaml.safeLoad(fs.readFileSync(process.argv[2], 'utf8'))));
} catch (e) {
    console.error("failed to safe dump YAML", e);
}