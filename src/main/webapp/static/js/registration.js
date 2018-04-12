$(document).ready(function() {
	
})
function isPasswordComfirmed() {
	
	
	var password = document.getElementById("password").value;
	var cpassword=document.getElementById("comfirm_password").value;
	var valid=false;
	if (cpassword===""){
		valid= false;
		 }
	else if (password!=cpassword){
		
		$('#comfirm_password').after('<div class="error">'+" comfirmation password mismatch"+'</div>');
		valid= false;
		 }
	else{
		//$('#comfirm_password').after('<div class="error">'+" password comfirmed "+'</div>');
		valid= true;
	}
	if(document.getElementById("txtFname").value===""){
		$('#txtFname').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("txtLname").value===""){
		$('#txtLname').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("txtNic").value===""){
		$('#txtNic').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("txtEmail").value===""){
		$('#txtEmail').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("mobile").value===""){
		$('#mobile').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("date_of_birth").value===""){
		$('#date_of_birth').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("type").value===""){
		$('#type').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("password").value===""){
		$('#password').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if(document.getElementById("gender").value===""){
		$('#gender').after('<div class="error">'+" This field can't be empty "+'</div>');
		valid= false;
	}
	if (valid===false){submitButtonPlaceHold();}
	
	return valid;
}

function register() {
	$(".error").remove();
	if(isPasswordComfirmed()){
	var userId = $('#userId').val() == '' ? -1: $('#userId').val();
	var firstName = $('#firstName').val();
	var lastName = $('#lastName').val();
	var userName = $('#userName').val();
	var email = $('#email').val();
	var mobile=$('#mobile').val();
	var password = $('#password').val();
	var gender=$('#gender').val();
	var type=$('#type').val();
	var date_of_birth=$('#date_of_birth').val();
	
	var requestObj = {
			"userId":userId,
			"firstName":firstName,
			"lastName":lastName,
			"email":email,
			"mobile":mobile,
			"userName":userName,
			"password":password,
			"gender":gender,
			"type":type,
			"date_of_birth":date_of_birth
			
		}
	
	 //$('input').next().remove();
	$.ajax({ 
	    url: 'api/user/saveUpdate',    
	    type: "POST", 
	    headers: { 
	        'Accept': 'application/json', 
	        'Content-Type': 'application/json' 
	    },
	    dataType:"json",
	    data: JSON.stringify(requestObj), //Stringified JSON Object

	    success: function(data) { 
	    
	    	if(!data.success) {
	    		//document.getElementById("errdiv").innerHTML = "asdasdasd";
	    		
	    		//setErrList(data.statusList);
	    		$.each(data.statusList,function(key,value){
	    			
	  	            $('input[id='+key+']').after('<div class="error">'+value+'</div>');
	              });
	    		
	    		return false;
	    		
	    		
	    	}  
	    	else {
	    		
	    		alert("successfully registered");
	    		$('#userId').val('');
	    		clearFileds();
	    		
	    	} 
	    },
	    error: function(data){
	    	console.log(data.success);
	    	return false;
	    }
	});}
}
function clearFileds(){

	$('#firstName').val('');
	$('#userName').val('');
	$('#lastName').val('');
	$('#email').val('');
	$('#password').val('');
	$('#mobile').val('');
	$('#gender').val('');
	$('#type').val('');
	$('#date_of_birth').val('');
	
}
function submitButtonPlaceHold () {
	
	document.getElementById("divreg2").style.top="40%";
	document.getElementById("divreg1").style.top="40%";
	document.getElementById("divregId").style.height="620px";
}
