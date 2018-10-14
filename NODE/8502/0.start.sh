#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`

if [ -f /usr1/ethereum/NODE/pid/8502.pid ]
then
    echo "Already Running !!!!    or   Check a x.pid file & rm -rf /usr1/ethereum/NODE/pid/8502.pid"
    exit 0
fi

echo "tail -f /usr1/ethereum/NODE/8502/geth.log"
echo

nohup geth                                                         \
     --networkid           2018                                    \
     --cache               512                                     \
     --port                33002                                   \
     --syncmode            full                                    \
     --gcmode              archive                                 \
     --datadir             /usr1/ethereum/NODE/8502                \
     --ipcpath             /usr1/ethereum/NODE/8502/geth.ipc       \
     --ethash.cachedir     /usr1/ethereum/NODE/8502/cache/         \
     --ethash.dagdir       /usr1/ethereum/NODE/8502/dag/           \
     --rpc                                                         \
     --rpcaddr             "0.0.0.0"                               \
     --rpcport             8502                                    \
     --rpccorsdomain       "*"                                     \
     --rpcapi              "eth,txpool,personal,web3"              \
     --bootnodes           "enode://4e62f38541beaeb9a4982f6e22b1fbdc64b16a6671989f37fc4b961c626b3c9140684c764b58ae54acc8464ec4383ad3ccc1eaa29c9e62114312aa37b1ee9005@133.186.240.79:33002" \
>>  /usr1/ethereum/NODE/8502/geth.log  &

echo `ps -ef | grep geth | grep 8502 | awk '{print $2}'` > /usr1/ethereum/NODE/pid/8502.pid


