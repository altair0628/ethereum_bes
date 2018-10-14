#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`
LOCALID=`cat ${WORKDIR}/_env.local`

while true; do
  geth attach http://127.0.0.1:${LOCALID} --exec '"[" +  new Date ().toLocaleString().replace(/ /g,"_") + "] [blockNo] " + eth.blockNumber + ", [blockGasLimit] " + eth.getBlock("latest").gasLimit + ", [blockGasUsed] " + eth.getBlock("latest").gasUsed + ", [blockTrxCnt] " + eth.getBlock("latest").transactions.length + ", [pending] " + txpool.status.pending + ", [queued] " + txpool.status.queued'
  sleep 1
done

