<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.xs.YearMonthDV"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="core"%>
<%@ page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
  <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/tablestyle.css">

</head>
<!-- <body onload="window.open(); window.print();"> -->
<body  >
<center>


<%
session.removeAttribute("TOTAL_BOOK_AMOUNT");
session.removeAttribute("TOTAL_BOOK_DISCOUNT_AMOUNT");
session.removeAttribute("TOTAL_BOOK_QUANTITY");

%>

<table align="center" cellspacing="0"  class="border">
<tr><td colspan="7" align="center"><font size="4" ><b>Viddarthi Pustak Bhandar</b></font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Birta, Birgunj, Nepal</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Ph: 9845036451, 9811800810</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Email: viddarthipustakbhandar@gmail.com</font></td></tr>
<tr >
 <td  rowspan="0" colspan="2" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="2" ><b>Address :</b> ${ORDER_TO.address } </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="5" align="right">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Date: </b></font> <font size="2">${ORDER_TO.orderDate}</font></td></tr>
		  <tr><td><font size="2" ><b>Invoice no.: </b></font> <font size="2"> ${ORDER_TO.orderId }</font></td></tr>
		</table>
</td>
</tr>
<tr bgcolor="white" class="line">
<td align="center" class="line"><font style="normal" color="black" size="2"><b>Sr.No</b></font></td>
<td style="width:1000px" align="center" class="line"><font color="black" size="2"><b>Description</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>Qty</b></font></td>
<td  style="width:80px" align="center" class="line"><font color="black" size="2"><b>Rate</b></font></td>
<td  style="width:90px" align="center" class="line"><font color="black" size="2"><b>Price</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>%</b></font></td>
<td style="width:100px" align="center" class="line"><font color="black" size="2"><b>Amount</b></font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff";
%>

<core:forEach var="bto" items="${ORDERKOLIST}">
<% ++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>

<tr bgcolor="<%=color%>" class="line">
<td align="center" class="line">
<font size="2"><%=i %></font>
</td>
<td align="left">
<font size="2"> ${bto.bookName }  </font>
</td>

<td align="center" class="line">
<font size="2"> ${bto.selectedNumberOfBook }  </font>
</td>

<td align="center" class="line">
<font size="2" face="Rupee Foradian"></font><font size="2" > ${bto.cost } </font>
</td>



<td align="right" class="line">
<font size="2" face="Rupee Foradian"></font><font size="2" >
<nitesh:displayBookTotalAmount value="${bto.cost *bto.selectedNumberOfBook }" quantity="${bto.selectedNumberOfBook}"/></font>
</td>


<td align="center" class="line">
<font size="2"> ${bto.discountPercentage } </font>
</td>
<td align="right" class="line">
<font size="2" >
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-((bto.discountPercentage/100)*(bto.cost*bto.selectedNumberOfBook))}" /></font>
</td>
</tr>

<%
if(i==21){
%>
<tr>
<td>
<tr bgcolor="#dee1fe" ><td colspan="6" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr class="noborder"><td class="noborder">
<br>
<br>
<br>
</td></tr>
<tr class="total"><td colspan="7" align="center"><font size="4" ><b>Viddarthi Pustak Bhandar</b></font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Birta, Birgunj, Nepal</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Ph: 9845036451, 9811800810</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Email: viddarthipustakbhandar@gmail.com</font></td></tr>
<tr >
 <td  rowspan="0" colspan="2" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="2" ><b>Address :</b> ${ORDER_TO.address } </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="5" align="right">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Date: </b></font> <font size="2">${ORDER_TO.orderDate}</font></td></tr>
		  <tr><td><font size="2" ><b>Invoice no.: </b></font> <font size="2"> ${ORDER_TO.orderId }</font></td></tr>
		</table>
</td>
</tr>
<tr bgcolor="white" class="line">
<td align="center" class="line"><font style="normal" color="black" size="2"><b>Sr.No</b></font></td>
<td style="width:1000px" align="center" class="line"><font color="black" size="2"><b>Description</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>Qty</b></font></td>
<td  style="width:80px" align="center" class="line"><font color="black" size="2"><b>Rate</b></font></td>
<td  style="width:90px" align="center" class="line"><font color="black" size="2"><b>Price</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>%</b></font></td>
<td style="width:100px" align="center" class="line"><font color="black" size="2"><b>Amount</b></font></td>
</tr>
<%} %>
<%
if(i==40){
%>
<tr>
<td>
<tr bgcolor="#dee1fe" ><td colspan="6" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr class="noborder"><td class="noborder">
<br>
<br>
<br>

</td></tr>
<tr class="total"><td colspan="7" align="center"><font size="4" ><b>Viddarthi Pustak Bhandar</b></font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Birta, Birgunj, Nepal</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Ph: 9845036451, 9811800810</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Email: viddarthipustakbhandar@gmail.com</font></td></tr>
<tr >
 <td  rowspan="0" colspan="2" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="2" ><b>Address :</b> ${ORDER_TO.address } </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="5" align="right">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Date: </b></font> <font size="2">${ORDER_TO.orderDate}</font></td></tr>
		  <tr><td><font size="2" ><b>Invoice no.: </b></font> <font size="2"> ${ORDER_TO.orderId }</font></td></tr>
		</table>
</td>
</tr>
<tr bgcolor="white" class="line">
<td align="center" class="line"><font style="normal" color="black" size="2"><b>Sr.No</b></font></td>
<td style="width:1000px" align="center" class="line"><font color="black" size="2"><b>Description</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>Qty</b></font></td>
<td  style="width:80px" align="center" class="line"><font color="black" size="2"><b>Rate</b></font></td>
<td  style="width:90px" align="center" class="line"><font color="black" size="2"><b>Price</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>%</b></font></td>
<td style="width:100px" align="center" class="line"><font color="black" size="2"><b>Amount</b></font></td>
</tr>
<%} %>
<%
if(i==60){
%>
<tr>
<td>
<tr bgcolor="#dee1fe" ><td colspan="6" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"></font>
</td>
</tr>
<tr class="noborder"><td class="noborder">
<br>
<br>
<br>

</td></tr>
<tr class="total"><td colspan="7" align="center"><font size="4" ><b>Viddarthi Pustak Bhandar</b></font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Birta, Birgunj, Nepal</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Ph: 9845036451, 9811800810</font></td></tr>
<tr><td colspan="7" align="center"><font size="2" >Email: viddarthipustakbhandar@gmail.com</font></td></tr>
<tr >
 <td  rowspan="0" colspan="2" align="left">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Customer's Name: </b> ${USER_TO.shopName } </font></td></tr>
		  <tr><td><font size="2" ><b>Address :</b> ${ORDER_TO.address } </font></td></tr>
		</table>
</td>
 <td  rowspan="0" colspan="5" align="right">
		<table  border="0" cellspacing="0">
		  <tr><td><font size="2" ><b>Date: </b></font> <font size="2">${ORDER_TO.orderDate}</font></td></tr>
		  <tr><td><font size="2" ><b>Invoice no.: </b></font> <font size="2"> ${ORDER_TO.orderId }</font></td></tr>
		</table>
</td>
</tr>
<tr bgcolor="white" class="line">
<td align="center" class="line"><font style="normal" color="black" size="2"><b>Sr.No</b></font></td>
<td style="width:1000px" align="center" class="line"><font color="black" size="2"><b>Description</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>Qty</b></font></td>
<td  style="width:80px" align="center" class="line"><font color="black" size="2"><b>Rate</b></font></td>
<td  style="width:90px" align="center" class="line"><font color="black" size="2"><b>Price</b></font></td>
<td style="width:50px" align="center" class="line"><font color="black" size="2"><b>%</b></font></td>
<td style="width:100px" align="center" class="line"><font color="black" size="2"><b>Amount</b></font></td>
</tr>
<%} %>
</core:forEach>

