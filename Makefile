ENDPOINT ?= mainnet.eth.streamingfast.io:443
GRAPH_CONFIG ?= ../graph-node-dev/config/graphman.toml
STOP_BLOCK ?= +10

.PHONY: codegen
codegen:
	substreams protogen ./substreams.yaml --exclude-paths="sf/substreams,google"

.PHONE: build
build: codegen
	cargo build --target wasm32-unknown-unknown --release

.PHONY: run_db_out_eth
run_db_out_eth: build
	 substreams run -e mainnet.eth.streamingfast.io:443 substreams.yaml db_out_eth --start-block 10 --stop-block 100

.PHONY: run_db_out_sol
run_db_out_sol: build
	substreams run -e mainnet.sol.streamingfast.io:443 substreams.yaml db_out_sol --start-block 179432154 --stop-block 179432254

.PHONY: package
package: build
	substreams pack -o substreams.spkg substreams.yaml

.PHONY: db_eth
db_eth: package
	./substreams-sink-mongodb/devel/eth-block-meta/start_eth.sh

.PHONY: db_sol
db_sol: package
	./substreams-sink-mongodb/devel/eth-block-meta/start_sol.sh

