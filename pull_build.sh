#!/bin/bash
# See also, https://grimoire.ca/git/stop-using-git-pull-to-deploy

PWD=$(cd `dirname $0`; pwd);
source $PWD/common/bash_utils.sh

##### fetch #####
verbose_cmd git pull origin master

# Follow with actual deployment steps (run fabric/capistrano/make/etc)

##### build #####
verbose_cmd cd $PWD/spark
verbose_cmd mvn clean package

##### test1 #####
verbose_cmd python3 $AIRFLOW_HOME/dags/template_dag.py
if [[ $? != 0 ]]
then
    rollback
    exit 1
fi

##### test2 #####
airflow test template_dag client-log_exists $(date +%F -d "2 days ago")
if [[ $? != 0 ]]
then
    rollback
    exit 1
fi

verbose deployment has completed successfully

