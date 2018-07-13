<%@page import="com.book.shop.to.UserTo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta name="viewport" content="width=device-width" />

<style type="text/css">
html { font-size: 62.5%; }
body { font-size: 0.9987em;}

@media (max-width: 300px) {
    html { font-size: 70%; }
}

@media (min-width: 500px) {
    html { font-size: 70%; }
}

@media (min-width: 700px) {
    html { font-size: 80%; }
}

@media (min-width: 1200px) {
    html { font-size: 90%; }
}
</style>
</head>
<body>
<center>
 
<div class="welcome">
<table align="center" width="100%" height="100%" cellpadding="0" cellspacing="1" style="border:none;">
<tr  bgcolor="#444444">
	<td style="width:200px; background-color: #4d90fe;"></td>
	<td class="btn blue">
	   <a   href="userHomeDef.jsp"><font  color="white" >HOME</font></a>
	</td>
	<core:if test="${USER_TO.role eq 'Admin'}">
	<td class="btn blue">
	   <a href="addBookDef.jsp"><font  color="white" >ADD BOOK</font></a>
	</td>
	</core:if>
	<td class="btn blue">
	   <a href="searchBookDef.jsp"><font  color="white" >SEARCH</font></a>
	</td>
	<core:if test="${USER_TO.role eq 'User'}">
	<td class="btn blue">
	   <a href="userorderstatus.vpb"><font  color="white" >ORDERS</font></a>
	</td>
	</core:if>
	<core:if test="${USER_TO.role eq 'Admin'}">
	<td class="btn blue">
	   <a href="allorders.vpb"><font  color="white" >ALL ORDERS</font></a>
	</td>
	</core:if>
	<td class="btn blue">
	   <a href="detailsDef.jsp"><font  color="white" >DETAILS</font></a>
	</td>
	<td class="btn blue">
	   <a href="changePasswordDef.jsp"><font  color="white" >CHANGE PASSWORD</font></a>
	</td>
	<td class="btn blue">
	   <a href="logout.vpb"><font  color="white" >LOGOUT</font></a>
	</td>
	<td style="width:200px; background-color: #4d90fe;"></td>
</tr>
</table>
</div>
</center>
</body>
</html>