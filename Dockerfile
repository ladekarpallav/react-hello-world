FROM node:14.17.0 as build
WORKDIR  /app
COPY package*.json ./
RUN npm install
COPY . .
RUN yarn build
FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
