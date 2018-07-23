from hapmap2 import app
from flask import Flask, flash, request, jsonify
from werkzeug.utils import secure_filename
from database import postgres_db_connect
from blast import run_blast

ROUTE = app.config['API_PATH']
FASTA_EXTENSIONS = ['fasta', 'fa', 'fna', 'txt']
BLAST_MODES = ['blastn', 'tblastn', 'blastp', 'blastx', 'tblastx']
logger = app.logger

#  curl --header "Content-Type: application/json"   --request POST   --data '{"query" : ">test_me\nACTGCTAGTAGTAGGATACGATAGAGTAGTAG", blast_opts : {''}}

def allowed_file(filename):
    '''check filename extension against allowed extensions'''
    return('.' in filename and \
           filename.rsplit('.', 1)[1].lower() in FASTA_EXTENSIONS)


def check_blast_db(db_lookup):
    '''Checks provided blast_db lookup in psql'''
    with postgres_db_connect.get_pooled_cursor() as cursor:
        query = '''select * from blast_databases where db_lookup=%s'''
        cursor.execute(query, [db_lookup])
        results = cursor.fetchall()
    return results


def parse_post_request(this_request):
    '''Handles parsing of post requests to /api/v1/blast'''
    options = {}  # add blast options here
    form_data = this_request.form  # assign form data
    query = ''
    blast_db = ''
    output = ''
    blast = 'blastn'  # change later for form options
    if form_data:  # if form process
         files = this_request.files  # set files to find and parse
         blast_db = form_data['blast-database-select']
         if not check_blast_db(blast_db):
             return('No Blast db found for {}'.format(blast_db), 400)
         if form_data.get('blast-sequence-input'):
             query = form_data.get('blast-sequence-input')
         else:
             if not files['sequence-input-file']:
                 return('sequence_file_empty', 400)
             blast_me = files['sequence-input-file']
             if not allowed_file(blast_me.filename):
                 return('format not allowed', 400)
             query = str(blast_me.read(), 'utf-8')
         blast_db = app.blast_db_dir + '/' + blast_db
         output = run_blast.blast_targets(blast, query, blast_db,
                                          logger, **options)
    return {'data': output}


@app.route(ROUTE + '/blast/databases', methods=['GET'])
def database_listing():
    '''Returns JSON of current blast DB listing'''
    with postgres_db_connect.get_pooled_cursor() as cursor:
        query = '''select * from blast_databases'''
        cursor.execute(query)
        results = cursor.fetchall()
    return jsonify(results)


@app.route(ROUTE + '/blast', methods=['POST'])
def blast():
    '''Blast Service.  Accpets POST with correct data structure.'''
    return jsonify(parse_post_request(request))
#        if not blast in BLAST_MODES:
#            return('blast mode {} not supported'.format(blast), 400)
#        if data.get('blast_opts'):  # get options for blast
#            blast_opts = data.get('blast_opts')
#            if not blast_opts.get('bdb'):  # required if blast_opts
#                return('database required for blast_opts', 400)
#            for b in blast_opts:
#                if not blast_opts[b]:  # I dont think it will ever be 0
#                    return('blast options must be populated {}:{}'.format(b,
#                                                               blast_opts[b]),
#                           400)
#                options[b] = blast_opts[b]  # do stuff with this
#            with postgres_db_connect.get_pooled_cursor() as cursor:
#                bdb = str(blast_opts.get('bdb'))
#                query = '''select * from blast_databases where db_name=%s'''
#                cursor.execute(query, [bdb])
#                results = cursor.fetchall()
#                if not results:  # cant find db, bad request
#                    return('No Blast db found for {}'.format(bdb), 400)
#                if len(results) > 1:  # multiple dbs, bad request
#                    return('Multiple blast dbs found...  Invalid', 400)
#                options['bdb'] = (app.blast_db_dir + '/' +
#                                  results[0]['db_lookup'])
#        if 'file' not in request.files:  # check form
#            sequence_input = request.form
#            if data.get('query'):  # sent as JSON
#                query = data.get('query')
#                logger.info(options['bdb'])
#                output = run_blast.blast_targets(blast, query, 
#                                                 options['bdb'], 
#                                                 logger, **options)
#                return jsonify({'data': output})  # PLACEHOLDER
#        else:
#            blast_me = request.files['file']  # if file provided
#            if not blast_me.filename:
#                flash('File looks blank or has no name')
#                return('File looks blank', 400)
#            if blast_me and allowed_file(blast_me):
#                filename = secure_filename(blast_me.filename)
#                query = blast_me.read()
#                output = run_blast.blast_targets(blast, query, 
#                                                 options['bdb'], 
#                                                 logger, **options)
#                return jsonify({'data': output})
