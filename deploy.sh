#!/bin/bash
docker login -u nareshk321 -p Naresh1900K@
docker build -t mydeployment .

if [ $GIT_BRANCH = "dev" ]; then

    docker tag mydeployment nareshk321/dev
    docker push nareshk321/dev
elif [ $GIT_BRANCH = "main" ]; then

    docker tag mydeployment nareshk321/prod
    docker push nareshk321/prod
fi
