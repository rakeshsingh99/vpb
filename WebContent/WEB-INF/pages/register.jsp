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
   <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/indexstyle.css">
  <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
</head>
<body>
<center>
<table class="textStyle" width="1167px" style="margin-top:-5px">
<tr bgcolor="#404040">
<td align="center" colspan="3"><font color="white" size="5"><b>Register New Customer</b></font>
</td>
</tr>
</table>
<fieldset class="row6" >
<form action="register.vpb" method="post">
<table class="textStyle">
<tr>
<td align="center" colspan="3">
<font size="4" color="red"><b><nitesh:error property="registrationError"/></b></font>
</td></tr>

<core:if test="${REGISTERED ne 'OK'}">

<tr><td><font size="3"><b> Shop Name </b></font></td>
<td>
<input type="text" name="shname" id="shname" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="shname"/> </font></b>
</td></tr>

<tr><td><font size="3"><b> Email </b></font></td>
<td>
<input type="text" name="email" id="email" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="email"/> </font></b>
</td></tr>

<tr><td><font size="3"><b> Street </b></font></td>
<td>
<input type="text" name="street" id="street" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="street"/> </font></b>
</td></tr>

<tr><td><font size="3"><b> City </b></font></td>
<td>
<input type="text" name="city" id="city" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="city"/> </font></b>
</td></tr>

<tr><td><font size="3"><b> Phone </b></font></td>
<td>
<input type="text" name="phone" id="phone" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="phone"/> </font></b>
</td></tr>


<tr><td><font size="3"><b> Username </b></font></td>
<td>
<input type="text" name="uname" id="uname" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="uname"/> </font></b>
</td></tr>

<tr><td><font size="3"><b> Password </b></font></td>
<td>
<input type="password" name="pass" id="pass" 
        style="color:black;  background-color:#b4e0d2; font-size:25 "/>
</td>
<td>
<b><font color="red" size="3"><nitesh:error property="pass"/> </font></b>
</td></tr>

<tr>
<td  colspan="3" align="center" >
<br>
<input type="submit" name="Login" id="Login" value="Register Me" class="btn blue">
</td>
</tr>
</core:if>

<tr>
<td  align="center" colspan="3" >
<b><font size="3"> Login </font> &nbsp;<a href="index.jsp" onmouseover="this.style.backgroundColor='white';this.style.color='blue'"
   onmouseout="this.style.backgroundColor='transparent';this.style.color='blue'">Click Here</a></b>
</td>
</tr>

<tr>
<td  align="center" colspan="3" >
<b><font size="3"> Forget Password </font> &nbsp;<a href="forgetPasswordDef.jsp" onmouseover="this.style.backgroundColor='white';this.style.color='blue'"
   onmouseout="this.style.backgroundColor='transparent';this.style.color='blue'">Click Here</a></b>
</td>
</tr>

</table>
</form>
</fieldset>
</center>
</body>
</html>