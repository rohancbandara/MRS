$(document).ready(function(){
	
	chekPassword();
	
	
});



function chekPassword(){
	
	$('#txtPassword, #txtConformPassword').on('keyup', function () {
		  if ($('#txtPassword').val() == $('#txtConformPassword').val()) {
			  	
		    $('#message').html('Matching').css('color', 'green');
		    document.getElementById("agree").disabled = false;
		  } else {
			  $('#message').html('Not Matching').css('color', 'red');
			  document.getElementById("agree").disabled = true;  
		  }
		    	
		  
		});
	
}


function Check() {
    var chkPassport = document.getElementById("agree");
    if (chkPassport.checked ) {
    	document.getElementById("btnRegister").disabled = false;
    } else {
    	document.getElementById("btnRegister").disabled = true;
    }
}
