<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh"  %>
<%@taglib uri="/WEB-INF/new.tld" prefix="new"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
</head>
<body>
<center>
<fieldset class="row4">
<form action="removefromcart.vpb" method="post">
<table width="1162px" cellspacing="0" class="textStyle" style="margin-top:-37px;">
<tr bgcolor="#404040">
<td align="center" colspan="8">
<font color="white" size="5"><b> Displaying book from Cart </b></font>
</td></tr>
<tr bgcolor="lightyellow">
<td align="center" colspan="7" >
<font size="4" color="red"><nitesh:error property="bookId"/> </font>
</td></tr>

<core:if test="${REMOVED_BOOK ne null }">
<tr bgcolor="lightyellow">
<td align="center" colspan="8" >
<b><font size="4">${REMOVED_BOOK.bookName}</font>
   <font color="red" size="4"> is removed successfully. Quantity was </font>
   <font color="green" size="4">
   ${REMOVED_BOOK.selectedNumberOfBook}</font></b>
</td>
</tr>
</core:if>

<tr bgcolor="grey">
<td align="center">
<font color="white"size="4"><b> Book Name </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Publication </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Edition </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Cost </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Quantity </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Total </b></font>
</td>

<td align="center">
<font color="white" size="4"><b> Dis. Total </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Discount </b></font>
</td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff"; 
%>
<core:forEach var="bto" items="${SELECTED_BOOK_LIST }">
<%
++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>
<tr bgcolor="<%=color%>">
<td>
<input type="radio" value="${bto.bookId }" name="bookId"/>
<font size="4"> ${bto.bookName}</font></td>
<td align="center"><font size="4"> ${bto.publication}</font></td>
<td align="center"><font size="4"> ${bto.edition}</font></td>
<td align="right">
<font size="4" face="Rupee Foradian"></font><font size="4" >${bto.cost }/-</font>
</td>
<td align="center">
<font size="4">${bto.selectedNumberOfBook }</font></td>
<td align="right">
<font size="4" face="Rupee Foradian"></font><font size="4" >
 <nitesh:displayBookTotalAmount value="${bto.cost*bto.selectedNumberOfBook}" quantity="${bto.selectedNumberOfBook}"/>/-</font>
</td>
<td align="right">
<font size="4" face="Rupee Foradian"></font><font size="4" >
 <%-- <new:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-(0.25*(bto.cost*bto.selectedNumberOfBook))}"/> --%>/-</font>
</td>
<td align="center">
		<font size="3" >25%</font><input type="radio" value="25" checked="checked" name="discount<%=i %>" />
		<font size="3" >30%</font><input type="radio" value="30" name="discount<%=i %>" />
		<font size="3" >35%</font><input type="radio" value="35" name="discount<%=i %>" />
</td>
</tr>
</core:forEach>
<tr bgcolor="grey">
<td colspan="4" align="right">
<font color="" size="4"><b> Total </b> </font>
</td>

<td align="center">
<font color="" size="4"><b> ${TOTAL_BOOK_QUANTITY} </b> </font>
</td>
<td align="right">
<font size="4" face="Rupee Foradian"><nitesh:displayTotalAmount/>/-</font>
</td>
<td align="right">
<font size="4" face="Rupee Foradian"><new:displayDiscountTotalAmount/>/-</font>
</td>
</tr>
<tr bgcolor="#404040">
<td colspan="2" align="center">
<a href="searchBookDef.jsp"><font color="blue" size="3"> Add More Book </font></a>
</td>

<td colspan="2" align="center">
<a href="placeOrderDef.jsp"><font color="blue" size="3"> Place Order </font></a>
</td>

<td colspan="3" align="center">
<input type="submit" value="Remove" class="signoutButton">
</td>
</tr>
</table>
</form>
</fieldset>
</center>
</body>
</html>
