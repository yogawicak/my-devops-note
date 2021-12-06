# build stage
FROM node:lts-alpine as build-stage
WORKDIR /app

## embed env in build stage
ENV VUE_APP_BASE_API_STORAGE=https://api.sample.com/api/storage
ENV VUE_APP_NODE_ENV=PROD

COPY package*.json ./
# run add cache
RUN apk add --update --no-cache python3 make g++
RUN npm install --force
COPY . .
RUN npm run build

# production stage
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

