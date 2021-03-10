FROM node:12-stretch

RUN useradd -ms /bin/bash wolfey

WORKDIR /user/wolfey/src

COPY --chown=node:node index.js .

CMD ["node", "index.js"]
