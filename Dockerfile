FROM node:13.7.0-alpine

ARG JS_YAML_VERSION
ENV JS_YAML_VERSION_ENV=${JS_YAML_VERSION}

RUN npm install js-yaml@${JS_YAML_VERSION_ENV}

COPY format-yaml.js /format-yaml.js

ENTRYPOINT ["node", "format-yaml.js"]
