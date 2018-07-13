<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/indexstyle.css">
</head>
<body>
<form action="changePassword.vpb" method="post">
<center>
<table class="textStyle" width="1163px" cellspacing="0" style="margin-top:-36px;">
<tr bgcolor="#404040">
<td align="center" >
<font color="white" size="5"><b> Change User Password </b></font>
</td></tr>
</table>
<table>
<tr bgcolor="lightyellow">
<td align="center" colspan="3">
<font size="4" color="red"><b><nitesh:error property="changePasswordError"/> </b></font>
</td></tr>

<core:if test="${CHANGED_PASSWORD ne 'OK'}">

<tr>
<td align="center" height="0">
<br/>
<font size="3"><b> Current Password </b></font>
</td>
<td>
<br/>
<input type="password" size="35"
        style="color:black;  background-color:#ffffff; font-size:20" name="currpass"/>
</td>
<td>
<font size="3" color="red"><b><nitesh:error property="currpass"/> </b></font>
</td></tr>

<tr>
<td>
<font size="3"><b> New Password </b></font></td>
<td>
<input type="password" size="35"
        style="color:black;  background-color:#ffffff; font-size:20" name="newpass"/>
</td>
<td>
<font size="3" color="red"><b><nitesh:error property="newpass"/> </b></font>
</td></tr>

<tr>
<td align="center">
<font size="3"><b> Confirm Password </b></font>
</td>
<td>
<input type="password" size="35"
        style="color:black;  background-color:#ffffff; font-size:20" name="confpass"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="confpass"/> </b></font>
</td></tr>

<tr>
<td  align="center" colspan="3" >
<br/>
<input type="submit" value="Change Password"
        style=" color:white; background-color:#404040; cursor:pointer;  font-size:17 "/>
</td>
</tr>
</core:if>
</table>
</center>
</form>
</body>
</html>