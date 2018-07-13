<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
    th {text-align:left;}
    table {border-collapse: collapse;}
    td {padding-right: 10px;}
    body{font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
</style>
</head>
<!-- <body onload="window.print();"> -->
<body>
<form action="placeorder.vpb" method="post">
<table width="95%" height="95%" align="center">
<tr valign="middle">
<td align="center" width="90%">
<table width="80%">
<tr bgcolor="orange">
<td align="center" colspan="3">
<font color="black" size="6"> Place Your Order </font>
</td></tr>
<tr bgcolor="lightyellow">
<td colspan="3" align="center">
<b><font size="5" color="red"><nitesh:error property="errorInOrder"/></font></b>
</td></tr>

<core:if test="${ORDER_PLACED ne null }">
<%
 session.removeAttribute("SELECTED_BOOK_LIST");
 %>

<tr bgcolor="lightyellow">
<td align="center">
<br/>
<br/>
<font color="red" size="5"><b> Order is placed successfully. Your OrderId is <font color="green"> ${ORDER_PLACED }</font>
.You can use for further reference.</b></font>
<br/>
<br/>
</td>
</tr>
</core:if>

<core:if test="${ORDER_PLACED eq null}">

<tr bgcolor="maroon">
<td colspan="3" align="center">
<font color="white" size="5"><b> Address Information </b></font>
</td>
</tr>

<tr><td><font size="5"><b> Address </b></font></td>
<td>
<input type="text" name="address" id="address" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="address"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> Street </b></font></td>
<td>
<input type="text" name="street" id="street" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="street"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> City </b></font></td>
<td>
<input type="text" name="city" id="city" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="city"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> State </b></font></td>
<td>
<input type="text" name="state" id="state" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="state"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> Country </b></font></td>
<td>
<input type="text" name="country" id="country" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="country"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> Zip Code </b></font></td>
<td>
<input type="text" name="zip" id="zip" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="zip"/> </font></b>
</td></tr>

<tr bgcolor="maroon">
<td colspan="3" align="center">
<font color="white" size="5"><b> Card Information </b></font>
</td>
</tr>

<tr><td><font size="5"><b> Card Number </b></font></td>
<td>
<input type="text" name="cardNo" id="cardNo" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="cardNo"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> Secret Pin </b></font></td>
<td>
<input type="password" name="pin" id="pin" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="pin"/> </font></b>
</td></tr>

<tr><td><font size="5"><b> Card Expiration Date[MM/YYYY] </b></font></td>
<td>
<input type="text" name="cardExp" id="cardExp" 
        style="color:black;  background-color:#b4e0d2; font-size:20 "/>
</td>
<td>
<b><font color="red" size="4"><nitesh:error property="cardExp"/> </font></b>
</td></tr>

<tr>
<td  colspan="3" align="center" >
<br>
<input type="submit" value="Place Order"
        style="color:white;  background-color:maroon; font-size:17 "/>
</td>
</tr>
</core:if>
</table>
</td>
</tr>
</table>
</form>
</body>
</html>