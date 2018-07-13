<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.book.shop.to.*" %>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>
<style type="text/css">
	.button-my {
	    width:219px;
		padding: 5px 10px;
		background: #26A8CF;
		font-family: Arial, sans-serif;
		color: #ffffff;
		text-align: center;
		display: block;
		cursor: pointer
		}
	.button-my + .button-my{
	  margin-top: 5px;
	}
	
	form.first + form.second{
	  margin-top: 5px;
	}	
		
	.button-my:hover, 
	.button-my:focus, 
	.button-my:active,
	.button-my.active,
	.button-my[disabled],
	.button-my.disabled {  
	  background-color: #0362fd !important;
	  color: #fff !important;
	}
	
		
	.button-my {
		border: 0px solid #4cadfc;
		border-radius: 4px;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px
		}
	
</style>

<script type="text/javascript">
	function change()
	{
	var customer = document.getElementById('selc').value;
	document.getElementById('textvalue').value=customer;
	
	}

</script>



 <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
</head>
<body>
<div class="loginback">
<div>
<h3 class="page-title">
							Suppliers List <small>It shows the list of Suppliers we deals with</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="#">Suppliers List</a>
							</li>
							<li style="float:right;">
								<a style="text-decoration: none;" href="registerSupplierDef.jsp" ><i style="color:green;" class="icon-plus"></i></a>
							</li>
						</ul>
</div>		
<div align="center">
<form action="supplierinfo.vpb">
<div style="   font-weight:normal; font-family: Segoe UI, Helvetica, Arial, sans-serif;" >Select Supplier</div>
<div style=" font-weight:normal; font-family: Segoe UI, Helvetica, Arial, sans-serif;">
<select name="ActionSelect" class="m-wrap" required="required" onChange="change()" id="selc" >
<option value="" >select</option>
<core:forEach var="sto" items="${SUPPLIER_FOUND }">
 <option value="${sto.supplierName}">${sto.supplierName}</option>	
 </core:forEach>
</select>
</div>
<br/>
<div style="width:219px; ">
    <input type="submit" class="button-my" value="Show Leadger" name="show" />
	<input type="submit" class="button-my" value="Add Payment" name="addcash"  />
	<input type="submit" class="button-my" value="Add Invoice" name="addbill"  />
</div>

</form>
<br/>
<br/>
<br/>
<br/>
<table>
<tr>
<td><font  style="font-weight:bold;" color="green">Total Purchase : </font></td>
<td align="right"><font  color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_BILL - TOTAL_RETURN }"/></font></td>
</tr>
<tr>
<td><font  style="font-weight:bold;" color="green">Total Paid :</font></td>
<td align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_PAID }"/></font></td>
</tr>
<tr>
<td><font  style="font-weight:bold;" color="green">Total Due :</font></td>
<td align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_DUE }"/></font></td>
</tr>
</table>
</div>
</div>

<script src="js1/jquery.backstretch.js" ></script> 
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script> 
</body>
</html>