<%
if(i>20 && i<39){
for(int j=i;j<=39;j++){
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
<%
if(i>40 && i<58){
for(int j=i;j<=58;j++){
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
<%
if(i>60 && i<78){
for(int j=i;j<=78;j++){
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
<%
if(i<19){
for(int j=i;j<=19;j++){
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
<font size="3" face="Rupee Foradian"><b><nitesh:displayDiscountTotal/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"><b>${EXTRA_PERCENTAGE}</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"><b><nitesh:doubleConverter value="${TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)}"/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"><b>${FRIGHT_AMOUNT }</b></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"><b><nitesh:doubleConverter value="${((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)))+FRIGHT_AMOUNT}"/></b></font>
</td>
</tr>

</table>
<br>
<br>
<br>
<br>




<table border="1" cellspacing="0" class="border">
<tr bgcolor="white" >
<td colspan="5" align="center" >
<font color="black" size="3"><b> Statement </b> </font>
</td>
</tr>
<tr bgcolor="white" class="line">
<td  align="center" class="line"><font style="normal" color="black" size="3">Sr.No</font></td>
<td align="center" class="line"><font color="black" size="3">Date</font></td>
<td style="width:800px" align="center" class="line"><font color="black" size="3">Particular</font></td>
<td style="width:80px" align="center" class="line"><font color="black" size="3">Amt</font></td>
</tr>
<tr class="line">
<td align="center" class="line">
<font size="2">1</font>
</td>
<td align="center" class="line">
<font size="2">${ORDER_TO.orderDate }</font>
</td>
<td align="left" class="line">
<font size="2">Opening Balance</font>
</td>
<td align="center" class="line">
<font size="2">${(ORDER_TO.dueAmount+ORDER_TO.amountPaid )-ORDER_TO.grandTotal }0</font>
</td>
</tr>
<tr class="line">
<td align="center" class="line">
<font size="2">2</font>
</td>
<td align="center" class="line">
<font size="2">${ORDER_TO.orderDate }</font>
</td>
<td align="left" class="line">
<font size="2">Invoice(${ORDER_TO.orderId } Credit)</font>
</td>
<td align="center" class="line">
<font size="2"><nitesh:doubleConverter value="${((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)))+FRIGHT_AMOUNT}"/></font>
</td>
</tr>
<tr class="line">
<td align="center" class="line">
<font size="2">3</font>
</td>
<td align="center" class="line">
<font size="2">${ORDER_TO.orderDate }</font>
</td>
<td align="left" class="line">
<font size="2">Cash Paid</font>
</td>
<td align="center" class="line">
<font size="2">${ORDER_TO.amountPaid }</font>
</td>
</tr>
<tr bgcolor="white">
<td colspan="3" align="right">Total</td>
<td align="center" class="line">
<font size="2">${ORDER_TO.dueAmount}</font>
</td>
</tr>
</table>
</center>
</body>
</html>