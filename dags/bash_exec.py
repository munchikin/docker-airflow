from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.dummy import DummyOperator
from airflow.utils.dates import days_ago

args = {'owner':'root','start_date':days_ago(n=1)}
dag = DAG(dag_id='bash1',
        default_args=args,
        schedule_interval='@daily')
t1 = BashOperator(task_id='print_date',
                    bash_command='date',
                    dag=dag)
t2 = BashOperator(task_id='sleep',
                    bash_command='sleep 3',
                    dag=dag)
t3 = BashOperator(task_id='print_whoami',
                    bash_command='uname -a',
                    dag=dag)

t1 >> t2 >> t3