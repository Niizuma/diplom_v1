$(document).ready(function(){
	$('#date_pick').datepicker({
	    format: "dd/mm/yyyy",
	    weekStart: 1,
	    todayBtn: "linked",
	    clearBtn: true,
	    calendarWeeks: true,
	    autoclose: true,
	    todayHighlight: true,
	});
});