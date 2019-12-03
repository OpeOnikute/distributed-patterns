FROM node:10-alpine

WORKDIR /var/www/paas

COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

WORKDIR /var/www/paas/app

CMD [ "npm", "start" ]