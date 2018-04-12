<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="static/js/chatScript.js"></script>
<%
//hadaling back -----
response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");


if(session.getAttribute("username")==null){
	response.sendRedirect("index.jsp");
}

%>

<title>Chating</title>
</head>
<body>



        <table>
            <tr>
                <td colspan="2">
                    <input type="text" id="username" placeholder="Username"/>
                    <button type="button" onclick="connect();" >Connect</button>
                    
                </td>
            </tr>
           
            <tr>
                <td>
                    <textarea readonly="true" rows="10" cols="80" id="log"></textarea>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" size="15" id="to" placeholder="To"/>
                    <input type="text" size="51" id="msg" placeholder="Message"/>
                    <button type="button" onclick="send();" >Send</button>
                </td>
            </tr>
        </table>
    

    
</body>
</html>