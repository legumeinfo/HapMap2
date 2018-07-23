###############################################################################
#                       Application to run HAPMAP2                            #
#                      Connor Cameron (ctc@ncgr.org)                          #
#                      Andrew Farmer  (adf@ncgr.org)                          #
###############################################################################

import os
import sys
import logging
from logging import Formatter
from logging.handlers import RotatingFileHandler
from flask import Flask, request, session, g, redirect, url_for, abort, \
     render_template, flash
from flask_cors import CORS

LOGFILE = 'logs/hapmap2.log'
MAXLOGBYTES = 1024 * 1024
MAXLOGFILES = 10

# create flask app
app = Flask(__name__, template_folder='client')
app.config.from_object(__name__)
app.config.update(dict(
    API_PATH='/api/v1',
    DATABASE = 'hapmap2',
    HOST = 'localhost',
    PORT = 5432,
    SECRET_KEY = 'neo4j',
    USERNAME = 'ccameron',
    PSWD = ''
))
if not os.environ.get('BLAST_DB_HOME'):
    sys.stderr.write('BLAST_DB_HOME environment variable REQUIRED!\n')
    sys.exit(1)
app.blast_db_dir = os.environ.get('BLAST_DB_HOME') # db dir for blast objects
# WILL FILL HERE FOR INITIAL DATA an api view will be required here to serve it
app.templates_dir = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
app.templates_dir += '/client/templates/'
app.mailing_address = 'germplasm@hapmap2.ncgr.org'
msg_format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
formatter = Formatter(msg_format)
handler = RotatingFileHandler(
    LOGFILE,
    maxBytes=MAXLOGBYTES,
    backupCount=MAXLOGFILES
)
handler.setFormatter(formatter)

if app.debug:
    handler.setLevel(logging.DEBUG)
else:
    handler.setLevel(logging.INFO)
# Also add the handler to gunicorns loggers and
# let app see the handler for logging inside views
gunicorn_error = logging.getLogger('gunicorn.error')
gunicorn_access = logging.getLogger('gunicorn.access')
gunicorn_error.addHandler(handler)
gunicorn_access.addHandler(handler)
app.logger.addHandler(handler)

CORS(app)

import views

# this exists for gunicorn invocation
if __name__ == '__main__':
    app.run()
