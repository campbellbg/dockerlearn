FROM node:alpine as thebuilder

WORKDIR '/myapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY --from=thebuilder /myapp/build /usr/share/nginx/html