from hapmap2 import app
from flask import jsonify
from database import postgres_db_connect


route = app.config['API_PATH']

@app.route(route + '/germplasm')
def germplasm():
    '''Get all Germplasm and Return as JSON'''
    with postgres_db_connect.get_pooled_cursor() as cursor:
        query = '''select * from hapmap_line'''
        cursor.execute(query)
        results = cursor.fetchall()
    return jsonify({'data': results})
