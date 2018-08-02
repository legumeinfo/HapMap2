    var blast_mode = 'blastn';
    var blast_db_type = 'nucleotide';
    var dbs = {};
    var example_sequence = `>XM_003601028.3 PREDICTED: Medicago truncatula nodulation-signaling pathway 2 protein (LOC11406790), mRNA
CACATAACAATATTCCCTTAACTTACCAATCAGTTTTTGGACTTCCACTGTCTCATCCTCTGAATCCTTC
TTCTCTCTCTCCATCACCTCTCAACCCCTTTATAAACCTCTTCCCATACCATTCATTCTCCCTCACCACA
CAACAAACCACAACTCAATAATAATATACACAAACCTAACTATATATTATATTTTGCTGATCTCTTTCTC
TTAAACACCTAACTTAATTATACCATGGATTTGATGGACATGGATGCCATCAATGACCTCCACTTCTCTG
GACACAGCTCCCTCACCAACACCCCTACTTCCGACGAGGATTATGGTTGCACCTGGAACCACTGGTCTCC
CATCGTCAACTGGGACACCTTTACAGGTGCCCCAGATGACTTTCACCACCTCATGGACACCATCATCGAG
GACAGAACAACTGTCCTCGAACAGCTCAGTCCATCTATCACCACAACCACCACCACCACCACAACCACGG
ATGAGGAAGAAGAAGAAATGGAAACAACAACCACAACAACAACAACGGCAATAAAAACGCATGAAGTTGG
TGATGATTCAAAAGGGCTAAAACTAGTGCACCTATTGATGGCTGGCGCGGAAGCCTTAACCGGTTCAACC
AAAAACCGTGACTTAGCTCGAGTGATATTGATCCGGCTCAAGGAATTAGTCTCACAACATGCTAACGGCT
CCAACATGGAGAGACTTGCCGCTCATTTCACCGAAGCCCTTCATGGACTACTAGAAGGTGCTGGGGGTGC
GCATAATAACCACCATCACCACAACAACAACAAACATTACCTCACCACAAATGGTCCCCACGACAACCAA
AACGACACACTTGCTGCTTTCCAACTACTTCAAGACATGTCACCTTACGTCAAATTCGGCCACTTCACAG
CCAATCAAGCCATCATCGAAGCCGTGGCCCACGAACGCCGCGTCCATGTCATCGACTACGATATCATGGA
AGGGGTCCAATGGGCCTCATTAATCCAATCACTTGCTTCCAACAACAACGGTCCACATCTTCGGATAACC
GCATTATCGCGGACAGGAACCGGCCGGAGGTCAATCGCCACCGTACAAGAAACCGGCAGGCGATTAACCT
CCTTTGCCGCTTCCCTCGGACAACCATTTTCTTTTCATCACTGCAGATTAGACTCCGATGAAACTTTCCG
TCCTTCTGCATTAAAGCTTGTACGTGGAGAGGCTTTGGTTTTCAACTGCATGCTGAATTTACCTCACCTT
AGTTACCGTGCACCGGAATCAGTTGCTTCGTTTTTAAACGGAGCAAAAACGTTGAATCCAAAGCTTGTGA
CGTTGGTTGAAGAAGAAGTTGGTTCTGTTATTGGTGGGTTTGTGGAAAGGTTCATGGACTCACTTCATCA
TTATTCAGCGGTTTTTGATTCATTGGAGGCTGGTTTTCCGATGCAGAACCGGGCCCGGACTTTGGTGGAG
AGGGTATTTTTTGGGCCTAGAATTGCAGGCTCGTTGGGCCGGATATATAGAACGGGTGGTGAAGAGGAGA
GAAGGTCATGGGGGGAGTGGTTAGGTGAGGTAGGGTTTAGGGGAGTTCCGGTGAGCTTTGCAAATCATTG
TCAAGCAAAGCTGTTGTTAGGGCTTTTTAATGATGGGTATAGGGTTGAAGAGGTGGGTGTGGGTAGTAAT
AAGTTGGTGTTGGATTGGAAATCAAGACGTTTGCTTTCTGCTTCCCTTTGGACTTGTTCTTCTTCAGATT
CTGATTTATAGGATGCTGATTAATTAAGTGCTAATCTATACTAGCTAAACAATCAATTATTCATGCCATG
TGCCTTTCTAATTGTTTTTTATTTACTGACCCTCTAAAAATGGAAACAATTATTGGTTTAATGTCTCATG
TTAAGTTCCACTTATGGTAGTTTTTTGATCGTTGAAGGATCTTAAATTTTGTTGACAAATGTGACTGATG
TCTGATTGTGTGTGCGTTTTGGTTTGTAATAAAAAATTCTCACATGAAATTAATTTCA`;
    document.addEventListener('DOMContentLoaded', function() {
        let submit_me = document.getElementById('blast-form-submit');
        submit_me.disabled = true;
        let dropdown = document.getElementById('blast-database-select');
        console.log(dropdown);
        dropdown.length = 0;
        const blast_dbs = 'http://fisher.ncgr.org:50021/api/v1/blast/databases';
        const request = new XMLHttpRequest();
        request.open('GET', blast_dbs, true);
        request.onload = function (){
          if(request.status == 200){
            console.log('RETURNED 200');
            dbs = JSON.parse(request.responseText);
            let option;
            for (let i = 0; i < dbs.length; i++) {
                if (dbs[i].db_type == blast_db_type){
                    option = document.createElement('option');
                    option.text = dbs[i].db_name;
                    option.value = dbs[i].db_lookup;
                    dropdown.add(option);
                }
            }
          } else {
            console.log('ERROR ON request ' + request.status);
          }
        };
        dropdown.selectedIndex = 0;
        request.onerror = function() {
            console.log('SERVER RETURNED AN ERROR!')
        };
	request.send();
        document.getElementById('example-sequence').addEventListener('click', function(){
            let blast_sequence = document.getElementById('blast-sequence-input');
            let submit_me = document.getElementById('blast-form-submit');
            blast_sequence.value = example_sequence;
            submit_me.disabled = false;
        });
        document.getElementById('sequence-input-file').addEventListener('change', function(){
            let sequence_input = document.getElementById('sequence-input-file');
            let submit_me = document.getElementById('blast-form-submit');
            console.log(sequence_input.files[0]);
            let my_file = sequence_input.files[0];
            if (my_file.size > 2097152){
            /*if (my_file.size > 2097){*/
                submit_me.disabled = true;
                alert('FILE UPLOADED IS GREATER THAN 2MB');
            } else {
                submit_me.disabled = false;
            }
        });
        document.getElementById('blast-sequence-input').addEventListener('input', function(){
            console.log('INPUT CHANGED!')
            let submit_me = document.getElementById('blast-form-submit');
            let my_value = document.getElementById('blast-sequence-input').value
            console.log(my_value);
            console.log(my_value.length)
            if (typeof my_value === 'undefined'){
                console.log('input undefined');
                submit_me.disabled = true;
                return
            } else if (my_value.length > 0){
                submit_me.disabled = false;
            } else {
                submit_me.disabled = true;
            }
        });
        document.getElementById('blast-method-select').addEventListener('change', function(v){
            console.log(this.options[v.target.selectedIndex].text);
            let dropdown = document.getElementById('blast-database-select');
            let method = this.options[v.target.selectedIndex].text;
            dropdown.length = 0;
            dropdown.innerHTML = '';
            let option;
            if (method == 'blastn' || method == 'tblastx' || method == 'tblastn'){
                blast_db_type = 'nucleotide';
            } else {
                blast_db_type = 'aminoacid';
            }
            for (let i = 0; i < dbs.length; i++) {
                if (dbs[i].db_type == blast_db_type){
                    option = document.createElement('option');
                    option.text = dbs[i].db_name;
                    option.value = dbs[i].db_lookup;
                    dropdown.add(option);
                }
            }
            dropdown.selectedIndex = 0;
        });
    });
    function alert_placeholder(){
        alert('Coming Soon!')
    }
