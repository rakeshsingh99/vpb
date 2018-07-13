<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css1/foundation.css" />
 <link rel="stylesheet" type="text/css" href="css1/jquery.mobile-1.4.2.css" />
  <link rel="stylesheet" type="text/css" href="css1/style.css" />
  
    <link rel="stylesheet" type="text/css" href="css1/style1.css" />	
	<link rel="stylesheet" type="text/css" href="css1/fonts.googleapis.css" />
	

  
<script src="js/jquery.js"></script>
 <link rel="stylesheet" type="text/css" href="css1/metro.css" />
 
<script>
</script>
</head>
<body>


 <div class="heal">
  <font style="float:right; margin: 2px 10px 0 0;" size="1" color="yellow" ><b> Welcome! &nbsp;<font color="white"> ${USER_TO.shopName} </font><core:if test="${USER_TO.role eq 'Admin'}">&nbsp;Admin </core:if><core:if test="${USER_TO.role eq 'User'}">&nbsp;User </core:if></b></font>
<img style=" margin: 70px 0 0 8px;" src="img/viddarthi.png"></img> 	 
  </div>
</body>
</html>