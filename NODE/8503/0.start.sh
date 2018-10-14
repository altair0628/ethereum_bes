#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`

if [ -f /usr1/ethereum/NODE/pid/8503.pid ]
then
    echo "Already Running !!!!    or    Check a x.pid file & rm -rf /usr1/ethereum/NODE/pid/8503.pid"
    exit 0
fi

echo "tail -f /usr1/ethereum/NODE/8503/geth.log"
echo

nohup geth                                                         \
     --networkid           2018                                    \
     --cache               512                                     \
     --port                33003                                   \
     --syncmode            full                                    \
     --gcmode              archive                                 \
     --datadir             /usr1/ethereum/NODE/8503                \
     --ipcpath             /usr1/ethereum/NODE/8503/geth.ipc       \
     --ethash.cachedir     /usr1/ethereum/NODE/8503/cache/         \
     --ethash.dagdir       /usr1/ethereum/NODE/8503/dag/           \
     --rpc                                                         \
     --rpcaddr             "0.0.0.0"                               \
     --rpcport             8503                                    \
     --rpccorsdomain       "*"                                     \
     --rpcapi              "eth,txpool,personal,web3"              \
     --bootnodes           "enode://1513f4eefe610dc6cc57274ff50907f819e9a1d7ce122c97d5d788a0577bf6e23ec56870b4b4099c1deb451c3e0f0daa43d72be996927d4cf118a8ea08c92623@133.186.240.79:33003" \
>>  /usr1/ethereum/NODE/8503/geth.log  &


echo `ps -ef | grep geth | grep 8503 | awk '{print $2}'` > /usr1/ethereum/NODE/pid/8503.pid


