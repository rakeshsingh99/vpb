<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
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

</head>
<!-- <body onload="window.print();"> -->
<body>

<form action="placeorder.vpb" method="post">

<%
DateFormat dateFormat = new SimpleDateFormat("MMMM d, yyyy");
Date date=new Date();
session.removeAttribute("TOTAL_BOOK_AMOUNT");
session.removeAttribute("TOTAL_BOOK_DISCOUNT_AMOUNT");
session.removeAttribute("TOTAL_BOOK_QUANTITY");
%>

<table width="1163px" style="margin-top:-38px;">
<tr bgcolor="#404040">
<td align="center" colspan="7" >
<font color="white" size="5"><b> Processing Bill </b></font>
</td></tr>
</table>
<table align="center" class="border" width="1163px">
<tr >
 <td  rowspan="0" colspan="4" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="2" ><b>Address :</b> ${USER_TO.shopName} </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="3" align="right" class="borderright">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Date: </b></font> <font size="2"><%=dateFormat.format(date) %></font></td></tr>
		  <tr><td><font size="2" ><b>Invoice no.: </b></font> <font size="2"> <%=dateFormat.format(date) %>-001</font></td></tr>
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
<font size="2"><b> ${bto.bookName } </b> </font>
</td>

<td align="center" class="line">
<font size="2"><b> ${bto.selectedNumberOfBook } </b> </font>
</td>

<td align="center" class="line">
<font size="2" face="Rupee Foradian"></font><font size="2" > ${bto.cost } </font>
</td>


<td align="right" class="line">
<font size="2" face="Rupee Foradian"></font><font size="2" >
<nitesh:displayBookTotalAmount value="${bto.cost *bto.selectedNumberOfBook }" quantity="${bto.selectedNumberOfBook}"/></font>
</td>
<%
	String discountValue=request.getAttribute("DISCOUNT"+i).toString();	
    request.setAttribute("DISCOUNT", discountValue);
 %>

<td align="right" class="line">
<font size="2"><b> ${bto.discountPercentage}</b> </font>
</td>
<td align="right" class="line">
<font size="2" ><b>
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-((DISCOUNT/100)*(bto.cost*bto.selectedNumberOfBook))}" /></b></font>
</td>
</tr>
</core:forEach>

<tr bgcolor="#dee1fe" class="total"><td colspan="6" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:displayDiscountTotal/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"><b>${EXTRA_PERCENTAGE}%</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${TOTAL_BOOK_DISCOUNT_AMOUNT*EXTRA_DISCOUNT}"/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"><b>${FRIGHT_AMOUNT }</b></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*EXTRA_DISCOUNT))+FRIGHT_AMOUNT}"/></b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="right">
<font color="white" size="3"><b> Total </b> </font>
</td>
<td align="right">
<font size="2" face="Rupee Foradian"><b><nitesh:displayTotalAmount/>/-</b></font>
</td>

</tr>
</table> 
<table border="1">
<tr bgcolor="white" >
<td colspan="5" align="center" >
<font color="black" size="3"><b> Statement </b> </font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="left">
<font color="white" size="3"><b> Previous Balance : </b> </font>
</td>
<td align="right">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${GET_OPENING_BALANCE + USERINFO_TO.dueAmount}"/></b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="left">
<font color="white" size="3"><b> Current Bill : </b> </font>
</td>
<td align="right">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*EXTRA_DISCOUNT))+FRIGHT_AMOUNT}"/></b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="left">
<font color="white" size="3"><b> Amount to Pay : </b> </font>
</td>
<td align="right">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${((USERINFO_TO.dueAmount + GET_OPENING_BALANCE) +((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*EXTRA_DISCOUNT)))+FRIGHT_AMOUNT}"/></b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="left">
<font color="white" size="3"><b> Return Amount : </b> </font>
</td>
<td align="right">
<input type="text" name="returnAmount" required="required"/>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="left">
<font color="white" size="3"><b> Amount Paid : </b> </font>
</td>
<td align="right">
<input type="text" name="amountPaid" required="required"/>
</td>
</tr>
<tr style="border:none;">
<td colspan="5" align="center" style="border:none;">
<input type="hidden" name="extraDiscount" value="${EXTRA_PERCENTAGE }"/>
<input type="hidden" name="frightAmount" value="${FRIGHT_AMOUNT }"/>
<input type="submit" name="placeOrder" value="Place Order"/>
</td>
</tr>
</table>
</form>
</body>
</html>