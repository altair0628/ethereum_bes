#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`
LOCALID=`cat ${WORKDIR}/_env.local`
BASEGETHDIR=/usr1/ethereum/NODE

cd ${BASEGETHDIR}/${LOCALID}

rm -rf geth*
rm -rf dag*
rm -rf cache*
rm -rf ${BASEGETHDIR}/pid/${LOCALID}.pid

mkdir dag
mkdir cache

geth --datadir ${BASEGETHDIR}/${LOCALID}   init   ${BASEGETHDIR}/conf/genesis_${LOCALID}.json

tree

echo;
echo "######################"
echo "Instance ID : " $LOCALID
echo "######################"
echo

