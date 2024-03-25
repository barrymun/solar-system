FROM oven/bun:1 as base

RUN mkdir -p /usr/src/client
WORKDIR /usr/src/client
COPY . /usr/src/client/

RUN bun install

RUN bun run build

# use Nginx as the production server
FROM nginx:alpine
# copy the custom Nginx configuration file to the container
COPY client/nginx/nginx.conf /etc/nginx/conf.d/default.conf
# copy the built React app to Nginx's web server directory
COPY --from=node /usr/src/client/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
