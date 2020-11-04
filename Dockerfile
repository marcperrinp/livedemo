FROM node:lts-jessie

WORKDIR /usr/src/app
RUN npm install -g lumber-cli -s

VOLUME /usr/src/app

EXPOSE $APPLICATION_PORT
RUN lumber generate $APP_NAME \
    -c $DATABASE_URL \
    -S $DATABASE_SSL \
    -s $DATABASE_SCHEMA \
    -H $APPLICATION_HOST \
    -p $APPLICATION_PORT \
    --email $FOREST_EMAIL \
    --token "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJkYXRhIjp7ImRhdGEiOnsidHlwZSI6InVzZXJzIiwiaWQiOiIxOTc4MCIsImF0dHJpYnV0ZXMiOnsiZmlyc3RfbmFtZSI6Ik1hcmMiLCJsYXN0X25hbWUiOiJQZXJyaW4tUGVsbGV0aWVyIiwiZW1haWwiOiJtYXJjcEBmb3Jlc3RhZG1pbi5jb20ifX19LCJpYXQiOjE2MDQzMjMyMzQsImV4cCI6MTYwNDQ5NjAzNCwiYXVkIjoiRk9SRVNUX1VTRVJTIiwiaXNzIjoiRk9SRVNUX0FVVEhFTlRJQ0FUSU9OX1NZU1RFTSJ9.58AdLyIUe9YQQK3_cmsQMQ9iTPZ3oBMHfqF-AlYviWA" && \
  cd $APP_NAME && \
  npm install -s


CMD docker-compose up