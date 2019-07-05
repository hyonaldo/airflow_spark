# spark maven example
scala code를 maven으로 build하여 c3에 submit하는 template

## requirements
* maven 3 이상
* java 1.8 이상
* c3 개발 환경 구성
 * http://c3.doc.nhnsystem.com/docs/c3-user/en/latest/dev_env.html

## build
```
mvn clean package
```

## scripts (for crontab, etc)
```
$ ./runner.sh
Usage: ./runner.sh [CLASS] [CLASS_ARGS]
e.g. ./runner.sh com.navercorp.DailyBatchMain 'com.navercorp.Template dev 20190630 1'
```

## example
```
$ ./DailyBatch.sh
Usage: ./DailyBatch.sh [CLASS_NAME] [ENV] [START_DATE] [NUM_DAYS]
e.g) ./DailyBatch.sh Template dev 20180831 31
```

```
$ cat DailyBatch.sh
#!/bin/bash

BASENAME=$(basename $0 .sh)

if [[ $# < 4 ]]
then
    echo "Usage: $0 [CLASS_NAME] [ENV] [START_DATE] [NUM_DAYS]"
    echo "e.g) $0 Template dev 20180831 31"
    exit 1
fi

PACKAGE=com.navercorp
MAIN_CLASS=${PACKAGE}.DailyBatchMain
CLASS_NAME=${PACKAGE}.$1
ENV=$2
START_DATE=$3
NUM_DAYS=$4

PWD=$(cd `dirname $0`; pwd);
echo $PWD/runner.sh $MAIN_CLASS "$CLASS_NAME $ENV $START_DATE $NUM_DAYS"
time $PWD/runner.sh $MAIN_CLASS "$CLASS_NAME $ENV $START_DATE $NUM_DAYS"
```

See Also
http://blog.naver.com/gyrbsdl18/220880041737
