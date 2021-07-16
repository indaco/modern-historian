FROM node:14-alpine3.14

# install openssl
RUN apk update
RUN apk add --no-cache openssl
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/apk/*

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install

# Bundle app source
COPY . .

EXPOSE 4334
CMD [ "node", "server.js" ]