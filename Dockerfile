# Use an official Tomcat image as a base image
FROM tomcat:9.0.14-jre8-alpine
#Metadata
LABEL maintainer="github.com/andyhao-123"
# Remove default Tomcat application
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*
# Copy your web application to the Tomcat webapps directory
COPY webapp/ /usr/local/tomcat/webapps/ROOT/
# 强制做个软连接把默认的shell /bin/sh改为指向bash, change the default shell to Bash
RUN ln -sf /bin/bash /bin/sh
# Expose the default port
EXPOSE 8080
# Start tomcat when the container starts
CMD ["catalina.sh","run"]
