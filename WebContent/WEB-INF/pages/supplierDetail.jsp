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
</head>
<body>
<div class="loginback">
<div>
<h3 class="page-title">
							Supplier Ledger <small>It shows the goods bought from supplier and payment history</small>
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
							<li><a href="#">Supplier Ledger</a></li>
						</ul>
</div>	
<div class="tablecontent" style="float:center;">
<table width="100%"  class="textStyle" >
<core:if test="${SUPPLIER_ORDER_FOUND eq null }">
<tr >
<td align="center">
<font color="blue" size="5"> Order Information not found </font>
</td></tr>
</core:if>

<core:if test="${SUPPLIER_ORDER_FOUND ne null }">
<tr bgcolor="#404040">
	<td class="textStyle" align="center" colspan="7">
		<font style="float:left; font-size:120%;" color="yellow"><font color="white" >Supplier Name : </font>${SUPPLIER_NAME} </font>
		<a style="float:right; color:blue; font:times New romans;font-size:120%; " href="listofsuppliers.vpb">Back</a>
	</td>
</tr>
<tr bgcolor="grey">
<td align="center"><font color="white" > Sr.No. </font></td>
<td align="center"><font color="white" > Invoice#</font></td>
<td align="center"><font color="white" > Billing Date </font></td>
<td align="center"><font color="white" > Bill Amount </font></td>
<td align="center"><font color="white" > Amount Paid </font></td>
<td align="center"><font color="white" > Return</font></td>
<td align="center"><font color="white" > Due Amount </font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff"; 
%>
<core:forEach var="soto" items="${SUPPLIER_ORDER_FOUND }"> 
<%
++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>
<tr bgcolor="<%=color%>">
<td  align="center">
<font><%=i %></font>
</td>
<td  align="center">
<font> ${soto.billNumber }  </font>
</td>

<td align="center">
<font> ${soto.billDate }  </font>
</td>

<td align="center">
<font face="Rupee Foradian"></font><font> <nitesh:fmtToIndianCurrency value="${soto.billAmount }"/>  </font>
</td>

<td align="center">
<font face="Rupee Foradian"></font><font > <nitesh:fmtToIndianCurrency value="${soto.amountPaid }"/>  </font>
<font style="float: right;">
  <core:if test="${soto.paymentMode eq 'bycash' }"> <i class="icon-money"></i> </core:if>
  <core:if test="${(soto.paymentMode eq '') and (soto.amountPaid gt 0)}"> <i class="icon-money"></i> </core:if>
  <core:if test="${soto.paymentMode eq 'bycheque' }"> <i class="fa fa-check-square"></i> </core:if>
  <core:if test="${soto.paymentMode eq 'bybank' }"> <i class="fa fa-bank"></i> </core:if>
</font> 
</td>

<td align="center">
<font  face="Rupee Foradian"></font><font> <nitesh:fmtToIndianCurrency value="${soto.returnAmount }"/>  </font>
</td>

<td align="center">
<font face="Rupee Foradian"></font><font  > <nitesh:fmtToIndianCurrency value="${soto.dueAmount }"/>  </font>
</td>
</tr>
</core:forEach>
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" > Total  </font>
</td>

<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency value="${TOTAL_BILL}"/>
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency value="${TOTAL_PAID}"/>
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency value="${TOTAL_RETURN}"/>
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency value="${(TOTAL_BILL - TOTAL_PAID)-TOTAL_RETURN}"/>
</font>  
</td>

</tr>
</core:if>
</table>
</div>
</div>
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</body>
</html>