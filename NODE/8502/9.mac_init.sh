#!/bin/bash

WORKDIR=`dirname -- "$(greadlink -f -- "$0")"`

cd ~/bes/ethereum/NODE/8502

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf ~/bes/ethereum/NODE/pid/8502.pid

mkdir dag
mkdir cache

geth --datadir ~/bes/ethereum/NODE/8502   init   ~/bes/ethereum/NODE/conf/genesis_8502.json

tree

echo;
echo "#############################"
echo "Instance ID : " $LOCALID
echo "#############################"
echo

echo "./0.mac_start.sh"

