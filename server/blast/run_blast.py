#!/usr/bin/env python

import os
import sys
import subprocess
import logging
import re
from Bio import SeqIO
from io import StringIO


#def transform_results(line):  # this is going to be necessary later

def sanitize_fasta(fasta):
    '''Trys to load FASTA as SeqIO Record Object.  If fails return error.

       if succeeds sanitize further with character sub.
    '''
    remove_me = re.compile('[^a-zA-Z]+')
    all_sequences = []
    for record in SeqIO.parse(StringIO(fasta), 'fasta'):
        record.seq = remove_me.sub('', str(record.seq))
        all_sequences.append('>{}\n{}'.format(record.description, record.seq))
#        print(remove_me.sub('', test))
    return all_sequences


def parse_fmt6(fmt6):
    '''parses fmt 6 and returns dictionary of values'''
    columns = ['Query', 'Subject', 'Percent ID', 'Length', 'Mismatch',
               'Gaps', 'QStart', 'QEnd', 'Sstart', 'Send', 'E-value',
               'Bit-Score']
    formatted_col = []
    for c in columns:
        c = {'title': c}
        formatted_col.append(c)
    data = {'results': [], 'columns': formatted_col, 'col_data': []}
    for record in fmt6.splitlines():
        record = str(record, 'utf-8')
        values = record.split('\t')
        add_me = {'qseqid': values[0], 'sseqid': values[1], 
                  'pident': float(values[2]), 'length': int(values[3]),
                  'mismatch': int(values[4]), 'gapopens': int(values[5]),
                  'qstart': int(values[6]), 'qend': int(values[7]),
                  'sstart': int(values[8]), 'send': int(values[9]),
                  'evalue': float(values[10]), 'bitscore': float(values[11])}
        data['results'].append(add_me)
        data['col_data'].append(values) 
    return data


def blast_targets(blast, query, db, logger, **kwargs):
    '''Blast Queries after Sanitizing'''
    sanitized_queries = sanitize_fasta(query)
    query_string = '\n'.join(sanitized_queries)
    blast_cfg = "-outfmt '6'"  # add more here parse kwargs
    cmd = '{} -db {} -query <( echo -e "{}" ) {}'.format(blast, db,
                                                         query_string,
                                                         blast_cfg)
    result = ''
    output = ''
    result = subprocess.Popen(cmd,
                              shell=True,
                              stdout=subprocess.PIPE,
                              stderr=subprocess.PIPE,
                              executable='/bin/bash')
    output, error = result.communicate()
    residues = re.compile('Ignoring invalid residues')
    warnings = re.compile('Warning')
    if error:
        error = str(error, 'utf-8')
    if error and not (residues.search(error) or warnings.search(error)):
        error = "Error: " + error.strip()
        raise Exception(error)
#    assert output, str("results steam not populated, blast errored: " +
#                       result.returncode + ' ' + error.strip())
    data = parse_fmt6(output)
    return data


if __name__ == '__main__':
    logger = logging.getLogger('blast_test')
    query = '''>XM_013588360.2 PREDICTED: Medicago truncatula ethylene-responsive transcription factor 1 (LOC25500044), mRNA
ACAATGCATTACTCTTTGAGCCTCACACCAAGCCCACACAATCTCATCAAATCAAACACTCCTTCGAGTA      
ACCGCAAAGTTATAACCCCCAAACCATTTAAAAACACAAGATCATTTTCATTAAAAAAATGGATGCTTCA      
ATATTAATGTCTTGTGATTTTAATCCTTCATTTGAATCTGTTGATCAAATTCAACACCACTTGTTTGATC        
TTGATAAACACCAAAACGATTTCCATTCTCTCATCATGAATACTAATTCCACCCACCATGCCTCAGATCC    |^$!@#^%$!@#!@#
ATCCTCGCACGATTCATTTACTAGTCCAACATTGGTTGTTAACAACACTGACAATGTTAATGATGCCGCA
TGTAAAAATGGATCATCATCGATGATCCATAAACCTCACATTCCAATACCAGAATGGAAGAGGTATAGAG
GTGTGAGGCGAAGGCCATGGGGGAAATTTGCTGCAGAGATAAGGGATCCAAAGAAGAATGGAGCTAGAGT
TTGGCTTGGAACGTACGAAACTGAAGAAGAAGCTGGTTTGGCTTATGATAGAGCCACTTTCAAGATCCGT
GGTAGAAAAGCCAAGCTCAATTTTCCCCACCTTATCGGCTCTAAAGAGCCGACAAATGTGGTGGTAGCTT
CGAAGAACAGCTTATCGGAGGCTAATTATGAGCCTTCGGGAGGGATAATAAAGAAGAAGAAGAAGAACTT
AGTTGATGTATTGAATAGATTAGCCAATAATAGATGGAAAATTAAGTGCAGGGTTTGAAATGGTTTAGGG
GCTAAAGATGTTCTAGTGGGTAATGATGTTTGACATTTAAAAATAAAAAGAGAGGGATAATGATGTTTAT
GTGCATCAATGGCTGAATGATTTTTTGCTATAAAATGCTGCTAACTTTTTTAATTACTA'''
    exe_dir = os.path.abspath(os.path.dirname(sys.argv[0]))
    test_db = exe_dir + '/test_db.fasta'
#    targets = 10  # add options for other things
    blast_mode = 'blastn'
    options = {}  # fill later
    output = blast_targets(blast_mode, query, test_db, logger, **options)
    check = re.compile('^#|^\s*$|^{}$')  # blanks header etc
    for record in output.splitlines():
        if check.match(str(record)):  # split blanks and comments
            continue
        record = record.rstrip()
        print(record.decode('unicode_escape'))
