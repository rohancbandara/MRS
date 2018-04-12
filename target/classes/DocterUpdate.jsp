<%@page import="com.rcb.model.Docter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcb.service.DocterService"%>
<%@page import="com.rcb.model.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Doctor Details</title>
<script src="static/js/jquery.min.js" type="text/javascript"></script>
<script src="static/js/showImage.js" type="text/javascript"></script>
</head>
<body>
<% if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}

%>
<h3>Welcome :${username }        <a href="login">logout</a></h3>
		


		 <form action="docterUpdate" method="post" enctype="multipart/form-data">
		 <%
		
		DocterService dc = new DocterService();
		 
		
		 ArrayList<Docter> doctersList = dc.getSelectDocterById(String.valueOf(session.getAttribute("dID")));
		 for (int i = 0; i < doctersList.size(); i++) {

				System.out.println(doctersList.get(i).getD_FName());
		
		%>
		 <label >Change Picture </label> <br>
		   <img id="blah" src="<%=doctersList.get(i).getImg_path().toString() %>"  alt="your image" width="150px" height="100px"/> 
           <input type="file" name="file" onchange="readURL(this);" /><br>
		 <h3>Basic Info</h3>
		     <input name="txtd_id" type="text" id="txtd_id"  readonly="readonly" value="<%=doctersList.get(i).getD_id()%>"/><br>
		
		 	<label >Email </label>
            <input name="txtEmail" type="text" id="txtEmail"  placeholder="Email" readonly="readonly" value="<%=doctersList.get(i).getD_email()%>"/><br>
		 <label >First Name </label>
            <input name="txtFname" type="text" id="txtFname"  placeholder="First Name" value="<%=doctersList.get(i).getD_FName()%>" /><br>
         <label >Last Name </label>
            <input name="txtLname" type="text" id="txtLname"  placeholder="Last Name" value="<%=doctersList.get(i).getD_LName()%>"/><br>
         <label>Birth Date</label>
	     <input name="dob" type="date"  id="dob"  value="<%=doctersList.get(i).getD_dob()%>"/><br>
		<label>Speclizetion</label>
		<input name="txtSp" type="text" readonly="readonly" id="txtSp" value="<%=doctersList.get(i).getD_specileName()%>"/><br>
		
		<h3>Contact Details</h3>
	 	
	 	<label >Contact Number  </label>    
		<input name="number" type="text" id="number" value="<%=doctersList.get(i).getTel()%>"><br>
		
		<button type="submit" name="btnSubmit" id="btnSubmit" value="update">Update</button>
		 
		 </form>
		 <form action="docterUpdate" method="get">
	 		<button type="submit" name="btnSubmit" id="btnSubmit" value="cancle">Cancle</button>
	
			</form>
		 
		 
<% }%>
</body>
</html>