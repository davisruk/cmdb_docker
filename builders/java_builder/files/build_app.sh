if [ -d ${APP_NAME} ]; then
  rm -R -f ${APP_NAME}
fi

mkdir ${APP_NAME}
cd ${APP_NAME}
git clone ${GIT_REMOTE}
cd ${GIT_REPOSITORY}
if [[ -n "${GIT_BRANCH}" ]]; then
  git fetch
  git checkout -t ${GIT_BRANCH}
fi
git pull
cd ./${BUILD_ROOT}
mvn package -Dmaven.test.skip=true
mv target/*.jar /jar_target


