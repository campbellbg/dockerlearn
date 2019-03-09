FROM node:11.10.1 as thebuilder

WORKDIR '/myapp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
EXPOSE 80
COPY --from=thebuilder /myapp/build /usr/share/nginx/html