#!/usr/bin/env bash

eval $(docker-machine env)

$(aws ecr get-login --no-include-email --region eu-central-1)

docker build -t platform/descheduler .

docker tag platform/descheduler:latest 309103291696.dkr.ecr.eu-central-1.amazonaws.com/platform/descheduler:latest
docker tag platform/descheduler:latest 309103291696.dkr.ecr.eu-central-1.amazonaws.com/platform/descheduler:$(git describe --tags)

docker push 309103291696.dkr.ecr.eu-central-1.amazonaws.com/platform/descheduler:latest
docker push 309103291696.dkr.ecr.eu-central-1.amazonaws.com/platform/descheduler:$(git describe --tags)