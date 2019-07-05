#!/bin/bash
source ~/.bashrc

PWD=$(cd `dirname $0`; pwd)

ls $PWD/*.pid
				 
echo ---------------------------------------
echo stop-airflow.sh ...
time $PWD/stop-airflow.sh

echo ---------------------------------------
echo sleep 5 ...
sleep 5

echo ---------------------------------------
echo start-airflow.sh ...
time $PWD/start-airflow.sh

echo ---------------------------------------
ls $PWD/*.pid

