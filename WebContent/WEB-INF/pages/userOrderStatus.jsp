<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
  <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
</head>
<body >
<center>
<br/>
<table style="margin-top:-58px;" align="center" width="1167px" class="textStyle" >
<core:if test="${ORDER_FOUND eq null }">
<tr >
<td align="center">
<font color="blue" size="5"><b> Order Information not found </b></font>
</td></tr>
</core:if>

<core:if test="${ORDER_FOUND ne null }">
<tr bgcolor="#404040">
<td class="textStyle" align="center" colspan="9">
<font color="white" size="5"><b> Order Information </b></font>
</td></tr>
<tr bgcolor="grey">
<td align="center"><font color="white" size="3"><b> Sr.No. </b></font></td>
<td align="center"><font color="white" size="3"><b> Order Id </b></font></td>
<td align="center"><font color="white" size="3"><b> Order Date </b></font></td>
<td align="center"><font color="white" size="3"><b> Total Item </b></font></td>
<td align="center"><font color="white" size="3"><b> Bill Amount </b></font></td>
<td align="center"><font color="white" size="3"><b> Amount Paid </b></font></td>
<td align="center"><font color="white" size="3"><b> Return </b></font></td>
<td align="center"><font color="white" size="3"><b> Due Amount </b></font></td>
<td align="center"><font color="white" size="3"><b> Status </b></font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff"; 
%>
<core:forEach var="oto" items="${ORDER_FOUND }">
<%
++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>
<tr bgcolor="<%=color%>">
<td align="center">
<font size="2"><b><%=i %></b></font>
</td>
<td align="center">
<table>
<tr>
<td>
<form action="showorderinfo.vpb" method="post">
<input type="hidden" value="${oto.orderId }" name="orderId"/>
<input type="hidden" value="userOrderStatusDef.jsp" name="page"/>
<core:if test="${oto.billNumber eq 0 }">
<input type="submit" value="${oto.orderId }" class="tableButton"/>
</core:if>
<core:if test="${oto.billNumber ne 0 }"> <font style="color:black; font-size:15px;  " > M-${oto.billNumber}</font></core:if>
</form>
</td>
<td>
<form action="printBill.vpb"  method="post">
<input type="hidden" value="${oto.orderId }" name="orderId"/>
<core:if test="${oto.billNumber eq 0 }">
<input type="submit" value="" title="print bill" class="m-icon-white"/>
</core:if>
</form>
</td>
</tr>
</table>
</td>

<td align="center">
<font size="2"><b> ${oto.orderDate } </b> </font>
</td>

<td align="center">
<font size="2"><b> ${oto.totalItem } </b> </font>
</td>

<td align="center">
<font size="2" face="Rupee Foradian"></font><font size="3" ><b> ${oto.grandTotal }0 </b> </font>
</td>

<td align="center">
<font size="2" face="Rupee Foradian"></font><font size="3" ><b> ${oto.amountPaid }0 </b> </font>
</td>

<td align="center">
<font size="2" face="Rupee Foradian"></font><font size="3" ><b> ${oto.returnAmount }.00 </b> </font>
</td>

<td align="center">
<font size="2" face="Rupee Foradian"></font><font size="3" ><b> ${oto.dueAmount }0 </b> </font>
</td>

<td align="center">
<font size="2"><b> ${oto.status } </b> </font>
</td>
</tr>
</core:forEach>
</core:if>
</table>
<br/>

<core:if test="${ORDER_TO ne null }">
<table width="1167px" cellspacing="0" class="textStyle" border="1">
<tr bgcolor="#404040">
<td align="center" colspan="7" >
<font color="white" size="4"><b> Information about the order with id <font color="white">${ORDER_TO.orderId}</font></b></font>
</td>
</tr>

<tr bgcolor="grey">
<td align="center" colspan="2">
<font color="white"size="3"><b> Address </b></font>
</td>

<td align="center">
<font color="white"size="3"><b> Street </b></font>
</td>

<td align="center">
<font color="white"size="3"><b> City </b></font>
</td>

<td align="center">
<font color="white"size="3"><b> Order Date </b></font>
</td>
</tr>

<tr>
<td align="center"  colspan="2"><font size="3"><b>${ORDER_TO.address }</b></font></td>
<td align="center" ><font size="3"><b>${ORDER_TO.street }</b></font></td>
<td align="center" ><font size="3"><b>${ORDER_TO.city }</b></font></td>
<td align="center" ><font size="3"><b>${ORDER_TO.orderDate }</b></font>
</td>
</tr>
</table>
<font size="4" ><b>Items Detail</b></font>
<table align="center" width="50%" cellspacing="0" border="1">
<tr bgcolor="#404040">
<td align="center" ><font color="white" size="3"><b>Sr.No</b></font></td>
<td align="center" ><font color="white" size="3"><b>Description</b></font></td>
<td align="center" ><font color="white" size="3"><b>Pub</b></font></td>
<td align="center" ><font color="white" size="3"><b>Rate</b></font></td>
<td align="center" ><font color="white" size="3"><b>Qty</b></font></td>
<td align="center" ><font color="white" size="3"><b>Amount</b></font></td>
<td align="center" ><font color="white" size="3"><b>%</b></font></td>
<td align="center" ><font color="white" size="3"><b>Discount Total</b></font></td>
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

<tr bgcolor="<%=color%>">
<td align="center">
<font size="2"><b><%=i %></b></font>
</td>
<td align="left">
<font size="2"><b> ${bto.bookName } </b> </font>
</td>

<td align="center">
<font size="2"><b> ${bto.publication } </b> </font>
</td>

<td align="center">
<font size="2" face="Rupee Foradian"></font><font size="3" ><b> ${bto.cost }/- </b> </font>
</td>

<td align="center">
<font size="2"><b> ${bto.selectedNumberOfBook } </b> </font>
</td>

<td align="right">
<font size="2" face="Rupee Foradian"></font><font size="2" ><b>
<nitesh:displayBookTotalAmount value="${bto.cost *bto.selectedNumberOfBook }" quantity="${bto.selectedNumberOfBook}"/>/-</b></font>
</td>
<td align="right">
<font size="3" face="Rupee Foradian">${bto.discountPercentage }</font>
</td>
<td align="right" class="line">
<font size="2" ><b>
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-((bto.discountPercentage/100)*(bto.cost*bto.selectedNumberOfBook))}" /></b></font>
</td>
</tr>
</core:forEach>
<tr bgcolor="#dee1fe" class="total"><td colspan="7" align="right" class="borderleft"><b>Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:displayDiscountTotal/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft"><b>Extra:</b></td>
<td align="right"><b>${EXTRA_PERCENTAGE}%</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)}"/></b></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="7" align="right" class="borderleft"><b>Fright:</b></td>
<td align="right" class="borderright">
<font size="3" face="Rupee Foradian"><b>${FRIGHT_AMOUNT }</b></font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="7" align="right" class="borderleft"><b>Grand Total:</b></td>
<td align="right" class="borderright">
<font size="2" face="Rupee Foradian"><b><nitesh:doubleConverter value="${((TOTAL_BOOK_DISCOUNT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)))+FRIGHT_AMOUNT}"/></b></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="4" align="right">
<font color="white" size="3"><b> Total </b> </font>
</td>

<td align="center">
<font color="" size="3"><b> ${TOTAL_BOOK_QUANTITY} </b> </font>
</td>
<td align="right">
<font size="3" face="Rupee Foradian"><nitesh:displayTotalAmount/>/-</font>
</td>
</tr>
</table>
</core:if>
</center>
</body>
</html>
