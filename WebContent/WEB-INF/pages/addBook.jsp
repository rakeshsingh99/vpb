<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
</head>
<body >
<center>
<form action="addBook.vpb" method="post">
<table class="textStyle" height="100%" width="100%" style="margin-top:-40px;">
<tr bgcolor="#404040">
<td class="textStyle" align="center" colspan="7">
<font size="5" color="white"><b> Add Book Information </b></font>
</td></tr>
<tr>
<td>
<table align="center">
<tr bgcolor="lightyellow">
<td align="center" colspan="3">
<font size="4" color="red"><b><nitesh:error property="addingBookError"/> </b></font>
</td></tr>
<core:if test="${SHOW_ADD_BOOK ne 'OK'}">

<tr>
<td align="left">
<font size="4"><b> Book Name </b></font>
</td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="bname"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="bname"/> </b></font>
</td></tr>

<tr>
<td align="left" height="">
<font size="4"><b> Publication </b></font>
</td>
<td>
<select style="color:black;  background-color:#b4e0d2; font-size:20" name="publication">
<option value="">Select</option>
<option value="Megha">Megha</option>
<option value="Ekta">Ekta</option>
<option value="United">United</option>
<option value="Oxbridge">Oxbridge</option>
<option value="Viddarthi">Viddarthi</option>
<option value="Ratna">Ratna</option>
<option value="Unique">Unique</option>
<option value="Bhudipuran">Bhudipuran</option>
<option value="Sangam">Sangam</option>
<option value="Satyal">Satyal</option>
</select>
<td>
<td></td>
</tr>

<tr>
<td align="left" height="">
<font size="4"><b> Class </b></font>
</td>
<td>
<select style="color:black;  background-color:#b4e0d2; font-size:20" name="class">
<option value="">Select</option>
<option value="Nursery">Nursery</option>
<option value="LKG">LKG</option>
<option value="UKG">UKG</option>
<option value="One">One</option>
<option value="Two">Two</option>
<option value="Three">Three</option>
<option value="Four">Four</option>
<option value="Five">Five</option>
<option value="Six">Six</option>
<option value="Seven">Seven</option>
<option value="Eight">Eight</option>
<option value="Nine">Nine</option>
<option value="Ten">Ten</option>
</select>
<td>
<td></td>
</tr>

<tr>
<td align="left" height="">
<font size="4"><b> Author </b></font>
</td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="author"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="author"/> </b></font>
</td></tr>

<tr>
<td align="left" height="">
<font size="4"><b> Cost </b></font>
</td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="cost"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="cost"/> </b></font>
</td></tr>

<tr>
<td align="left" height="">
<font size="4"><b> Quantity </b></font>
</td>
<td>
<input type="text" size="35"
        style="color:black;  background-color:#b4e0d2; font-size:20" name="quantity"/>
</td>
<td>
<font size="4" color="red"><b><nitesh:error property="quantity"/> </b></font>
</td></tr>

<tr>
<td align="left" height="">
<font size="4"><b> Edition </b></font>
</td>
<td>
<select style="color:black;  background-color:#b4e0d2; font-size:20" name="edition">
<option value="">Select</option>
<option value="1st Edition">1st Edition</option>
<option value="2nd Edition">2nd Edition</option>
<option value="3rd Edition">3rd Edition</option>
<option value="4th Edition">4th Edition</option>
<option value="5th Edition">5th Edition</option>
<option value="6th Edition">6th Edition</option>
<option value="7th Edition">7th Edition</option>
<option value="8th Edition">8th Edition</option>
</select>
<td>
<td></td>
</tr>

<tr>
<td  colspan="3" align="center">
<input type="submit" value="Add Book"
        style="color:white;  background-color:grey; font-size:17 "/>
<input type="reset" value="Clear"
        style="color:white;  background-color:grey; font-size:17 "/>
</td>
</tr>
</core:if>
</table>
</td>
</tr>
</table>
</form>
</center>
<form action="multipleAddBookDef.jsp">
      <input type="submit" value="Add Multiple Book"
             style="color:white;  background-color:grey; font-size:17 "/>
</form>

</body>
</html>