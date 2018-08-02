    document.addEventListener('DOMContentLoaded', function() {
        $('#blast-results-datatable').DataTable({
            'data': data,
            'columns' : columns,
            "bSortClasses" : false,
            "colReorder" : {
                fixedColumnsLeft: 1
            },
            'dom': 'Bfrtip',
            'buttons': [
                'csv', 'excel'
            ],
            "search": {
                "caseInsensitive": true,
                "regex": true
            },
            "select" : true,
            "order" : []
        });
    });
    function alert_placeholder(){
        alert('Coming Soon!')
    }

