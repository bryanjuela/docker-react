FROM node:alpine as builder
WORKID '/app'
COPY package.json
RUN npm install
COPY . .
RUN npm run builder

FROM nginx
EXPOSE 8080
COPY --from=builder /app/build /usr/share/nginx/html