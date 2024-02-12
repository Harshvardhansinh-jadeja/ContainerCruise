# FROM node:21-alpine

# WORKDIR /app

# COPY . .

# RUN npm install

# RUN npm run build

# EXPOSE 3000

# CMD [ "npm", "start" ]

FROM node:21 as build

WORKDIR /app

COPY . .

RUN npm install

RUN npm run build

FROM node:21-alpine as main

COPY --from=build /app /

EXPOSE 3000

CMD ["npm","start"]