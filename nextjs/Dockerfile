FROM node:current-alpine AS base

ARG API_URL
ENV NEXT_PUBLIC_API_URL=${API_URL}

RUN apk add g++ make python
WORKDIR /app
COPY package*.json ./
RUN echo "ini url ${API_URL}"
RUN npm install
COPY . .
RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "start" ]
