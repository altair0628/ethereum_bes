#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`

cd /usr1/ethereum/NODE/8501

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf /usr1/ethereum/NODE/pid/8501.pid

mkdir dag
mkdir cache

geth --datadir /usr1/ethereum/NODE/8501   init   /usr1/ethereum/NODE/conf/genesis_8501.json

tree

echo;
echo "#############################"
echo "Instance ID : " $LOCALID
echo "#############################"
echo

echo "./0.start.sh"

