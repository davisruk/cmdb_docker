if [ -d /target_out/${GIT_REPOSITORY} ]; then
  rm -R -f /target_out/${GIT_REPOSITORY}
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
rm -rf .git
cd ../
cp -r ${GIT_REPOSITORY} /target_out


