#!/bin/bash

WORKDIR=`dirname -- "$(readlink -f -- "$0")"`
LOCALID=`cat ${WORKDIR}/_env.local`

function settingEnv(){
    nodeInfo=`cat ${WORKDIR}/../conf/_env.local | grep -v '^ *#' | grep $1`

    if [ -z "${nodeInfo}" ]                  # Is parameter #1 zero length?
    then
        echo "Wrong Instance ID.... Check ../conf/_env.local file";
        exit 1;

    else
        echo "===================================================="
        echo ${nodeInfo}
        echo "===================================================="

        vGETHSVCID=`   echo ${nodeInfo} | cut -f1 -d" "`
        vGETHINSTID=`  echo ${nodeInfo} | cut -f2 -d" "`
        vGETHP2PPORT=` echo ${nodeInfo} | cut -f3 -d" "`
        vPIDDIR=`      echo ${nodeInfo} | cut -f4 -d" "`
        vGETHBASEDIR=` echo ${nodeInfo} | cut -f5 -d" "`
        vRPCAPI=`      echo ${nodeInfo} | cut -f6 -d" "`
    fi
}

settingEnv $LOCALID

if [ -f ${vPIDDIR}/${vGETHINSTID}.pid ]
then
    echo "Already Running !!!!"
    exit 0
fi

nohup geth                                                         \
     --networkid           ${vGETHSVCID}                           \
     --cache               512                                     \
     --port                ${vGETHP2PPORT}                         \
     --syncmode            full                                    \
     --gcmode              archive                                 \
     --datadir             ${vGETHBASEDIR}/${vGETHINSTID}          \
     --ipcpath             ${vGETHBASEDIR}/${vGETHINSTID}/geth.ipc \
     --ethash.cachedir     ${vGETHBASEDIR}/${vGETHINSTID}/cache/   \
     --ethash.dagdir       ${vGETHBASEDIR}/${vGETHINSTID}/dag/     \
     --rpc                                                         \
     --rpcaddr             "0.0.0.0"                               \
     --rpcport             ${vGETHINSTID}                          \
     --rpccorsdomain       "*"                                     \
     --rpcapi              "${vRPCAPI}"                            \
>>  ${vGETHBASEDIR}/${vGETHINSTID}/geth.log  &


echo `ps -ef | grep geth | grep ${vGETHINSTID} | awk '{print $2}'` > ${vPIDDIR}/${vGETHINSTID}.pid


