FROM node:alpine
# Application Build Arguments
# ARG will setup defaults for any container built from the image
ARG EXT_HOSTNAME=localhost
ARG UI_EXT_PORT=3000
ARG SVC_EXT_PORT=8080

# ENV parameters available to the container at runtime
ENV EXT_HOSTNAME ${EXT_HOSTNAME}
ENV UI_EXT_PORT ${UI_EXT_PORT}
ENV SVC_EXT_PORT ${SVC_EXT_PORT}

RUN mkdir -p /usr/src/cmdb-front-end

WORKDIR /usr/src/cmdb-front-end

COPY ./target/cmdb-front-end /usr/src/cmdb-front-end

RUN npm install typings --global && \
	typings install && \
	npm install

EXPOSE 3000

COPY ./files/entrypoint.sh /usr/src/cmdb-front-end

RUN chmod 764 ./entrypoint.sh && \
	tr -d '\r' < entrypoint.sh > entrypoint_lnx.sh && \
	chmod 764 ./entrypoint_lnx.sh && \
	rm ./entrypoint.sh && \
	mv ./entrypoint_lnx.sh ./entrypoint.sh

CMD ["/bin/sh","./entrypoint.sh"]


