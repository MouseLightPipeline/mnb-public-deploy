#!/usr/bin/env bash

docker run -it --rm --network ne_back_tier -e NODE_ENV=production mouselightdatabrowser/data /apps/seed.sh
