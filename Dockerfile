FROM node:13.7.0-alpine

ARG VERSION

RUN npm install js-yaml@$VERSION

COPY format-yaml.js /format-yaml.js

ENTRYPOINT ["node", "format-yaml.js"]
