import re
import json
from jinja2 import Environment, FileSystemLoader
from hapmap2 import app, session, g, render_template, request
from flask import render_template_string, make_response, jsonify
from mailer import hapmap2_mailer
from api import help, germplasm, blast

logger = app.logger
JINJA_ENV = Environment(loader=FileSystemLoader(app.templates_dir),
                        lstrip_blocks=True, trim_blocks=True)


@app.route('/')
def document_root():
    '''Root of application, serves home page'''
    return render_template('index.html', static_path='/static')


@app.route('/germplasm')
def main_germplasm():
    '''Germplasm Page'''
    return render_template('templates/germplasm.html', static_path='/static')


@app.route('/germplasm-request', methods=['POST'])
def germplasm_request():
    '''POST to germplasm request'''
    if not request.get_json():
        return 'No data submitted', 404
    data = request.get_json().get('data')
    if not data:
        return 'No data submitted', 404
    template = JINJA_ENV.get_template('jinja/germplasm-request.jinja')
    reposense = make_response(render_tempalte_string(template.render(
                                                                data=data))) 
    return response


@app.route('/blast')
def main_blast():
    '''BLAST page POSTS to /blast-results endpoint'''
    return render_template('templates/blast.html', static_path='/static/')


@app.route('/blast-results', methods=['POST'])
def blast_results():
    '''Sends request to parse_post_reqiest method from blast API'''
    data = blast.parse_post_request(request)
    #return(data)
    if not data.get('data'):
        return 'no results found'
    else:
        template = JINJA_ENV.get_template('jinja/blast-results.jinja')
        response = make_response(render_template_string(template.render(
                                                                   data=data)))
        return response


@app.route('/test-post', methods=['POST'])
def test_post():
    '''Tests POST from BLAST page'''
    print('This is request form {}'.format(request.form["blast-sequence-input"]))
    return jsonify([])
