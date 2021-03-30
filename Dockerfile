FROM node:7
ADD ./app/app.js /app.js
ENTRYPOINT ["node", "app.js"]
