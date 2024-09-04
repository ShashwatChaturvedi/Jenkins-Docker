# Use the official Jenkins LTS image as the base image
FROM jenkins/jenkins:lts

# Switch to root to install additional packages
USER root

# Install Docker and Nginx
RUN apt-get update && \
    apt-get install -y docker.io nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set up Jenkins environment
USER jenkins

# Install Jenkins plugins or any additional configurations if necessary
# (This example assumes the base Jenkins image already has necessary plugins)
# Example:
# RUN jenkins-plugin-cli --install <plugin-id>

# Configure Nginx
# Copy the Nginx configuration file if you have a custom configuration
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy static website files to the Nginx directory
# Replace 'index.html' with your actual static content files
COPY html /usr/share/nginx/html

# Expose ports for Jenkins and Nginx
EXPOSE 8080 50000 80

# Set up the entry point to start both Jenkins and Nginx
# This example uses a simple shell script to start both services
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["start.sh"]
