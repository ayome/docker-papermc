#!/bin/bash

mkdir -p data
# shellcheck disable=SC2164
cd data

JAR_NAME=papermc-${VERSION}-${BUILD}

if [ ! -e "${JAR_NAME}".jar ] || [ "${BUILD}" = latest ]
  then
    wget https://papermc.io/api/v1/paper/"${VERSION}"/"${BUILD}"/download -O "${JAR_NAME}".jar
    if [ ! -e eula.txt ]
    then
      java -jar "${JAR_NAME}".jar
      sed -i 's/false/true/g' eula.txt
    fi
fi

java -server -jar "${JAR_NAME}".jar nogui
