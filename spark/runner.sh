#!/bin/bash

JAR="target/com.corp.airflow_spark-0.1-jar-with-dependencies.jar"
CLASS=$1
CLASS_ARGS=$2

if [[ $# != 2 ]]
then
	echo "Usage: $0 [CLASS] [CLASS_ARGS]"
	echo "e.g. $0 com.corp.DailyBatchMain 'com.corp.Template dev 20190630 1'"
	exit 1
fi

MASTER=yarn
ARGS=" \
	--queue small --name hkpark/$(basename $CLASS) \
	--num-executors 16 \
	--executor-cores 3 \
	--executor-memory 16G \
	--driver-cores 2 \
	--driver-memory 3G \
    --conf spark.eventLog.enabled=false \
"

echo "========================================"
echo "$SPARK_HOME/bin/spark-submit --master $MASTER  --class $CLASS $ARGS $JAR $CLASS_ARGS"
echo "========================================"

$SPARK_HOME/bin/spark-submit --master $MASTER  --class $CLASS \
$ARGS $JAR $CLASS_ARGS  2>&1

# See Also
# https://jaceklaskowski.gitbooks.io/mastering-apache-spark/content/spark-submit.html
