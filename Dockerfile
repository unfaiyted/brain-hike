FROM node:14.7.0-alpine as build

WORKDIR /brain-hike

COPY package*.json /app/

RUN npm install

COPY ./ /brain-hike/

RUN npm run build

FROM nginx:1.15.8-alpine

COPY --from=build /brain-hike/build /usr/share/nginx/html
COPY --from=build /brain-hike/nginx/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
