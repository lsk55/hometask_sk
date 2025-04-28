FROM nginx:alpine

COPY helloworld.html /usr/share/nginx/html/index.html

EXPOSE 80