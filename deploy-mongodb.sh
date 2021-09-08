#!/usr/bin/env sh

docker stop bella-mongod

yes | docker system prune

docker run \
  --name bella-mongodb \
  --network bella \
  --ip 172.20.0.10 \
  --hostname bella_mongodb \
  --restart unless-stopped \
  -p 6379:6379 \
  -d mongo

yes | docker system prune
