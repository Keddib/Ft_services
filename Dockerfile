FROM node:7
EXPOSE 8080
ADD ./app/app.js /app.js
ENTRYPOINT ["node", "app.js"]
