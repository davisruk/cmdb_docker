FROM alpine:latest

# Application Build Arguments
# ARG will setup defaults for any container built from the image
ARG APP_NAME=cmdb_ui
ARG GIT_REMOTE=https://github.com/davisruk/cmdb-front-end.git
ARG GIT_BRANCH=origin/master
# The root folder that the clone command creates
ARG GIT_REPOSITORY=cmdb-front-end

# ENV parameters available to the container at runtime
ENV APP_NAME ${APP_NAME}
ENV APP_VERSION ${APP_VERSION}
ENV GIT_REMOTE ${GIT_REMOTE}
ENV GIT_REPOSITORY ${GIT_REPOSITORY}
ENV GIT_BRANCH ${GIT_BRANCH}

# Install git
RUN apk update
RUN apk add git

WORKDIR /usr/app
ADD ./files/fetch_app.sh /usr/app
RUN chmod 764 ./fetch_app.sh
RUN chmod 764 ./fetch_app.sh && \
	tr -d '\r' < fetch_app.sh > fetch_app_lnx.sh && \
	chmod 764 ./fetch_app_lnx.sh && \
	rm ./fetch_app.sh && \
	mv ./fetch_app_lnx.sh ./fetch_app.sh
CMD ["/bin/sh","./fetch_app.sh"]
