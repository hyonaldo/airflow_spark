# airflow template
airflow 를 init 하고 spark 실행 환경을 세팅하는 template

## requirements
* python 3 이상

## install & init airflow

```
$ cd airflow
$ ./init-airflow.sh
```

## start airflow (for crontab, etc)
```
$ cd airflow
$ ./start-airflow.sh
```

## test
```
$ cd airflow/dags
$ python3 template.py
```

## run template task

```
$ airflow test template Template '2019-06-30

......

[2019-07-05 18:32:21,422] {bash_operator.py:127} INFO -
[2019-07-05 18:32:21,422] {bash_operator.py:127} INFO -         ----------------------------
[2019-07-05 18:32:21,422] {bash_operator.py:127} INFO -         ENV: real OUTPUT_BUCKET: /user/isearch/score
[2019-07-05 18:32:21,423] {bash_operator.py:127} INFO -         START_DATE: 20190630
[2019-07-05 18:32:21,423] {bash_operator.py:127} INFO -         NUM_DAYS: 1
[2019-07-05 18:32:21,423] {bash_operator.py:127} INFO -         ----------------------------
[2019-07-05 18:32:21,423] {bash_operator.py:127} INFO -
[2019-07-05 18:32:21,429] {bash_operator.py:127} INFO - ----------------------------------------
[2019-07-05 18:32:21,429] {bash_operator.py:127} INFO - HDFS_OUTPUT = /user/isearch/score/kr/summary/template/20190630
[2019-07-05 18:32:21,853] {bash_operator.py:131} INFO - Command exited with return code 0
```

See Also
https://blog.naver.com/gyrbsdl18/221561318823
