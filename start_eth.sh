#!/usr/bin/env bash

./substreams-sink-mongodb/devel/substreams-sink-mongodb run \
mongodb://root:root@localhost:27017 \
  ETH_DB \
  ./schema.json \
  "mainnet.eth.streamingfast.io:443" \
  ./substreams.spkg \
  db_out_eth \
  100:110