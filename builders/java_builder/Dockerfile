FROM openjdk:8-alpine
VOLUME /tmp
ENV MAVEN_VERSION="3.3.9" \
    M2_HOME=/usr/lib/mvn

# Application Build Arguments
# ARG will setup defaults for any container built from the image
ARG APP_NAME=cmdb_backend
ARG APP_VERSION=0.0.1
ARG GIT_REMOTE=https://github.com/davisruk/cmdb-model.git
ARG GIT_BRANCH=origin/master
ARG GIT_REPOSITORY=cmdb-model
ARG BUILD_ROOT=cmdb

# ENV parameters available to the container at runtime
ENV APP_NAME ${APP_NAME}
ENV APP_VERSION ${APP_VERSION}
ENV GIT_REMOTE ${GIT_REMOTE}
ENV GIT_REPOSITORY ${GIT_REPOSITORY}
ENV GIT_BRANCH ${GIT_BRANCH}
ENV BUILD_ROOT ${BUILD_ROOT}

# Install Maven
RUN apk add --update wget && \
  cd /tmp && \
  wget "http://apache.mirror.anlx.net/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz" && \
  tar -zxvf "apache-maven-3.3.9-bin.tar.gz" && \
  mv "apache-maven-$MAVEN_VERSION" "$M2_HOME" && \
  ln -s "$M2_HOME/bin/mvn" /usr/bin/mvn && \
  apk del wget && \
  rm /tmp/* /var/cache/apk/*

# Install git
RUN apk update && \
	apk add 'git<2.11.0'

WORKDIR /usr/app
ADD ./files/build_app.sh /usr/app
RUN chmod 764 ./build_app.sh
CMD ["/bin/sh","./build_app.sh"]
