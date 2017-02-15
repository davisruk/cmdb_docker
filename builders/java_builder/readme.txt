Instructions for manual building:

See docker hub entry

Running:

On Windows
docker run -d --rm -v //e/java/target:/jar_target -e GIT_BRANCH=origin/IP_Relations_Feature davisruk/java_builder

On Linux
docker run -d --rm -v /java/target:/jar_target -e GIT_BRANCH=origin/IP_Relations_Feature davisruk/java_builder

Use the output to create your runtime image eg.
On Windows
cd e:/java
docker build --build-arg JAR_FOLDER=./target -t davisruk/cmdb_backend .

On Linux
docker build --build-arg JAR_FOLDER=/jar/target -t davisruk/cmdb_backend .

*** Note ***
On windows you must cd and use the ./ notation. For some reason absolute build args do not work,
lstat returns not found even for the correct path.