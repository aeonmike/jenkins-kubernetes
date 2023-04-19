# Use Ubuntu Server as the base image
FROM ubuntu:latest

# Update the package list and install Nginx
RUN apt update -y
RUN apt install nginx -y

# Remove the default Nginx configuration file

RUN rm /etc/nginx/sites-enabled/default

# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/conf.d/

# Copy all HTML files from the host to the container
COPY html/ /var/www/html/

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx when the container is launched
CMD ["nginx", "-g", "daemon off;"]
