FROM nginx

LABEL maintainer="mike.cabalin@gmail.com"

RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY html /usr/share/nginx/html

COPY nginx.conf /etc/nginx/
COPY server.conf /etc/nginx/conf.d/

VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
