<!doctype html>
<%@page import="com.rcb.model.User"%>
<%@page import="com.rcb.service.UserService"%>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="static/css/styles.css">
   <script src="static/js/jquery.min.js" type="text/javascript"></script>
   <script src="static/js/loadPage.js" type="text/javascript"></script>
   
   <script src="static/css/styles.css"></script>
   <title>Home</title>
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

UserService us=new UserService();
User user=new User();
user.setUser_name((String)session.getAttribute("username"));
String imgpath=us.getimgPathById(user);


%>

<div id='cssmenu'>
<ul>
   
   <li><a href="DashBoard.jsp"><span>Dashboard</span></a></li>
   <li class='active has-sub'><a href='#'><span>Patient</span></a>
      <ul>
         <li class='has-sub'><a href='#' onclick="load_PatientAdd()"><span>Add Patient</span></a>
            
         </li>
         <li class='has-sub'><a href='#' onclick="load_PatientList()"><span>All Patients</span></a>
            
         </li>
      </ul>
   </li>
   <li><a href='#' onclick=""><span>Reports</span></a></li>
   <li><a href='#' onclick=""><span>Medicle History</span></a></li>
   
    <li class='active has-sub'><a href='#'><span>Doctor</span></a>
      <ul>
         <li class='has-sub'><a href='#' onclick="load_DoctorAdd()"><span>Add Doctor</span></a>
            
         </li>
         <li class='has-sub'><a href='#' onclick="load_DoctorList()"><span>All Doctors</span></a>
            
         </li>
      </ul>
   </li>
   
   
   <li class='active has-sub'><a href='#'><span>Appointment</span></a>
      <ul>
         <li class='has-sub'><a href='#' onclick="load_AppoinmentCreate()"><span>Create Appointment Schedule</span></a>
            
         </li>
         <li class='has-sub'><a href='#' onclick="load_AppoinmentList()"><span>Appointments</span></a>
            
         </li>
      </ul>
   </li>
 
  	<li class='last'><a href="Setting.jsp"><span>Setting</span></a></li>
  
  
    <li><a href='#' onclick="load_Chat()"><span>Chating</span></a></li>
   
    <li class='active has-sub' id="log"><a href='#'><span><font color="red" >${username }</font></span></a>
      <ul>
      		<li class='has-sub'><a href="#"><span><img src="<%=imgpath%>" height="100px" width="137px"></span></a>
            
        	</li>
        	<li class='has-sub'><a href="login"><span>logout</span></a>
            
            </li>
         
      </ul>
   </li>
   
   
  
  
</ul>
</div>


<div id="divId"></div>

</body>
<html>
