# Latest LTS
FROM node:12.18.3-alpine
WORKDIR /usr/src/app
# Install app dependencies
COPY package*.json ./
RUN npm install --only=prod
# Copy app source code
COPY . .
ENTRYPOINT [ "npm", "start" ]
