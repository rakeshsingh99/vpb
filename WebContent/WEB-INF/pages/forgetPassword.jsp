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
  href="<%=request.getContextPath()%>/css/main.css">
</head>
<body>
<center>
<form action="forgetPassword.vpb" method="post">
<table class="textStyle">
<tr>
<td align="center" colspan="3">
<font size="7"><b> Retrieve Your Password </b></font>
</td></tr>
<tr>
<td align="center" colspan="3">
<font size="4" color="red"><b><nitesh:error property="forgetPasswordError"/> </b></font>
</td></tr>
<tr><td><br/></td></tr>

<core:if test="${PASSWORD eq null}">

<tr>
<td align="center" height="">
<font size="5"><b> Username </b></font>
</td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="uname"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="uname"/> </b></font>
</td></tr>

<tr>
<td colspan="3"><br/></td></tr>
<tr>
<td align="center"><font size="5"><b> Email </b></font></td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="email"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="email"/> </b></font>
</td></tr>

<tr>
<td  align="center" colspan="3" >
<br/>
<input type="submit" value="Show Password"
        style="color:white;  background-color:marron; font-size:35 "/>
</td>
</tr>

<tr>
<td  align="center" colspan="3" >
<b><font size="5">New User</font> &nbsp;<a href="registerDef.jsp">
<font size="5"> Signup Here </font></a></b>
</td>
</tr>
</core:if>

<core:if test="${PASSWORD ne null}">

<tr>
<td align="center" colspan="3">
<b><font color="green" size="5">Your Password is </font><font color="red" size="6"> ${PASSWORD } </font></b>
</td>
</tr>
</core:if>
<tr>
<td  align="center" colspan="3" >
<b><font size="5">Login</font> &nbsp;<a href="index.jsp">
<font size="5"> Click Here </font></a></b>
</td>
</tr>
</table>
</form>
</center>
</body>
</html>