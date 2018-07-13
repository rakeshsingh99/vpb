<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page import="com.book.shop.to.*" %>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</head>

<style>
 /** select form **/
select 
{
	display: block;
	position: relative;
	height: 2.0em;
	padding: 0px;
	width: 100%;
	font-size: 0.875em;
	margin-bottom: 0.5em;
	direction: ltr;
	-moz-box-sizing: border-box;
	font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
	line-height: 2.25em;
	background: linear-gradient(to bottom, white 0%, rgb(243, 243, 243) 100%) repeat scroll 0% 0% transparent;
	border: 1px solid rgb(204, 204, 204);
}
</style>
<body>
<div class="loginback">
<div>
<h3 class="page-title">
							Register Supplier <small>Here we can register the details of new supplier we want to deal with</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="listofsuppliers.vpb">Supplier List</a>
								<span class="icon-angle-right"></span>
							</li>
							<li>
							    <i class="icon-plus"></i>
								<a href="#">RegisterSupplier</a>
							</li>
						</ul>
</div>	
<div class="tablecontent" align="center">
<table width="100%"  class="textStyle">
<tr bgcolor="#404040">
	<td  align="center" colspan="6">
		<font style="float:center; font-size:120%;" color="white"><b> Register New Supplier </b></font>
		<a style="float:right; font-size:120%;" class="btn blue" href="listofsuppliers.vpb">Back</a>
		</td>
</tr>
</table>

<form action="registerSupplier.vpb" method="post">
<table class="textStyle">
<tr>
<td align="center" colspan="3">
<font size="4" color="green"><b><nitesh:error property="registrationError"/></b></font>
</td></tr>

<core:if test="${REGISTERED ne 'OK'}">

<tr>
	<td>
		<label style=" for="BX_publication">Supplier Name</label>	
	</td>
	<td>
		<input type="text"  required="required" name="supplierName">
    </td>
	<td>
		<b><font color="red"><nitesh:error property="supplierName"/> </font></b>
    </td>
</tr>

<tr>
	<td>
		<label style=" for="BX_publication">Email</label>	
	</td>
	<td>
		<input type="text"  required="required" name="email">
    </td>
	<td>
		<b><font color="red"><nitesh:error property="email"/> </font></b>
    </td>
</tr>

<tr>
	<td>
		<label style=" for="BX_publication">Street</label>	
	</td>
	<td>
		<input type="text"  required="required" name="street">
    </td>
	<td>
		<b><font color="red"><nitesh:error property="street"/> </font></b>
    </td>
</tr>


<tr>
	<td>
		<label style=" for="BX_publication">City</label>	
	</td>
	<td>
		<input type="text"  required="required" name="city">
    </td>
	<td>
		<b><font color="red"><nitesh:error property="city"/> </font></b>
    </td>
</tr>

<tr>
	<td>
		<label style=" for="BX_publication">Phone</label>	
	</td>
	<td>
		<input type="text"  required="required" name="phone">
    </td>
	<td>
		<b><font color="red"><nitesh:error property="phone"/> </font></b>
    </td>
</tr>

<tr>
	<td  colspan="3" align="center" >
	<br>
		<input type="submit" name="Login" id="Login" value="Register" class="btn blue">
	</td>
</tr>
</core:if>
</table>
</form>
</div>
</div>
</body>
</html>