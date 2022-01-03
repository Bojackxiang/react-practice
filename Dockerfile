FROM node:14.14.0-alpine
WORKDIR '/app'
COPY package.json .
RUN npm install

COPY ./build/ ./build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html