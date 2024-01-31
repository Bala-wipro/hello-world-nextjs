FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
COPY ./pages/index*.js ./
COPY ./pages/_app*.js ./

RUN ls -la /usr/src/app/

RUN npm install

COPY . .

EXPOSE 3000

CMD ["node", "_app.js"]
