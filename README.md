# airflow_spark
Integrating Apache Airflow and Spark

# airflow template
This template helps you initialize airflow and set spark running environments.
Not only that, it helps you build scala codes and submit to spark.

## requirements
* python >= 3 
* maven >= 3
* jdk >= 1.8

## install & init airflow

```
$ airflow/init-airflow.sh
$ airflow/start-airflow.sh
```

## build spark & test spark job with airflow
```
$ ./pull_build.sh
```

## result

```
......

[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 59.949 s
[INFO] Finished at: 2019-07-05T19:14:38+09:00
[INFO] Final Memory: 30M/304M
[INFO] ------------------------------------------------------------------------

real    1m1.529s

......

[2019-07-05 19:15:16,913] {bash_operator.py:127} INFO -
[2019-07-05 19:15:16,913] {bash_operator.py:127} INFO -         ----------------------------
[2019-07-05 19:15:16,913] {bash_operator.py:127} INFO -         ENV: real OUTPUT_BUCKET: /user/isearch/score
[2019-07-05 19:15:16,913] {bash_operator.py:127} INFO -         START_DATE: 20190703
[2019-07-05 19:15:16,913] {bash_operator.py:127} INFO -         NUM_DAYS: 1
[2019-07-05 19:15:16,914] {bash_operator.py:127} INFO -         ----------------------------
[2019-07-05 19:15:16,914] {bash_operator.py:127} INFO -
[2019-07-05 19:15:16,919] {bash_operator.py:127} INFO - ----------------------------------------
[2019-07-05 19:15:16,920] {bash_operator.py:127} INFO - HDFS_OUTPUT = /user/isearch/score/kr/summary/template/20190703
[2019-07-05 19:15:17,345] {bash_operator.py:131} INFO - Command exited with return code 0
```

