<!DOCTYPE html>
<html>
<head>
	<title>Registration</title>
	<script src="static/js/jquery.min.js" type="text/javascript"></script>
<script src="static/js/chekPassword.js" type="text/javascript"></script>
	
</head>
<body>
	<form action="userAdd" method="get">
	<label >User ID </label>
            <input name="uid" type="uid" id="uid"  readonly="readonly" value="<%=session.getAttribute("u_id")%>"/><br>
         

	
			<label >User Name</label>
        <input name="txtUname" type="text" id="txtUname" /><br>
    
    <label >Create a Password</label>
    	<input name="txtPassword" type="password" id="txtPassword" /><br>

    <label>Confirm Password</label>
    	<input name="txtConformPassword" type="password" id="txtConformPassword" /> <span id='message'></span><br>

    
<input id="agree" type="checkbox" name="agree" value="agree"  disabled="disabled" onchange="Check()" />
                    I have read and accept  <a href="#">Terms of Use.</a><br>
<button type="submit" name="btnRegister" id="btnRegister" disabled="disabled">Register</button>


	</form>
</body>
</html>