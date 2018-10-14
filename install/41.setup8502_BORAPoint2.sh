#!/bin/bash

cd /usr1/ethereum/NODE/8502

echo "Init"
./9.init.sh
sleep 3

echo "Start Peer"
./0.start.sh
sleep 3

echo "tail -f log"
./1.tail.sh

