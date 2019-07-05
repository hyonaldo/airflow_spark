#!/bin/bash
source ~/.bashrc
PWD=$(cd `dirname $0`; pwd);

##### new AIRFLOW_HOME #####
export AIRFLOW_SPARK_HOME=`dirname $PWD`
export AIRFLOW_HOME=$AIRFLOW_SPARK_HOME/airflow
echo "AIRFLOW_SPARK_HOME=$AIRFLOW_SPARK_HOME"
echo "AIRFLOW_HOME=$AIRFLOW_HOME"

#### bash util functions ####
source $AIRFLOW_SPARK_HOME/common/bash_utils.sh

verbose_cmd ls $PWD/*.pid
if [[ $? != 0 ]]
then
    exit 1
fi

verbose_cmd ps -ef | grep airflow | egrep -v $(basename $0 .sh)

echo
for pid in $(cat `ls $PWD/*.pid`);
do
    verbose_cmd kill $pid
done

