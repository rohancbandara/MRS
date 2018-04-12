<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.rcb.service.AppoinmentService"%>
<%@page import="com.rcb.model.Table"%>
<%@page import="com.rcb.model.Appinment"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="com.rcb.dbconnection.DbConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Appointment List</title>

<script src="static/js/jquery.min.js" type="text/javascript"></script>
<script src="static/js/showtableValue.js" type="text/javascript"></script>
<link href="static/css/ss.css" rel="stylesheet" type="text/css">



</head>
<body color=#000 id="bodyid">
<%
//hadaling back -----
response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");


if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}

%>



<h3><center>Add Appointments Details</center></h3>
<br>
<leble>Check Appointments</leble>
<input type="text" name="app" id="app" onkeyup="filterApp()">


		
<div class=" resp-tabs-container">
<table>
<tr>
		<%
		
		AppoinmentService cT=new AppoinmentService();
		
		ArrayList<Table> tableList = cT.getAllTable();

		for (int i = 0; i < tableList.size(); i++) {
			
		%>
		<td style="vertical-align: unset;">
			
			
			<table class="table table-striped border=1" id="apTable">
				<tr id="tr1">
					<td colspan="3"><img src="<%=tableList.get(i).getdImg_path().toString() %>" width="250px" height="220px"></img></td>
				</tr >
				
				<tr id="tr1">
					<td colspan="3" id="td"><b>Dr.<%=tableList.get(i).getD_fname().toUpperCase()%> <%=tableList.get(i).getD_lname().toUpperCase() %></b></td>
				</tr>
				<tr id="tr1">
					<td colspan="3" id="td">Special in :<b><%=tableList.get(i).getSp_name() %></b></td>
				</tr>
				<tr id="tr1">
					<td colspan="3" id="td">Comming on : <b><%=tableList.get(i).getDate()%></b> </td>
				</tr>
		 		<tr id="tr1">
					<td colspan="3" id="td">From <b><%=tableList.get(i).getFrom() %>:00 HH</b> To <b><%=tableList.get(i).getTo()%>:00 HH</b></b></b> </td>
				</tr>
		
				<tr id="tr1">
					<td colspan="3"><hr /></td>
				</tr>
		
		
			    <tr id="tr1">
					<td><b>Time</b></td>
					<td><b>Patient</b></td>
					<td><b>Description</b></td>
				</tr>
				
				<%
				ArrayList<Appinment> appoinmentList=cT.getAllAppoinment(tableList.get(i).getTbl_id());
				for (int y = 0; y < appoinmentList.size(); y++) {
				%>
				
				<tr id="tr1">
						
						<td><%=appoinmentList.get(y).getIntavel() %></td>
						<td><a href="/RCB_MRS//getPid?id=<%=appoinmentList.get(y).getId() %>&dFullname=<%=tableList.get(i).getD_fname()%> <%=tableList.get(i).getD_lname() %>&date=<%=tableList.get(i).getDate()%>&time=<%=appoinmentList.get(y).getIntavel() %>&specle=<%=tableList.get(i).getSp_name()%>"/><%=appoinmentList.get(y).getP_fname()%> <%=appoinmentList.get(y).getP_lname() %></a></td>
						<td><%=appoinmentList.get(y).getDsp() %></td>
				</tr>
				
				
				<% 
				}
				%>
		
		</table>	
		</td>
		
		<% }%>

</tr>
		</table>

</div>



</body>
</html>