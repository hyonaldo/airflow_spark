from datetime import datetime, date, timedelta

import airflow
from airflow.configuration import conf
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.sensors import TimeDeltaSensor
from airflow.operators.http_operator import SimpleHttpOperator

from pprint import pprint

### DAG setting ###
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2019, 6, 6),
    'email': ['abc@gmail.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 3,
    'retry_delay': timedelta(minutes=30),
    'trigger_rule': u'all_success'
}
ENVIRONMENT = "real"
dag = DAG(
    'template',
    default_args=default_args,
    catchup=False,
    max_active_runs=1,
    description='DAG for template',
    schedule_interval="@once",
)
dag.doc_md = __doc__

### BASH setting ###
scripts_folder = conf.get("customized","spark_folder")
main_class_name = "com.corp.DailyBatchMain"
default_spark_command = f"cd {scripts_folder} && ./runner.sh {main_class_name} '{{{{ params.class_name }}}} {ENVIRONMENT} {{{{ ds_nodash }}}} 1'"

hadoop_ls_command = f"hadoop fs -ls " + " {{ params.hdfs_path }}"

### TASKs ###
some_hfile_exists = BashOperator(
    task_id='some_hfile_exists',
    depends_on_past=False,
    bash_command=hadoop_ls_command,
    params={'hdfs_path': '/user'},
    dag=dag,
)

Template = BashOperator(
    task_id='Template',
    depends_on_past=False,
    bash_command=default_spark_command,
    params={'class_name': 'com.corp.Template'},
    dag=dag,
)

### Dependency setting ###
some_hfile_exists >> [Template]

if __name__ == "__main__":
    print("default_spark_command",default_spark_command)
    print("hadoop_ls_command",hadoop_ls_command)
    pprint(default_args)

