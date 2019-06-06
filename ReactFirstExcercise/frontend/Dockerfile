#base image
FROM node:10.16.0-alpine as builder

#copy files

WORKDIR /app
COPY ./package.json .
#install dependencies
RUN npm install
COPY . .

EXPOSE 3000

RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
