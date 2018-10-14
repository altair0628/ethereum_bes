#!/bin/bash

cd /usr1

echo "1/2.Downloading go-ethereum...."
git clone -b release/1.8 https://github.com/ethereum/go-ethereum.git

cd go-ethereum/
git checkout -b v1.8.17
sed -i 's/CalcDifficulty(chain.Config(), time, parent)/big.NewInt(1)/g' /usr1/go-ethereum/consensus/ethash/consensus.go


echo "2/2.Compile go-ethereum...."
make geth

ls -al  ./build/bin/geth

./build/bin/geth version

rm -rf /usr/bin/geth

cp ./build/bin/geth /usr/bin/

geth version

