<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.YearMonthDV"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
  <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/tablestyle.css">

</head>
<!-- <body onload="window.print();"> -->
<body onload="window.print();">

<form action="placeorder.vpb" method="post">

<%
DateFormat dateFormat = new SimpleDateFormat("MMMM d, yyyy");
Date date=new Date();
session.removeAttribute("TOTAL_BOOK_AMOUNT");
session.removeAttribute("TOTAL_BOOK_DISCOUNT_AMOUNT");
session.removeAttribute("TOTAL_BOOK_QUANTITY");
%>
<table align="center" class="border">
<tr><td colspan="7" align="center"><font size="3" ><b>Viddarthi Pustak Bhandar</b></font></td></tr>
<tr><td colspan="7" align="center"><font size="1" >Birta, Birgunj, Nepal</font></td></tr>
<tr><td colspan="7" align="center"><font size="1" >Ph: 9036513210, 9804205689</font></td></tr>
<tr><td colspan="7" align="center"><font size="1" >Email: viddarthipustakbhandar@gmail.com</font></td></tr>
<tr >
 <td  rowspan="0" colspan="4" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="1" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="1" ><b>Address :</b> ${USER_TO.shopName} </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="3" align="right" class="borderright">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="1" ><b>Date: </b></font> <font size="1"><%=dateFormat.format(date) %></font></td></tr>
		  <tr><td><font size="1" ><b>Invoice no.: </b></font> <font size="1"> <%=dateFormat.format(date) %>-001</font></td></tr>
		</table>
</td>
</tr>
<tr bgcolor="#404040" class="line">
<td align="center" class="line"><font style="normal" color="white" size="2"><b>Sr.No</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>Description</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>Qty</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>Rate</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>Price</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>%</b></font></td>
<td align="center" class="line"><font color="white" size="2"><b>Amt</b></font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff";
%>

<core:forEach var="bto" items="${SELECTED_BOOK_LIST }">
<% ++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>

<tr bgcolor="<%=color%>" class="line">
<td align="center" class="line">
<font size="1"><b><%=i %></b></font>
</td>
<td align="left" >
<font size="1"><b> ${bto.bookName } </b> </font>
</td>

<td align="center" class="line">
<font size="1"><b> ${bto.selectedNumberOfBook } </b> </font>
</td>

<td align="center" class="line">
<font size="1" face="Rupee Foradian"></font><font size="2" > ${bto.cost } </font>
</td>


<td align="right" class="line">
<font size="1" face="Rupee Foradian"></font><font size="2" >
<nitesh:displayBookTotalAmount value="${bto.cost *bto.selectedNumberOfBook }" quantity="${bto.selectedNumberOfBook}"/></font>
</td>
<%
	String discountValue=request.getAttribute("DISCOUNT"+i).toString();	
    request.setAttribute("DISCOUNT", discountValue);
%>

<td align="right" class="line">
<font size="1"><b> <%=discountValue %></b> </font>
</td>
<td align="right" class="line">
<font size="1" ><b>
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-((DISCOUNT/100)*(bto.cost*bto.selectedNumberOfBook))}" /></b></font>
</td>
</tr>
</core:forEach>
<%
if(i<15){
for(int j=i;j<=15;j++){
	++i;            x++;
	if(x==3)        x=0;
	if(x==0)        color="#fdeaff";
	else if(x==1)        color="#dee1fe";
	else if(x==2)        color="#e1ffde";

%>
<tr height="20px" bgcolor="<%=color%>"><td class="borderleft"></td><td></td><td></td><td></td><td></td><td></td><td align="center"  class="line">|</td></tr>
<%
}
}
%>
<tr bgcolor="#dee1fe" class="total"><td colspan="6" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:displayDiscountTotal/>/-</b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"><b>5%</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b>-${TOTAL_BOOK_DISCOUNT_AMOUNT*0.05}/-</b></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b>${(TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*0.05)}/-</b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" size="3"><b> Total </b> </font>
</td>

<td align="center">
<font color="" size="2"><b> ${TOTAL_BOOK_QUANTITY} </b> </font>
</td>
<td align="right">
<font size="2" face="Rupee Foradian"><b><nitesh:displayTotalAmount/>/-</b></font>
</td>

</tr>
</table>
</form>
</body>
</html>