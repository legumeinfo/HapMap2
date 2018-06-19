from hapmap2 import app
from flask import jsonify
from database import postgres_db_connect


route = app.config['API_PATH']

@app.route(route + '/germplasm')
def germplasm():
    '''Germplasm'''
    endpoints = sorted(
                      [rule.rule for rule in app.url_map.iter_rules() 
                      if rule.endpoint != 'static']
               )
    return jsonify(dict(routes=endpoints))
