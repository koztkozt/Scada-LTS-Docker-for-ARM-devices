# Ref: https://github.com/SCADA-LTS/Scada-LTS/blob/develop/Dockerfile
# Create an Scada-LTS.war file and deploy it into Docker Tomcat Image.
FROM tomcat:9.0.53
ADD https://github.com/SCADA-LTS/Scada-LTS/raw/develop/WebContent/WEB-INF/lib/mysql-connector-java-5.1.49.jar /usr/local/tomcat/lib/mysql-connector-java-5.1.49.jar
ADD https://github.com/SCADA-LTS/Scada-LTS/raw/develop/tomcat/lib/activation.jar /usr/local/tomcat/lib/activation.jar
ADD https://github.com/SCADA-LTS/Scada-LTS/raw/develop/tomcat/lib/jaxb-api-2.4.0-b180830.0359.jar /usr/local/tomcat/lib/jaxb-api-2.4.0-b180830.0359.jar
ADD https://github.com/SCADA-LTS/Scada-LTS/raw/develop/tomcat/lib/jaxb-core-3.0.2.jar /usr/local/tomcat/lib/jaxb-core-3.0.2.jar
ADD https://github.com/SCADA-LTS/Scada-LTS/raw/develop/tomcat/lib/jaxb-runtime-2.4.0-b180830.0438.jar /usr/local/tomcat/lib/jaxb-runtime-2.4.0-b180830.0438.jar
ADD https://raw.githubusercontent.com/SCADA-LTS/Scada-LTS/develop/docker/config/context.xml /usr/local/tomcat/conf/context.xml
ADD https://github.com/SCADA-LTS/Scada-LTS/releases/download/v2.6.15/ScadaBR.war /usr/local/tomcat/webapps/

# Add the wait script to the image
ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /wait/
RUN chmod +x /wait/wait-for-it.sh

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
