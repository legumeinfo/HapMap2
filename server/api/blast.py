from hapmap2 import app
from flask import Flask, flash, request, jsonify
from werkzeug.utils import secure_filename
from database import postgres_db_connect
from blast import run_blast

ROUTE = app.config['API_PATH']
FASTA_EXTENSIONS = ['fasta', 'fa', 'fna']
logger = app.logger


def allowed_file(filename):
    '''check filename extension against allowed extensions'''
    return('.' in filename and \
           filename.rsplit('.', 1)[1].lower() in FASTA_EXTENSIONS)


@app.route(ROUTE + '/blast', methods=['POST'])
def blast():
    '''Blast Service.  Accpets POST with correct data structure.'''
    if request.method == 'POST':
        data = request.get_json()  # get data passed with POST
        if 'file' not in request.files:  # check form
            sequence_input = request.form
            if data.get('query'):  # sent as JSON
                query = data.get('query')
                flash(query)
                return jsonify(query)  # PLACEHOLDER
        else:
            blast_me = request.files['file']
            if not blast_me.filename:
                flash('File looks blank or has no name')
                return 'File looks blank'
            if blast_me and allowed_file(blast_me):
                filename = secure_filename(blast_me.filename)
                query = blast_me.read()
                blast = data.get('blast_mode', None)
                db = data.get('database', None)
                output = run_blast.blast_targets(blast, query, db, logger)
                return jsonify({'data': output})
    else:  # 405 if not POST
        flash('method must be POST')
        response = 'method {} not supported'.format(request.method)
        return(response, 405)
