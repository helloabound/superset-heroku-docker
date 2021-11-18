FROM apache/superset:latest
# Switching to root to install the required packages
USER root
# install prerequisite core packs
RUN apt-get install -y --no-install-recommends build-essential libssl-dev libffi-dev python3-dev python3-pip libsasl2-dev libldap2-dev
# upgrade pip so that it doesn't continue to complain
RUN python -m pip install --upgrade pip
# Install the relevant db drivers to enable connecting to databases
RUN pip install lunarcalendar psycopg2 sqlalchemy-redshift prophet
#snowflake-sqlalchemy
# Now install other interesting packages
RUN pip install redis
# Switching back to using the `superset` user
USER superset
# Add configuration
COPY superset_config.py .
