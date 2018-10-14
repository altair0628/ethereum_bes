#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`

cd /usr1/ethereum/NODE/8545

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf /usr1/ethereum/NODE/pid/8545.pid

mkdir dag
mkdir cache

geth --datadir /usr1/ethereum/NODE/8545   init   /usr1/ethereum/NODE/conf/genesis_8545.json

tree

echo;
echo "#############################"
echo "Instance ID : " $LOCALID
echo "#############################"
echo

echo "./0.start.sh"

