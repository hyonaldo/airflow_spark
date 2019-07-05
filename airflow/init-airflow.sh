#!/bin/bash
PWD=$(cd `dirname $0`; pwd);

##### new AIRFLOW_HOME #####
export AIRFLOW_SPARK_HOME=`dirname $PWD`
export AIRFLOW_HOME=$AIRFLOW_SPARK_HOME/airflow
echo "AIRFLOW_SPARK_HOME=$AIRFLOW_SPARK_HOME"
echo "AIRFLOW_HOME=$AIRFLOW_HOME"

#### bash util functions ####
source $AIRFLOW_SPARK_HOME/common/bash_utils.sh

##### change AIRFLOW_HOME to new one in airflow.cfg #####
sed -i 's,/.*/airflow_spark,'"$AIRFLOW_SPARK_HOME"',g' $AIRFLOW_HOME/airflow.cfg
sed -i 's,sqlite:/,sqlite:////,g' $AIRFLOW_HOME/airflow.cfg

##### init ariflow #####
verbose_cmd pip install apache-airflow
verbose_cmd cd $AIRFLOW_HOME
verbose_cmd airflow initdb

##### set environment #####
ENV_FILE=~/.bashrc

grep AIRFLOW_HOME $ENV_FILE
if [[ $? == 0 ]]
then
    verbose replace AIRFLOW_HOME to $AIRFLOW_HOME
    sed -i 's,export AIRFLOW_HOME=/.*,'"export AIRFLOW_HOME=$AIRFLOW_HOME"',g' $ENV_FILE
else
    verbose append $AIRFLOW_HOME to $ENV_FILE
    echo "export AIRFLOW_HOME=$AIRFLOW_HOME" >> $ENV_FILE
fi
verbose_cmd tail $ENV_FILE

