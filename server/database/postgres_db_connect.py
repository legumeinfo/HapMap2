import os
import sys
import psycopg2
import psycopg2.extras
from psycopg2.pool import ThreadedConnectionPool
from contextlib import contextmanager
from hapmap2 import app, session, g

MIN_CONNECTIONS = 2
MAX_CONNECTIONS = 50  # postgresql default is 100

logger = app.logger
logger.info('setting up db connection pool')

db_pool = ''

try:
    db_pool = ThreadedConnectionPool(
        MIN_CONNECTIONS,
        MAX_CONNECTIONS,
        database = app.config['DATABASE'],
        user = app.config['USERNAME'],
        host = app.config['HOST'],
        port = app.config['PORT']
    )
except psycopg2.Error as e:
    error_msg = 'Could not create postgres connection pool: {}'.format(e)
    logger.error(error_msg)
    sys.exit(1)


@contextmanager
def get_pooled_connection():
    '''psycopg2 connection context manager.
       Fetch a connection from the connection pool and release it.
    '''
    try:
        connection = db_pool.getconn()
        yield connection
    finally:
        if connection:
            db_pool.putconn(connection)


@contextmanager
def get_pooled_cursor(commit=False):
    '''psycopg2 cursor context manager.
       Get a cursor into the db from the pooled coonections
    '''
    with get_pooled_connection() as connection:
        cursor = connection.cursor(
                            cursor_factory=psycopg2.extras.RealDictCursor
                 )
        try:
            yield cursor
            if commit:
                connection.commit()
        finally:
            cursor.close()
