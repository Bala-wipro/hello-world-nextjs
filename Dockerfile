FROM node:16

WORKDIR /usr/src/app

COPY package*.json ./
COPY ./pages/index*.js ./
COPY ./pages/_app*.js ./

RUN ls -la /usr/src/app/

COPY . .
RUN npm install

EXPOSE 3000

CMD ["npm", "run", "dev"]
