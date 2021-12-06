
## build stage
FROM node:14.17.1-alpine AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npx prisma generate
RUN npm run build


## main stage
FROM node:lts-alpine
WORKDIR /app
COPY --from=builder /app ./
CMD ["npm", "run", "start:prod"]