FROM apache/airflow:slim-2.5.1-python3.7 

USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends sox libsox-fmt-mp3 \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

RUN pip install --no-cache-dir --user psycopg2-binary celery redis

RUN rm -f /home/airflow/.local/lib/python3.7/site-packages/airflow/example_dags/example_*.py

