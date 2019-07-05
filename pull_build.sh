#!/bin/bash
# See also, https://grimoire.ca/git/stop-using-git-pull-to-deploy

PWD=$(cd `dirname $0`; pwd);
source $PWD/common/bash_utils.sh

AIRFLOW_HOME=$PWD/airflow
SPARK_JOBS_HOME=$PWD/spark

# functions
rollback (){
    verbose test failed
    verbose_cmd git reset HEAD~1
    verbose_cmd cd $SPARK_JOBS_HOME
    verbose_cmd mvn clean package
}

##### fetch #####
verbose_cmd git pull origin master

# Follow with actual deployment steps (run fabric/capistrano/make/etc)

##### build #####
verbose_cmd cd $SPARK_JOBS_HOME
verbose_cmd mvn clean package

##### test1 #####
verbose_cmd python3 $AIRFLOW_HOME/dags/template.py
if [[ $? != 0 ]]
then
    rollback
    exit 1
fi

##### test2 #####
airflow test template Template $(date +%F -d "2 days ago")
if [[ $? != 0 ]]
then
    rollback
    exit 1
fi

verbose deployment has completed successfully

