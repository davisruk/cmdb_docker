Example Commands
Using env file
Windows
docker run -d -v e:/java/docker/workspace/cmdb/builders/git_fetcher/target:/target_out --env-file ./env.settings davisruk/git_fetcher
Linux
docker run -d -v ~/fetch_target:/target_out --env-file ./env.settings davisruk/git_fetcher

env.settings
APP_NAME=cmdb_backend
GIT_REMOTE=https://github.com/davisruk/cmdb-model.git
GIT_BRANCH=origin/IP_Relations_Feature
GIT_REPOSITORY=cmdb-model

With no env file
docker run -d -v e:/java/docker/workspace/cmdb/builders/git_fetcher/target:/target_out -e APP_NAME=cmdb_backend -e GIT_REMOTE=https://github.com/davisruk/cmdb-model.git -e GIT_BRANCH=origin/IP_Relations_Feature -e GIT_REPOSITORY=cmdb-model davisruk/git_fetcher
