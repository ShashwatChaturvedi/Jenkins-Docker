#!/bin/bash
# Start Nginx in the background
nginx &

# Start Jenkins
exec java -jar /usr/share/jenkins/jenkins.war
