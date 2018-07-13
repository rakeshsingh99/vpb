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
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
	
	<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
<script type="text/javascript">
function change()
{
var customer = document.getElementById('selc').value;
document.getElementById('textvalue').value=customer;

}


function validateSelectCustomerField()
{

	var selectCustomer=document.getElementById('selc').value;
    if(selectCustomer=="")
    {
    	var div = document.getElementById('errordiv');
    	div.innerHTML = div.innerHTML + '<font color="red">Please Select the Customer to Start Billing</font>';
        document.frm.ActionSelect.focus();
        return false;
    }else{
    	var shopName = document.getElementById("shopName");
    	shopName.value=selectCustomer;
    }
}


/* $(document).ready(function () {

$("#validatebutton").click(function () {
	var selectCustomer=document.getElementById('selc').value;
	alert("We are inside the method and value is :"+selectCustomer);
    if (selectCustomer=='select'){
    	
    	$("#errordiv").append('<label style="BX_publication">Please Select the Customer</label>'); 
    	return false;
    }
        
});
}); */


</script>
    
</head>
<body>
<div class="loginback">
<div>
<h3 class="page-title" >
							Customers List <small >here we can select the Customer to perform various operation</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="#">Customers List</a>
							</li>
							<li style="float:right;">
								<a style="text-decoration: none;" href="registerCustomerDef.jsp" ><i style="color:green;" class="icon-plus"></i></a>
							</li>
						</ul>
					
</div>		
<div align="center">
<form name="frm" class="first" action="customerinfo.vpb"  method="post">
<div style=" font-weight:normal; font-family: Segoe UI, Helvetica, Arial, sans-serif;" >Select Customer</div>
<div style=" font-weight:normal; font-family: Segoe UI, Helvetica, Arial, sans-serif;">
<select name="ActionSelect" class="m-wrap" required="required" onChange="change()" id="selc" >
<option value="" >select</option>
<core:forEach var="uto" items="${CUSTOMER_FOUND }">
 <option value="${uto.shopName}">${uto.shopName}</option>	
 </core:forEach>
</select>
</div>
<br/>
<div style="width:219px; ">
<input type="submit" class="button-my" value="Show Leadger" name="show"  />
<input type="submit" class="button-my" value="Add Payment" name="addcash" />
<input type="submit" class="button-my" value="Add Invoice" name="addbill" />

<%-- 
<input type="submit" class="button-my" value="Add Opening Balance" name="addopeningbalance" />
--%>
</div>

<%-- 
<br/>
<div style="   font-weight:normal; font-family: Segoe UI, Helvetica, Arial, sans-serif;">
    <input type="submit" class="btn blue" value="Show" name="show" />
	<input type="submit" class="btn blue" value="Add Bill" name="addbill"  />
	<input type="submit" class="btn blue" value="Add Cash" name="addcash"  />
</div>
--%>
</form>
<form class="second" action="startBilling.vpb" onSubmit="return validateSelectCustomerField();" >
   <div style="width:219px; ">
	 <input type="submit" class="button-my"  value="Start Billing" name="billing" />
	 <input type="hidden" id="shopName" name="customerName" value="" />
   </div>	
</form>
<br/>
<div style="color: red;" id="errordiv"></div>
<br/>
<table>


<core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
<tr>
   <td><font  style="font-weight:bold;" color="green">P.Balance :</font></td>
   <td  align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_DUE -((TOTAL_BILL - TOTAL_RETURN)-TOTAL_PAID) }"/></font></td>
</tr>
</core:if>

<tr>
<td><font  style="font-weight:bold;" color="green">Total Sale : </font></td>
<td  align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_BILL - TOTAL_RETURN }"/></font></td>
</tr>
<tr>
<td><font  style="font-weight:bold;" color="green">Total Paid :</font></td>
<td  align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_PAID }"/></font></td>
</tr>
<core:if test="${KHATA eq 'vpb_acadmic_71_72' }">
  <tr>
	<td><font  style="font-weight:bold;" color="green">Total Due :</font></td>
	<td  align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_DUE - (TOTAL_DUE -((TOTAL_BILL - TOTAL_RETURN)-TOTAL_PAID)) }"/></font></td>
  </tr>
</core:if>
<core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
  <tr>
	<td><font  style="font-weight:bold;" color="green">Total Due :</font></td>
	<td  align="right"><font color="black"><nitesh:fmtToIndianCurrency value="${TOTAL_DUE }"/></font></td>
  </tr>
</core:if>


</table>
</div>
</div>

</body>
</html>