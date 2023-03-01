# -*- coding: utf-8 -*-
import os

from airflow import DAG
from datetime import datetime, timedelta
from airflow.operators.bash import BashOperator


with DAG(
        "mp3_to_wav",
        default_args={
            "depends_on_past": False,
        },
        description="Convertation from MP3 to WAV with 44100Hz sampling rate",
        schedule=timedelta(days=1),
        start_date=datetime(2021, 1, 1),
        catchup=False,
        tags=["mp3_to_wav", "resampling"],
) as dag:
    dag_dir = os.path.abspath(os.path.dirname(os.path.realpath(__file__)))
    bash_script_path = f"{dag_dir}/mp3_to_wav.sh"
    mp3_dir = f"{dag_dir}/../input_data"
    wav_dir = f"{dag_dir}/../output_data"

    task = BashOperator(
        task_id="convertation",
        bash_command=f"bash {bash_script_path} {mp3_dir} {wav_dir}"
    )
