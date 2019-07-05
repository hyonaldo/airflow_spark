#!/bin/bash
PWD=$(cd `dirname $0`; pwd);

##### new AIRFLOW_HOME #####
export AIRFLOW_SPARK_HOME=`dirname $PWD`
export AIRFLOW_HOME=$AIRFLOW_SPARK_HOME/airflow
echo "AIRFLOW_SPARK_HOME=$AIRFLOW_SPARK_HOME"
echo "AIRFLOW_HOME=$AIRFLOW_HOME"

#### bash util functions ####
source $AIRFLOW_SPARK_HOME/common/bash_utils.sh

##### start as daemon #####
verbose_cmd airflow scheduler -D
verbose_cmd airflow webserver -D

