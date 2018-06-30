from hapmap2 import app
from flask import jsonify
from database import postgres_db_connect


logger = app.logger
route = app.config['API_PATH']

@app.route(route + '/germplasm')
def germplasm():
    '''Get all Germplasm and Return as JSON'''
    with postgres_db_connect.get_pooled_cursor() as cursor:
        query = '''select * from hapmap_line'''
        cursor.execute(query)
        results = cursor.fetchall()
        for r in results:
            seeds_available = False
            if r['seeds_available']:  # check if 1 in db
                seeds_available = True
            r['seeds_available'] = seeds_available  # set value for table
    return jsonify({'data': results})
