from hapmap2 import app
from flask import jsonify, request
from database import postgres_db_connect

logger = app.logger
route = app.config['API_PATH']


def check_availability(record):
    '''checks for seed availabilty from dictionary and sets for return'''
    seeds_available = False
    if record['seeds_available']:  # check if 1 in db
        seeds_available = True
    record['seeds_available'] = seeds_available  # set value for table


def remove_emails(record):
    '''removes the emails from dictionary for the return; be safe'''
    if record['request_email']:
        record['request_email'] = ''  # remove email


def generate_list_query(my_list):
    '''returns a postgres query based on the provided list elements'''
    seen = {}
    query = 'select * from hapmap_line where hapmap_id in ({}'.format(
                                                                  my_list[0])
    for i in germplasm_list[1:]:
        if i in seen:
            continue  # no duplicates
        query += ', {}'.format(i)  # add elements for each excluding 0
        seen[i] = 1
    query += ')'
    return query


def get_records(query, remove_email=False):
    '''execute query and prepare results'''
    with postgres_db_connect.get_pooled_cursor() as cursor:
        cursor.execute(query)
        results = cursor.fetchall()
        for r in results:
            check_availability(r)  # set availability
            if remove_email:
                remove_emails(r)  # remove emails
        return results


def get_germplasm_all():
    query = '''select * from hapmap_line'''
    return get_records(query)


def get_germplasm_list(germplasm_list):
    '''get all germplasm records from provided list'''
    if not germplasm_list:  # if nothing provided return False
        return False
    query = generate_list_query(germplasm_list)  # get query for list
    return get_records(query)


def get_germplasm_mailer(germplasm_list):
    '''gets list for mailer export'''
    if not germplasm_list:  # if nothing provided return False
        return False
    query = generate_list_query(germplasm_list)  # get query for list
    return get_records(query, True)  # don't remove emails


@app.route(route + '/germplasm', methods=['GET', 'POST'])  # get all
def germplasm():
    '''Get all Germplasm or any germplsam and Return as JSON'''
    if request.method == 'GET':
        return jsonify({'data': get_germplasm_all()})
    if request.method == 'POST':
        my_selection = request.get_json().get('data')
        if not my_selection:
            return 'No data', 404
        return jsonify({'data': get_germplasm_list(my_selection)})
