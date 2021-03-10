FROM node:12-stretch

USER node

COPY --chown=node:node . .

RUN npm ci



CMD ["node", "index.js"]
