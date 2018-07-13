<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.footer a{
	color: #fff;
}
.footer a:hover, 
.footer a:focus, 
.footer a:active,
.footer a.active,
.footer a[disabled],
.footer a.disabled { 
  color: #0362fd !important;
}


</style>
</head>
<body>
<div class='footer'>
     <% int currentYear = new Date().getYear() + 1900; %>
	      
	     <div class="go-top">Copyright © <%=currentYear %> <strong>Viddharthi Pustak Bhandar</strong></div></div>


</body>
</html>