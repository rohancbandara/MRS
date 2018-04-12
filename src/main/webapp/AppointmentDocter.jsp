<!DOCTYPE html>
<%@page import="com.rcb.model.Patient"%>
<%@page import="com.rcb.service.PatientService"%>
<%@page import="com.rcb.model.Docter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.rcb.service.DocterService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.rcb.dbconnection.DbConnection"%>

<html><head>
<title>Appointment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<meta name="keywords" content="Remedial Appointment Form Bootstrap Responsive Templates, Iphone Compatible Templates, Smartphone Compatible Templates, Ipad Compatible Templates, Flat Responsive Templates">
<link href="static/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
<link href="static/css/jquery-ui.css" rel="stylesheet" type="text/css" media="all">
<link href="static/css/styles.css" rel="stylesheet" type="text/css">




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

 <h1>Add Appointment</h1>
 <form action="appoinmentAdd" method="get">
	<div class="container">
			<div class="w3-agileits-team-title"> 
				
				
			
					
					<div class=" resp-tabs-container">
					<div class="tab1">
						<div class="team-img-w3-agile">
						<img src="static/images/tm11.png" alt=" " class="img-responsive">"img-responsive"/>)) %>" alt=" " class="img-responsive"/>
						
						<h4>Dr.<%=session.getAttribute("dFullName")%></h4>
						<h4><%=session.getAttribute("specle")%></h4>
							<span>Date <%=session.getAttribute("date")%></span>
							<p>Time <%=session.getAttribute("comeTime")%> </p>
							<p><%=session.getAttribute("aId")%></p>
						</div>
						<div class=" team-Info-agileits">
						<div class=" register-form">
					
						<div class="fields-grid">
							
								<select id="patient" name="patient">
	<%
		PatientService pS=new PatientService();
		ArrayList<Patient> patientList=pS.allPatient();
		for(int i=0;i<patientList.size();i++){
			%><option value="<%=patientList.get(i).getP_id()%>"><%=patientList.get(i).getP_fname() %> <%=patientList.get(i).getP_lname() %></option><% 	
		}
	%>
	
							</select>
								<input type="button" name="btnSubmit" id="btnSubmit" value="Add New Patient" onclick="window.location.href='/RCB_MRS//PatientAdd.jsp'"/>
								</br>
								</br>
							
								
						</div>
								
								
								<div class="styled-input">
							
									<textarea name="dsp" placeholder="Enter Somethings.."></textarea>
								</div>
								<input type="submit" name="btnSubmit" id="btnSubmit" value="Book Appointment">
							
						</div>
						
					</form>
						
					
												
						
						<div class="clear"> </div>
					
					
					<div class="tab2">
					
						<div class=" team-Info-agileits">
													
						</div>
						<div class="clear"> </div>
					</div>
					
					
					
					<div class="clear"> </div>
					
		
		<div class="copyright">
		
		
			<p>All rights reserved | Design by RCB_MRS </p>
		
		
	</div>
	
 </div>	
  </div>	
   </div>	
    </div>	
	<!--tabs-->	
<script src="js/jquery.min.js"></script>
<script src="js/easy-responsive-tabs.js"></script>
<script>
$(document).ready(function () {
$('#horizontalTab').easyResponsiveTabs({
type: 'default', //Types: default, vertical, accordion           
width: 'auto', //auto or any width like 600px
fit: true,   // 100% fit in a container
closed: 'accordion', // Start closed if in accordion view
activate: function(event) { // Callback function if tab is switched
var $tab = $(this);
var $info = $('#tabInfo');
var $name = $('span', $info);
$name.text($tab.text());
$info.show();
}
});
$('#verticalTab').easyResponsiveTabs({
type: 'vertical',
width: 'auto',
fit: true
});
});
</script>
<!--//tabs-->
<!-- Calendar -->
<script src="js/jquery-ui.js"></script>
	<script>
		$(function() {
		$( "#datepicker,#datepicker1" ).datepicker();
		});
	</script>
<!-- //Calendar -->

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>