#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`

if [ -f /usr1/ethereum/NODE/pid/8501.pid ]
then
    echo "Already Running !!!!   or   Check a x.pid file & rm -rf /usr1/ethereum/NODE/pid/8501.pid"
    exit 0
fi

echo "tail -f /usr1/ethereum/NODE/8501/geth.log"
echo

nohup geth                                                         \
     --networkid           2018                                    \
     --cache               512                                     \
     --port                33001                                   \
     --syncmode            full                                    \
     --gcmode              archive                                 \
     --datadir             /usr1/ethereum/NODE/8501                \
     --ipcpath             /usr1/ethereum/NODE/8501/geth.ipc       \
     --ethash.cachedir     /usr1/ethereum/NODE/8501/cache/         \
     --ethash.dagdir       /usr1/ethereum/NODE/8501/dag/           \
     --rpc                                                         \
     --rpcaddr             "0.0.0.0"                               \
     --rpcport             8501                                    \
     --rpccorsdomain       "*"                                     \
     --rpcapi              "eth,txpool,personal,web3"              \
     --bootnodes           "enode://a938fb8d2c537f443f47064920c74838a022c507437da659a22270ae92e56a9db8099ca8dd71a981e968b97737a774bc1f7352ae0cded08fa1b5e690115070c3@133.186.240.79:33001" \
>>  /usr1/ethereum/NODE/8501/geth.log  &


echo `ps -ef | grep geth | grep 8501 | awk '{print $2}'` > /usr1/ethereum/NODE/pid/8501.pid


