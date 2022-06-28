FROM apache/airflow:2.3.2-python3.10

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         build-essential \
         python-dev \
         libxt-dev \
         default-jdk \
         libsasl2-dev \
         libsasl2-modules-gssapi-mit \
         vim \
         krb5-config \
         krb5-user \
         krb5-kdc \
         libkrb5-dev \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime

USER airflow

RUN pip3 install --trusted-host files.pythonhosted.org --no-cache-dir avro apache-airflow-providers-apache-hdfs==3.0.0 apache-airflow-providers-apache-hive==2.3.3