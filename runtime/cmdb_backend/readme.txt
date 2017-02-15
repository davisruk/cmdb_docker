Instructions for manual building:

To be used in conjunction with Java Builder image. That image creates a runtime jar file that is
baked into the image created by this Dockerfile.

Building:

On Windows
cd e:/java
docker build --build-arg JAR_FOLDER=./target -t davisruk/cmdb_backend .

On Linux
docker build --build-arg JAR_FOLDER=/jar/target -t davisruk/cmdb_backend .

*** Note ***
On windows you must cd and use the ./ notation. For some reason absolute build args do not work,
lstat returns not found even for the correct path.

Running on default bridge network:

docker run -d --name cmdb_backend -h cmdb_backend --link <database_container_hostname> -p 8080:8080 davisruk/cmdb_backend

Running on docker network:

The docker network should already exist and the db should be running.
This is not actually necessary but easier.
We don't need a hostname or link options.

docker run -d --name cmdb_backend -p 8080:8080 davisruk/cmdb_backend


