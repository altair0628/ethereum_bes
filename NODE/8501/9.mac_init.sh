#!/bin/bash

WORKDIR=`dirname -- "$(greadlink -f -- "$0")"`

cd ~/bes/ethereum/NODE/8501

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf ~/bes/ethereum/NODE/pid/8501.pid

mkdir dag
mkdir cache

~/bes/go-ethereum/build/bin/geth --datadir ~/bes/ethereum/NODE/8501   init   ~/bes/ethereum/NODE/conf/genesis_8501.json

tree

echo;
echo "#############################"
echo "Instance ID : " $LOCALID
echo "#############################"
echo

echo "./0.mac_start.sh"

