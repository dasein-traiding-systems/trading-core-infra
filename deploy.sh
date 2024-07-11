#!/bin/sh
#TARGET_DIR="trading-core-infra"
TARGET_DIR=$1
GIT_BASE_PATH="git@gitlab.com:dasein-trading-core"
FULL_GIT_PATH="$GIT_BASE_PATH/$TARGET_DIR.git"

[ ! -d "$TARGET_DIR" ] && git clone "$GIT_PATH/$TARGET_DIR.git"
cd $TARGET_DIR && git pull
rm -f .env
echo "MONGO_INITDB_ROOT_PASSWORD=$MONGO_INITDB_ROOT_PASSWORD" >> .env
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> .env
echo "PORTAINER_PASSWORD=$PORTAINER_PASSWORD" >> .env
docker-compose build
docker-compose down
docker-compose up -d

#if [ -d "$TARGET_DIR" ]; then
#    echo "Project $TARGET_DIR FOUND(pull)"
#    cd $TARGET_DIR
#    git pull
#else
#  echo "Project $TARGET_DIR NOT FOUND(clone)"
#  git clone "$FULL_GIT_PATH"
#  cd $TARGET_DIR
#fi

#rm -f .env
#echo "MONGO_INITDB_ROOT_PASSWORD=$MONGO_INITDB_ROOT_PASSWORD" >> .env
#echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD" >> .env
#echo "PORTAINER_PASSWORD=$PORTAINER_PASSWORD" >> .env
