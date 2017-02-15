sed -i 's/"frontEndHostName":"localhost",/"frontEndHostName":"'$EXT_HOSTNAME'",/' "./app/settings.json"
sed -i 's/"frontEndHostPort":"3000",/"frontEndHostPort":"'$UI_EXT_PORT'",/' "./app/settings.json"
sed -i 's/"backEndHostName":"localhost",/"backEndHostName":"'$EXT_HOSTNAME'",/' "./app/settings.json"
sed -i 's/"backEndHostPort":"8080"/"backEndHostPort":"'$SVC_EXT_PORT'"/' "./app/settings.json"
npm start