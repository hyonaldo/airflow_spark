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

