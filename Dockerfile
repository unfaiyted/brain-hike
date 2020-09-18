# build environment
FROM node:14.7.0-alpine as build
WORKDIR /brain-hike
ENV PATH /brain-hike/node_modules/.bin:$PATH
COPY package.json ./
COPY package-lock.json ./
RUN npm ci
RUN npm install react-scripts@3.4.1 -g
COPY . ./
RUN npm run build

EXPOSE 8989
CMD ["node", "./server.js"]

