# Use Ubuntu Server as the base image
FROM ubuntu:latest

# Update packages and install Nginx
RUN apt-get update && \
    apt-get install -y nginx certbot python3-certbot-nginx && \
    rm -rf /var/lib/apt/lists/*

# Remove the default Nginx configuration file
RUN rm /etc/nginx/sites-enabled/default

# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/conf.d/

# Copy all HTML files from the host to the container
COPY html/ /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80
EXPOSE 443

# Start Nginx when the container is launched
CMD ["nginx", "-g", "daemon off;"]
