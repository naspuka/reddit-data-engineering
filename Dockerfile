FROM apache/airflow:2.9.1-python3.9

# Switch to root to install system dependencies
USER root

# Install build dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file
COPY requirements.txt /opt/airflow/requirements.txt

# Switch back to airflow user
USER airflow

# Install Python dependencies
RUN pip install --no-cache-dir -r /opt/airflow/requirements.txt
