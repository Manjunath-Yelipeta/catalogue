FROM node:20.20.2-alpine3.23
# creates /app and set the directory to /app
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
RUN apk update && apk upgrade --no-cache && \
addgroup -S roboshop && adduser -S -G roboshop roboshop && \
chown -R roboshop:roboshop /app
USER roboshop
CMD ["node", "server.js"]
