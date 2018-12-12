    document.addEventListener('DOMContentLoaded', function() {
        var results_table = $('#blast-results-datatable').DataTable({
            'data': data,
            'columns' : columns,
            'bSortClasses' : false,
            'columnDefs':[{
                            targets: -1,
                            data: null,
                            defaultContent: '<button>View in JBrowse</button>'
            }],
            'colReorder' : {
                fixedColumnsLeft: 1
            },
            'dom': 'Bfrtip',
            'buttons': [
                'csv', 'excel'
            ],
            'search': {
                'caseInsensitive': true,
                'regex': true
            },
            'select' : true,
            'order' : []
        });
        $('#blast-results-datatable tbody').on('click', 'button', function(){
            var data = results_table.row($(this).parents('tr')).data();
            var genome = data[1].split('.').slice(1, 3).join('.');
            var my_region = data[1] + ':' + data[8] + '..' + data[9];
            var domain = "{{ domain }}";
            var my_url = 'http://' + domain + '/jbrowse/?data=medtr/' + genome + '&loc=' + my_region;
            console.log(my_url);
            window.open(my_url, '_blank');
        }); //jquery way not as clean but uses datatables anyway...  for now
    });
    function alert_placeholder(){
        alert('Coming Soon!')
    }

