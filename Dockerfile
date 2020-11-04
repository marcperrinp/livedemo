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
    --token ${FOREST_TOKEN} && \
  cd $APP_NAME && \
  npm install -s


CMD docker-compose up