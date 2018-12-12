import re
import json
from jinja2 import Environment, FileSystemLoader
from hapmap2 import app, session, g, render_template, request
from flask import render_template_string, make_response, jsonify
from mailer.hapmap2_mailer import hapmap2_mailer
from api import help, germplasm, blast

logger = app.logger
JINJA_ENV = Environment(loader=FileSystemLoader(app.templates_dir),
                        lstrip_blocks=True, trim_blocks=True)


@app.route('/')
def document_root():
    '''Root of application, serves home page'''
    return render_template('index.html', static_path='/static')


@app.route('/about')
def about_hapmap2():
    '''About Page for HAPMAP2'''
    template = JINJA_ENV.get_template('jinja/about.jinja')
    response = make_response(render_template_string(template.render(domain=app.domain)))
    return response


@app.route('/germplasm')
def main_germplasm():
    '''Germplasm Page'''
    template = JINJA_ENV.get_template('jinja/germplasm-main.jinja')
    response = make_response(render_template_string(template.render(domain=app.domain)))
#    return render_template('templates/germplasm.html', static_path='/static')
    return response


@app.route('/germplasm-request', methods=['POST'])
def germplasm_request():
    '''POST to germplasm request'''
    if not request.form:
        return 'No data submitted', 404
    form_data = request.form
    return_email = form_data['return-email-input']
    message = form_data['email-message-input']
    subject = 'Germplasm Request'
    if not return_email or not message:
        return 'No message or return email', 404
    if not hapmap2_mailer(return_email, ['ctc@ncgr.org', 'adf@ncgr.org'], subject, message):
        return 'Email Request did not validate, likely domain is not real', 404
    return 'Email Sent Successfully', 200


@app.route('/blast')
def main_blast():
    '''BLAST page POSTS to /blast-results endpoint'''
    template = JINJA_ENV.get_template('jinja/blast-main.jinja')
    response = make_response(render_template_string(template.render(domain=app.domain)))
#    return render_template('templates/blast.html', static_path='/static/')
    return response


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
                                                                   data=data, domain=app.domain)))
        return response


@app.route('/test-post', methods=['POST'])
def test_post():
    '''Tests POST from BLAST page'''
    print('This is request form {}'.format(request.form["blast-sequence-input"]))
    return jsonify([])
