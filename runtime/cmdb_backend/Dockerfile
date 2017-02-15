FROM frolvlad/alpine-oraclejdk8:slim
VOLUME /tmp
ARG JAR_FOLDER="./target"
ARG JAR_FILE="columbus.cmdb.model-0.0.1-SNAPSHOT.jar"
ADD /$JAR_FOLDER/$JAR_FILE app.jar
RUN sh -c 'touch /app.jar'
ENV JAVA_OPTS=""
ENV APP_OPTS="--spring.datasource.url=jdbc:mysql://cmdb_db:3306/cmdbnode --cors.origin.host=cmdb_ui --cors.origin.port=3000"
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar $APP_OPTS" ]
EXPOSE 8080