# spark maven example
This template helps you build scala codes and submit to spark

## requirements
* maven >= 3
* jdk >= 1.8

## build
```
mvn clean package
```

## scripts (for crontab, etc)
```
$ ./runner.sh
Usage: ./runner.sh [CLASS] [CLASS_ARGS]
e.g. ./runner.sh com.corp.DailyBatchMain 'com.corp.Template dev 20190630 1'
```

## example
```
$ ./DailyBatch.sh
Usage: ./DailyBatch.sh [CLASS_NAME] [ENV] [START_DATE] [NUM_DAYS]
e.g) ./DailyBatch.sh Template dev 20180831 31
```

```
$./DailyBatch.sh Template dev 20190630 31

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
http://blog.naver.com/gyrbsdl18/220880041737
