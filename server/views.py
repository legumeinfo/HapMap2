import re
from hapmap2 import app, session, g, render_template, request
from flask import render_template_string, make_response, jsonify
from api import help, germplasm

logger = app.logger

@app.route('/')
def document_root():
    '''Root of application, serves home page'''
    return render_template('index.html', static_path='/static')
