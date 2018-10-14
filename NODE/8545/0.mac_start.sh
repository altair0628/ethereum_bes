#!/bin/bash

WORKDIR=`dirname -- "$(greadlink -f -- "$0")"`

if [ -f ~/bes/ethereum/NODE/pid/8545.pid ]
then
    echo "Already Running !!!!"
    exit 0
fi

echo "tail -f ~/bes/ethereum/NODE/8545/geth.log"
echo

nohup ~/bes/go-ethereum/build/bin/geth                                                         \
     --networkid           2018                                    \
     --cache               512                                     \
     --port                30303                                   \
     --syncmode            full                                    \
     --gcmode              archive                                 \
     --datadir             ~/bes/ethereum/NODE/8545                \
     --ipcpath             ~/bes/ethereum/NODE/8545/geth.ipc       \
     --ethash.cachedir     ~/bes/ethereum/NODE/8545/cache/         \
     --ethash.dagdir       ~/bes/ethereum/NODE/8545/dag/           \
     --rpc                                                         \
     --rpcaddr             "0.0.0.0"                               \
     --rpcport             8545                                    \
     --rpccorsdomain       "*"                                     \
     --rpcapi              "eth,txpool,personal,web3"              \
     --bootnodes           "enode://a7c5457eb05dbe431181437f2b00bb78fed0ad477d4f51e45e3976aaad361174acd3f3b872c0378a6b6191fb59ff5c7d2ac17b291cc138f25a4a6bc7af2f5e09@133.186.240.79:30303" \
>>  ~/bes/ethereum/NODE/8545/geth.log  &


echo `ps -ef | grep geth | grep 8545 | awk '{print $2}'` > ~/bes/ethereum/NODE/pid/8545.pid

