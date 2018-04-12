<%@page import="java.sql.ResultSet"%>
<%@page import="com.rcb.dbconnection.DbConnection"%>
<%@page import="com.rcb.model.Docter"%>
<%@page import="com.rcb.service.DocterService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcb.service.PatientService"%>
<%@page import="com.rcb.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Update</title>
<script src="static/js/jquery.min.js" type="text/javascript"></script>
<script src="static/js/showImage.js" type="text/javascript"></script>
</head>
<body>
<%
//hadaling back -----
response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");


if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}





%>




<form action="updatePatient" method="post" enctype="multipart/form-data">
		 <h4>Patient Details</h4>
		 
		<%
	Patient patient=new Patient();
	DbConnection db=new DbConnection();
	String p_fname,p_lname,p_nic,p_email,p_gender,p_dob,p_blood_group,p_marital,p_haddress,p_tel,p_status,create_date,img_path;
	int id;
	try{
		String sql="SELECT * FROM tbl_patient WHERE p_id='"+session.getAttribute("pid")+"'";
		ResultSet rs=db.getData(sql);
		while(rs.next()){
			id=rs.getInt("p_id");
			p_fname=rs.getString("p_fname");
			p_lname=rs.getString("p_lname");
			p_nic=rs.getString("p_nic");
			p_email=rs.getString("p_email");
			p_gender=rs.getString("p_gender");
			p_dob=rs.getString("p_dob");
			p_blood_group=rs.getString("p_blood_group");
			p_marital=rs.getString("p_marital");
			p_haddress=rs.getString("p_haddress");
			p_tel=rs.getString("p_tel");
			p_status=rs.getString("p_status");
			create_date=rs.getString("create_date");
			img_path=rs.getString("img_path");
			
		
			%>
			
			<label >Change Picture </label> <br>
		   <img id="blah" src="<%=img_path %>"  alt="your image" width="150px" height="100px"/> 
           <input type="file" name="file" onchange="readURL(this);" /><br>
		 
		 <h3>Basic Info</h3>
		 <label >Patient Id </label>
            <input name="txtPid" type="text" id="txtPid"  readonly="readonly" value="<%=id %>"><br>
         
		 <label >First Name </label>
            <input name="txtFname" type="text" id="txtFname"  placeholder="First Name" value=<%=p_fname %>><br>

         <label >Last Name </label>
            <input name="txtLname" type="text" id="txtLname"  placeholder="Last Name" value=<%=p_lname %>><br>
         <label >NIC </label>
            <input name="txtNic" type="text" id="txtNic"  placeholder="NIC" value=<%=p_nic %> ><br>
         <label >Email </label>
            <input name="txtEmail" type="text" id="txtEmail"  placeholder="Email" value=<%=p_email %> readonly="readonly"/><br>


         <h3>Personal Info</h3>
         <label >Gender </label>
            <select name="gender" id="gender" >
            	<option><%=p_gender %></option>
				<option >-Select Gender-</option>
				<option value="Male">Male</option>
				<option value="Female">Female</option>
				<option value="Others">Others</option>

			</select><br>

	     <label>Birth Date</label>
	     <input name="dob" type="date"  id="dob" value=<%=p_dob %> readonly="readonly"/><br>

		<label>Age</label>
		<input name="txtAge" type="text" readonly="readonly" id="txtAge" /><br>

		

		<label >Blood Group </label>
		<select name="bloodGroup" id="bloodGroup">
		<option ><%=p_blood_group %></option>
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
			<option ><%=p_marital %></option>
			<option value="Single">Single</option>
			<option value="Married">Married</option>
			<option value="Divorced">Divorced</option>
			<option value="Widowed">Widowed</option>

	    </select>


	 <h3>Contact Details</h3>
	 	<label >Home Address </label>
            <textarea name="homeAdd" rows="2" cols="20" id="homeAdd" ><%=p_haddress %></textarea><br>

    <label >Contact Number  </label>    
	<input name="number" type="text" id="number" value="<%=p_tel %>"><br>


	<button type="submit" name="btnSubmit" id="btnSubmit" value="update">Update</button>
	</form>
	<form action="updatePatient" method="get">
	 <button type="submit" name="btnSubmit" id="btnSubmit" value="cancle">Cancle</button>
	
	</form>
	
	            			<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
		}

%>
</body>
</html>