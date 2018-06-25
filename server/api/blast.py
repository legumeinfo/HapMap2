from hapmap2 import app
from flask import Flask, flash, request, jsonify
from werkzeug.utils import secure_filename
from database import postgres_db_connect
from blast import run_blast

ROUTE = app.config['API_PATH']
FASTA_EXTENSIONS = ['fasta', 'fa', 'fna']
BLAST_MODES = ['blastn', 'tblastn', 'blastp', 'blastx', 'tblastx']
logger = app.logger

#  curl --header "Content-Type: application/json"   --request POST   --data '{"query" : ">test_me\nACTGCTAGTAGTAGGATACGATAGAGTAGTAG", blast_opts : {''}}

def allowed_file(filename):
    '''check filename extension against allowed extensions'''
    return('.' in filename and \
           filename.rsplit('.', 1)[1].lower() in FASTA_EXTENSIONS)


@app.route(ROUTE + '/blast', methods=['POST'])
def blast():
    '''Blast Service.  Accpets POST with correct data structure.'''
    if request.method == 'POST':
        data = request.get_json()  # get data passed with POST
        options = {'bdb': './blast/test_db.fasta'}  # add blast options here
        blast = data.get('blast_mode', 'blastn').lower()  # get mode or default
        if not blast in BLAST_MODES:
            return('blast mode {} not supported'.format(blast), 400)
        if data.get('blast_opts'):  # get options for blast
            blast_opts = data.get('blast_opts')
            if not blast_opts.get('bdb'):  # required if blast_opts
                return('database required for blast_opts', 400)
            for b in blast_opts:
                if not blast_opts[b]:  # I dont think it will ever be 0
                    return('blast options must be populated {}:{}'.format(b,
                                                               blast_opts[b]),
                           400)
                options[b] = blast_opts[b]  # do stuff with this
        if 'file' not in request.files:  # check form
            sequence_input = request.form
            if data.get('query'):  # sent as JSON
                query = data.get('query')
                logger.info(options['bdb'])
                output = run_blast.blast_targets(blast, query, options['bdb'], 
                                                 logger, **options)
                return jsonify({'data': output})  # PLACEHOLDER
        else:
            blast_me = request.files['file']  # if file provided
            if not blast_me.filename:
                flash('File looks blank or has no name')
                return('File looks blank', 400)
            if blast_me and allowed_file(blast_me):
                filename = secure_filename(blast_me.filename)
                query = blast_me.read()
                output = run_blast.blast_targets(blast, query, options['bdb'], 
                                                 logger, **options)
                return jsonify({'data': output})
    else:  # 405 if not POST
        flash('method must be POST')
        response = 'method {} not supported'.format(request.method)
        return(response, 405)
