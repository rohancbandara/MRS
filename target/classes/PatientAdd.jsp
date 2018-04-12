<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Add</title>
<script src="static/js/jquery.min.js" type="text/javascript"></script>
<script src="static/js/showImage.js" type="text/javascript"></script>
<script src="static/js/newPatientValidation.js" type="text/javascript"></script>
<link href="static/css/ss.css" rel="stylesheet" type="text/css">

     
</head>
<body id="bodyid">
<%
//hadaling back -----
response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");


if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}

%>





	<form action="patientAdd" method="post" enctype="multipart/form-data">
		 <h1>Patient Account</h1>
		<label >Upload Image </label> <br>
		   <img id="blah" src="#" alt="your image" /> 
           <input type="file" name="file" onchange="readURL(this);" /><br>
		 				
		 <h3>Basic Info</h3>
		 <label >First Name </label>
            <input name="txtFname" type="text" id="txtFname"  placeholder="First Name" /><br>
         <label >Last Name </label>
            <input name="txtLname" type="text" id="txtLname"  placeholder="Last Name" /><br>
         <label >NIC </label>
            <input name="txtNic" type="text" id="txtNic"  placeholder="NIC" /><br>
         <label >Email </label>
            <input name="txtEmail" type="email" id="txtEmail"  placeholder="Email" /><br>
</div></div>

         <h3>Personal Info</h3>
         <label >Gender </label>
            <select name="gender" id="gender" >
				<option >-Select Gender-</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Others">Others</option>

			</select><br>

	     <label>Birth Date</label>
	     <input name="dob" type="date"  id="dob" /><br>

		<label>Age</label>
		<input name="txtAge" type="text" readonly="readonly" id="txtAge" /><br>

		<label>Occupation</label>
		<input name="txtJob" type="text"  id="txtJob" /><br>

		<label >Blood Group </label>
		<select name="bloodGroup" id="bloodGroup">
		<option >-Blood Group-</option>
		<option value="O Positive">O Positive</option>
		<option value="O Negative">O Negative</option>
		<option value="A Positive">A Positive</option>
		<option value="A Negative">A Negative</option>
		<option value="B Positive">B Positive</option>
		<option value="B Negative">B Negative</option>
		<option value="AB Positive">AB Positive</option>
		<option value="AB Negative">AB Negative</option>

	</select><br>

	   <label>Marital Status</label>
	   	<select name="status" id="status">
			<option >-Select Marital Status-</option>
			<option value="Single">Single</option>
			<option value="Married">Married</option>
			<option value="Divorced">Divorced</option>
			<option value="Widowed">Widowed</option>

	    </select>


	 <h3>Contact Details</h3>
	 	<label >Home Address </label><div class="styled-input">
            <textarea name="homeAdd" rows="2" cols="20" id="homeAdd" ></textarea><br>
		
    <label >Contact Number  </label>    
	<input name="number" type="text" id="number" /><br>


	<button type="submit" onclick="newPatientValidation()" name="btnSubmit" id="btnSubmit" value="save">Save</button>
	</form>
	<form action="RegisterPatient" method="get">
	 <button type="submit" name="btnSubmit" id="btnSubmit" value="cancle">Cancle</button>
	
	</form>

	

</body>
</html>