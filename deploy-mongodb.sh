#!/usr/bin/env sh

docker stop bella-mongodb

yes | docker system prune

# docker network create \
#   --driver=bridge \
#   --subnet=172.20.0.0/16 \
#   --ip-range=172.20.0.0/16 \
#   --gateway=172.20.0.1\
#   bella

docker run \
  --name bella-mongodb \
  --network bella \
  --ip 172.20.0.10 \
  --hostname bella_mongodb \
  --restart unless-stopped \
   -v $PWD/mongodb/:/data/db:rw \
  -p 27017:27017 \
  -d mongo

yes | docker system prune
