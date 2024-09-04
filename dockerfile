# Use the official Nginx image from Docker Hub
FROM nginx:alpine

# Copy the static website files to the Nginx web directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 to the outside world
EXPOSE 80
