#!/usr/bin/env bash

./substreams-sink-mongodb/devel/substreams-sink-mongodb run \
mongodb://root:root@localhost:27017 \
  SOL_DB \
  ./schema.json \
  "mainnet.sol.streamingfast.io:443"  \
  ./substreams.spkg \
  db_out_sol \
  179432144:179432145