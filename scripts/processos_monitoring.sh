#!/bin/bash

## comando "ps -e", lista todos os processos.
## comando "ps -e -o pid", lista apenas o numero de todos os processos.
## comando "ps -e -o pid --sort -size" lista os numeros de processo do 
##que esta mais utilizando memoria para o que esta utilizando menos

## comando "ps -e -o pid --sort -size | head | grep [0-9]" lista os numeros dos 10 processos que mais utilizam a memoria do servidor
## para setar mais linhas basta adicionar "-n $numerodelinhas" apos o head antes do pipe

##---------------------

## pegar nome do processo atravez do numero: "ps -p numeroprocesso -o comm="

## pegar data "date" (default), "date +%F,%H:%M:%S" customizado para o log 

##--------------script

monitoring(){
    cd /home/alisson/Downloads/script_imagens_curso

    if [ ! -d logs_monitoring ]
    then
        mkdir logs_monitoring
    fi

    GET_PROCESS=$(ps -e -o pid --sort -size | head -n 20 | grep [0-9])


    for pid_processo in $GET_PROCESS
    do
        echo -n "Processo: $(ps -p $pid_processo -o comm=) || " >> logs_monitoring/log_monitoring.log
        echo -n "$(date +%F,%H:%M:%S,) || " >> logs_monitoring/log_monitoring.log
        memory_consumed=$(ps -p $pid_processo -o size | grep [0-9])
        ##convertendo para MB
        echo "$(bc <<< "scale=2;$memory_consumed/1024") MB" >> logs_monitoring/log_monitoring.log
    done
}
monitoring
if [ $? -eq 0 ]
then
    echo "monitoring executado"
else
    echo "errorrr"
fi

