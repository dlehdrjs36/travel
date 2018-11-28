$(document).ready(function() {
	
	oTable = $('#example').DataTable({	
								/*bFilter: false,*/
    							bInfo : false,	
    							bLengthChange : false});

	$('.dataTables_filter').css({"display":"none"});
	
	$('#myInputTextField').keyup(function(){
	      oTable.search($(this).val()).draw() ;
	});
	
    $('#datatable').css({"display":"block"});
} );

function delchk(){
    return confirm("예약을 취소하시겠습니까?");
}

