#!/bin/bash

WORKDIR=`dirname -- "$(greadlink -f -- "$0")"`

cd ~/bes/ethereum/NODE/8545

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf ~/bes/ethereum/NODE/pid/8545.pid

mkdir dag
mkdir cache

~/bes/go-ethereum/build/bin/geth --datadir ~/bes/ethereum/NODE/8545   init   ~/bes/ethereum/NODE/conf/genesis_8545.json

tree

echo;
echo "#############################"
echo "Instance ID : " $LOCALID
echo "#############################"
echo

echo "./0.mac_start.sh"
