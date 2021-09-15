FROM apache/superset:latest
# Switching to root to install the required packages
USER root
# Install the relevant db drivers to enable connecting to databases
RUN pip install psycopg2-binary sqlalchemy-redshift snowflake-sqlalchemy
# Now install other interesting packages
RUN pip install redis
# Switching back to using the `superset` user
USER superset
# Add configuration
COPY superset_config.py .
