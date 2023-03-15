#!/bin/bash
docker-compose -f docker-compose.yml --env-file ../../.env up -d

# docker exec -it wireguard bash
