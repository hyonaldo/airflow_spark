#!/bin/bash

BASENAME=$(basename $0 .sh)

if [[ $# < 4 ]]
then
    echo "Usage: $0 [CLASS_NAME] [ENV] [START_DATE] [NUM_DAYS]"
    echo "e.g) $0 Template dev 20190630 2"
    exit 1
fi

PACKAGE=com.corp
MAIN_CLASS=${PACKAGE}.DailyBatchMain
CLASS_NAME=${PACKAGE}.$1
ENV=$2
START_DATE=$3
NUM_DAYS=$4

PWD=$(cd `dirname $0`; pwd);
echo $PWD/runner.sh $MAIN_CLASS "$CLASS_NAME $ENV $START_DATE $NUM_DAYS"
time $PWD/runner.sh $MAIN_CLASS "$CLASS_NAME $ENV $START_DATE $NUM_DAYS"

