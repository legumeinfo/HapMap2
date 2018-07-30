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
        console.log('Form Poplation and Submit Logic HERE!');
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
            blast_sequence.value = example_sequence;
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
