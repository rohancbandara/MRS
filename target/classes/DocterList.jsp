<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcb.service.DocterService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.rcb.dbconnection.DbConnection"%>
<%@page import="com.rcb.model.Docter"%>
<html>
<head>
<!------ Include the above in your HEAD tag ---------->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<script src="static/js/showtableValue.js" type="text/javascript"></script>
	<title>Doctor List</title>
</head>
<body>
<% if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}

%>




	<h2 align="center">All Doctors</h2>
	<form action="DocterAdd.jsp" method="get">
		<label>Patient:</label>
		<input type="text" name="patient" id="patient" onkeyup="filter()">
		<input type="submit" name="btnSearch" id="btnAddNewPatient" value="Add New Docter" >

	
		
		<!-- Docter Lists... -->
		<table border="1" id="mytable" class="table table-bordred table-striped">
				<th scope="col">DID</th><th scope="col">Picture</th><th scope="col">Docter Name</th><th scope="col">Date of Birth</th><th scope="col">Email</th><th scope="col">Special</th><th scope="col">Created Date</th><th scope="col">Edited Date</th><th colspan="2" scope="col">Action</th>
				
		<%
		
		DocterService dc = new DocterService();
		
		ArrayList<Docter> doctersList = dc.getAllDocters();

		for (int i = 0; i < doctersList.size(); i++) {
			System.out.println(doctersList.get(i));
		%>
		<tr id="tr">
		
		<td><%=doctersList.get(i).getD_id()%></td>
		
		<td><img src="<%=doctersList.get(i).getImg_path().toString() %>" width="250px" height="220px"></td>
		
		<td id="td"><%=doctersList.get(i).getD_FName() %> <%=doctersList.get(i).getD_LName() %></td>
		
		<td><%=doctersList.get(i).getD_dob() %></td>
		<td><%=doctersList.get(i).getD_email() %></td>
		<td><%=doctersList.get(i).getD_specileName() %></td>
		<td><%=doctersList.get(i).getCreate_date() %></td>
		<td><%=doctersList.get(i).getEdit_date() %></td>
		
					
       		
        		
		
		
		<td>
			<input TYPE="button" VALUE="EDIT" 
        			onclick="window.location.href='/RCB_MRS//getDid?id=<%=doctersList.get(i).getD_id() %>'"> </td>
        
		</td>
		<td>
			 <input TYPE="button" VALUE="DELETE" 
        			onclick="window.location.href='/RCB_MRS//docterDelete?id=<%=doctersList.get(i).getD_id() %>'"> </td>
        	
		</td>
		
	
	</tr><% }%>
		
        
		</table>
			


	</form>


</body>
</html>