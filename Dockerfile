FROM apache/superset:latest
# Switching to root to install the required packages
USER root
# install prerequisite core packs
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends build-essential libssl-dev libffi-dev python3-pip libsasl2-dev python3-dev libldap2-dev
# upgrade pip so that it doesn't continue to complain
RUN python3 -m pip install --upgrade pip
# Install python library deps
RUN pip3 install convertdate lunarcalendar holidays cython pystan pandas tqdm pystan
# Install the relevant drivers to enable connecting to databases
RUN pip3 install psycopg2 sqlalchemy-redshift redis #snowflake-sqlalchemy
# install the forecasting library
RUN pip3 install prophet
# Switching back to using the `superset` user
USER superset
# Add configuration
COPY superset_config.py .
