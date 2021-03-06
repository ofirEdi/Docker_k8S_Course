#base image
FROM node:10.16.0-alpine as builder

#copy files

WORKDIR /app
COPY ./ReactFirstExcercise/frontend/package*.json ./
#install dependencies
RUN npm install
COPY ./ReactFirstExcercise/frontend/ ./


RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
