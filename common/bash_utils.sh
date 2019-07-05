#!/bin/bash
source ~/.bashrc

##### functions #####
verbose_cmd (){
    echo ---------------------------------------
    echo $(date +"[%F %R]" ) $@
    time $@
}
verbose (){
    echo ---------------------------------------
    echo $(date +"[%F %R]" ) $@
}
rollback (){
    verbose test failed
    verbose_cmd git reset HEAD~1
    verbose_cmd cd $PWD/spark
    verbose_cmd mvn clean package
}

