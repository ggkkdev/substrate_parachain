kill -9 $(lsof -ti:8844,8845,9977,9978)
rm -rf ./tmp/parachain

./target/release/parachain-template-node \
--alice \
--collator \
--force-authoring \
--chain raw-parachain-chainspec1000.json \
--base-path ./tmp/parachain/alice \
--port 40333 \
--ws-port 8844 \
-- \
--execution wasm \
--chain ../polkadot/tmp/raw-local-chainspec.json \
--port 30343 \
--ws-port 9977 &


./target/release/parachain-template-node \
--bob \
--collator \
--force-authoring \
--chain raw-parachain-chainspec1001.json \
--base-path ./tmp/parachain/bob \
--port 40334 \
--ws-port 8845 \
-- \
--execution wasm \
--chain ../polkadot/tmp/raw-local-chainspec.json \
--port 30344 \
--ws-port 9978 &

# encoded call to open the channel 0x1700e90300000800000000001000