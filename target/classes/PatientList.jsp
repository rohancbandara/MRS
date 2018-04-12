<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.rcb.dbconnection.DbConnection"%>
<%@page import="com.rcb.model.Patient"%>
<html>
<head>
<script src="static/js/jquery.min.js" type="text/javascript"></script>
<!------ Include the above in your HEAD tag ---------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="static/js/showtableValue.js" type="text/javascript"></script>

	<title>Patient list</title>
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

<h2 align="center">All Patients</h2>


	<form action="PatientAdd.jsp" method="get">
		<label>Patient:</label>
		<input type="text" name="patient" id="patient" onkeyup="filter()">
		<input type="submit" name="btnSearch" id="btnAddNewPatient" value="Add New Patient" >

		<table border="1" id="mytable" class="table table-bordred table-striped">
				<th scope="col">PID</th scope="col">Picture<th></th><th scope="col">Patient Name</th><th scope="col">NIC</th><th scope="col">Email</th><th scope="col">Gender</th><th scope="col">Date of Birth</th><th scope="col">Blood Group</th>
				<th scope="col">Marital</th><th scope="col">Address</th><th scope="col">Contact</th><th scope="col">Status</th><th  scope="col">Create Date</th><th colspan="2" scope="col">Action</th>
			
			<%
	Patient patient=new Patient();
	DbConnection db=new DbConnection();
	String p_fname,p_lname,p_nic,p_email,p_gender,p_dob,p_blood_group,p_marital,p_haddress,p_tel,p_status,create_date,img_path;
	int id;
	try{
		String sql="SELECT * FROM tbl_patient";
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
			<tr id="tr">
				<td><%=id %></td>
				<td><img src="<%=img_path %>" width="250px" height="220px"></td>
				<td id="td"><%=p_fname %> <%=p_lname %></td>
				<td><%=p_nic %></td>
				<td><%=p_email %></td>
				<td><%=p_gender %></td>
				<td><%=p_dob %></td>
				<td><%=p_blood_group %></td>
				<td><%=p_marital %></td>
				<td><%=p_haddress %></td>
				<td><%=p_tel %></td>
				<td><%=p_status %></td>
				<td><%=create_date%></td>
				<td>
				<input TYPE="button" VALUE="EDIT" 
        			onclick="window.location.href='/RCB_MRS/setpid?id=<%=id %>'"> </td>
        			
        			
        			
        			
        		<td>
        		<input TYPE="button" VALUE="DELETE" 
        			onclick="window.location.href='/RCB_MRS/patientDelete?id=<%=id %>'"> </td>	
				
				
				
		    </tr>
			<%
		}
	}
	catch(Exception e){
		e.printStackTrace();
		}

%>	
		</table>


	</form>

                            
</body>
</html>