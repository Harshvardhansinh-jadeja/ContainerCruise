# FROM node:21-alpine

# WORKDIR /app

# COPY . .

# ENV AUTH_SECRET=E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU=

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD [ "npm", "start" ]

FROM node:21 as build

WORKDIR /app

COPY . .

RUN npm install

RUN npx prisma generate

RUN npm run build

FROM node:21-alpine as main

COPY --from=build /app /

EXPOSE 3000

ENV AUTH_SECRET=E5rLUtvhWmt00MoXqnX9kgS9Ak8gc7Z88keYaW8mhbU=

RUN apk add --no-cache bash

# CMD ["npm","start"]
COPY entrypoint.sh .
CMD ["bash" , "./entrypoint.sh"]
