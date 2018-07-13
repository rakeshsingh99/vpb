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
  <link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
</head>
<body>
<center>
<fieldset class="row4">
<form action="removefromcart.vpb" method="post">
<table width="1162px" cellspacing="0" class="textStyle" style="margin-top:-37px;">
<tr bgcolor="#404040">
<td align="center" colspan="7">
<font color="white" size="5"><b> Displaying book from Cart </b></font>
</td></tr>
<tr bgcolor="lightyellow">
<td align="center" colspan="8" >
<font size="4" color="red"><nitesh:error property="bookId"/> </font>
<font size="4" color="red"><nitesh:error property="extraDiscount"/> </font>
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
<font color="white"size="4"><b> Rate </b></font>
</td>

<td align="center" style="size:20px;">
<font color="white"size="4"><b> Qty </b></font>
</td>

<td align="center">
<font color="white"size="4"><b> Price </b></font>
</td>

<td align="center">
<font color="white" size="4"><b> Amt </b></font>
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
<td align="center">
<font size="4" face="Rupee Foradian">${bto.cost }</font>
</td>
<td align="center">
<font size="4">${bto.selectedNumberOfBook }</font></td>
<td style="width:60px; font-size:1px;" align="right">
<font size="4" face="Rupee Foradian"></font><font size="4" >
 <nitesh:displayBookTotalAmount value="${bto.cost*bto.selectedNumberOfBook}" quantity="${bto.selectedNumberOfBook}"/>/-</font>
</td>
<td style="width:80px; font-size:1px;" align="right">
<font size="4" face="Rupee Foradian"></font><font size="4" >
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-(0.25*(bto.cost*bto.selectedNumberOfBook))}" />/-</font>
</td>
<td style="width:605px; font-size:1px;" align="right">
        <font size="3" >15%</font><input type="radio" value="${bto.bookId }:15"   name="discount<%=i %>" />
        <font size="3" >20%</font><input type="radio" value="${bto.bookId }:20"   name="discount<%=i %>" />
		<font size="3" >25%</font><input type="radio" value="${bto.bookId }:25"   name="discount<%=i %>" />
		<font size="3" >30%</font><input type="radio" value="${bto.bookId }:30" checked="checked"  name="discount<%=i %>" />
		<font size="3" >32.5%</font><input type="radio" value="${bto.bookId }:32.5"   name="discount<%=i %>" />
		<font size="3" >33.5%</font><input type="radio" value="${bto.bookId }:33.5" name="discount<%=i %>" />
		<font size="3" >35%</font><input type="radio" value="${bto.bookId }:35" name="discount<%=i %>" />
		<font size="3" >38%</font><input type="radio" value="${bto.bookId }:38" name="discount<%=i %>" />
		<font size="3" >43%</font><input type="radio" value="${bto.bookId }:43" name="discount<%=i %>" />
		<font size="3" >50%</font><input type="radio" value="${bto.bookId }:50" name="discount<%=i %>" />
		<font size="3" >52.5%</font><input type="radio" value="${bto.bookId }:52.5" name="discount<%=i %>" />
</td>
</tr>
</core:forEach>
<tr bgcolor="grey">
<td colspan="2" align="right">
<font color="" size="4"><b> Total </b> </font>
</td>

<td align="center">
<font color="" size="4"><b> ${TOTAL_BOOK_QUANTITY} </b> </font>
</td>
<td align="right">
<font size="4" face="Rupee Foradian"><nitesh:displayTotalAmount/>/-</font>
</td>
<td align="right">
<font size="4" face="Rupee Foradian"><nitesh:displayDiscountTotal/>/-</font>
</td>
</tr>
<tr bgcolor="#404040">

<td colspan="2" align="center">
<input class="btn red"  type="submit" value="Remove" class="signoutButton" name="removeItem">
</td>

<td colspan="3" align="center">
<a class="btn blue" href="searchBookDef.jsp"><font color="white" size="2"> Add More</font></a>
</td>

<td colspan="1" align="center">
<input type="hidden" value="<%=i %>" name="numberofitems"/>
<input type="hidden" value="${USER_TO.shopName }" name="shopName"/>
<input type="submit" value="Process Billing" class="btn green" name="processbill">
<select  id="BX_publication"  name="extraDiscount">
	<option value="">Extra%</option>
	<option value="0.0">0.0</option>
	<option value="1.0">1.0</option>
	<option value="1.5">1.5</option>
	<option value="2.0">2.0</option>
	<option value="2.5">2.5</option>
	<option value="3.0">3.0</option>
	<option value="3.5">3.5</option>
	<option value="4.0">4.0</option>
	<option value="4.5">4.5</option>
	<option value="5.5">5.5</option>
	<option value="6.0">6.0</option>
	<option value="6.5">6.5</option>
	<option value="7.0">7.0</option>
	<option value="7.5">7.5</option>
	<option value="8.0">8.0</option>
	<option value="8.5">8.5</option>
	<option value="9.0">9.0</option>
	<option value="9.5">9.5</option>
	<option value="10.0">10.0</option>
</select>
<input type="text" size="2px" placeholder="Fright" id="BX_publication" name="fright"/>								

</td>


</tr>
</table>

</form>
</fieldset>
</center>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>
