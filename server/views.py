import re
from hapmap2 import app, session, g, render_template, request
from flask import render_template_string, make_response, jsonify
from api import help, germplasm, blast

logger = app.logger


@app.route('/')
def document_root():
    '''Root of application, serves home page'''
    return render_template('index.html', static_path='/static')


@app.route('/germplasm')
def main_germplasm():
    '''Germplasm Page'''
    return render_template('templates/germplasm.html', static_path='/static')


@app.route('/blast')
def main_blast():
    '''BLAST page POSTS to API endpoint /api/v1/blast'''
    return render_template('templates/blast.html', static_path='/static/')


@app.route('/test_post', methods=['POST'])
def test_post():
    '''Tests POST from BLAST page'''
    print('This is request form {}'.format(request.form["blast-sequence-input"]))
    return jsonify([])
