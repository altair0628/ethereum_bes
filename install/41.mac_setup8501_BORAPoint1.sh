#!/bin/bash

cd ~/bes/ethereum/NODE/8501

echo "Init"
./9.mac_init.sh
sleep 3

echo "Start Peer"
./0.mac_start.sh
sleep 3

echo "tail -f log"
./1.tail.sh

