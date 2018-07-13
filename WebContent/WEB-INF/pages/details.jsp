<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ page import="com.book.shop.to.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/nkindia.css">
<link rel="stylesheet" type="text/css"
href="<%=request.getContextPath()%>/css/indexstyle.css">
</head>
<body>
<form action="updateinfo.vpb" method="post">
<center>
<table class="textStyle" width="1167px" style="margin-top:-40px;">
<tr bgcolor="#404040">
<td align="center" colspan="3"><font color="white" size="5"><b>Personal Details</b></font>
</td>
</tr>
</table>
<table class="textStyle" width="50%" cellspacing="0">
<core:if test="${updateError ne null }">
<tr bgcolor="lightyellow">
<td colspan="3" align="center">
<font color="red" size="4"><b>${updateError }</b></font>
</td>
</tr>
</core:if>
<tr bgcolor="#fdeaff">
<td>
<font size="3"><b>Shop Name</b></font>
</td>
<td colspan="2">
<font size="3"><b>${USER_TO.shopName}	</b></font>
</td>
</tr>
<tr bgcolor="#dee1fe">
<td>
<font size="3"><b>Email</b></font>
</td>
<td>
<core:if test="${EDIT_INFO eq null }">
<font size="3"><b>${USER_TO.email }</b></font>
</core:if>
<core:if test="${EDIT_INFO ne null }">
<input type="text" value="${USER_TO.email }" name="email" size="30" style="color:black;background-color:#b4e0d2;"/>
<font color="red" size="4"><b><nitesh:error property="email"/></b></font>
</core:if>
</td>
</tr>
<tr bgcolor="#e1ffde">
<td>
<font size="3"><b>Phone</b></font>
</td>
<td>
<core:if test="${EDIT_INFO eq null }">
<font size="3"><b>${USER_TO.phone }</b></font>
</core:if>
<core:if test="${EDIT_INFO ne null }">
<input type="text" value="${USER_TO.phone }" name="phone" size="30" style="color:black;background-color:#b4e0d2;"/>
<font color="red" size="4"><b><nitesh:error property="phone"/></b></font>
</core:if>
</td>
</tr>
<tr bgcolor="#fdeaff">
<td>
<font size="3"><b>Username</b></font>
</td>
<td colspan="2">
<font size="3"><b>${USER_TO.username }</b></font>
</td>
<tr bgcolor="#dee1fe">
<td>
<font size="3"><b>Password</b></font>
</td>
<td colspan="2">
<font size="3"><b><nitesh:displayUserPassword/></b></font>
</td>
</tr>
</table>
<table width="53%">
<tr bgcolor="lightgreen">
<core:if test="${EDIT_INFO eq null }">
<td align="center" colspan="3">
<a href="editinfo.vpb"><font size="4"><b>Edit</b></font></a>
</td>
</core:if>
<core:if test="${EDIT_INFO ne null }">
<td align="center">
<a href="cancleedit.vpb"><font size="3"><b>Cancel</b></font></a>
</td>
<td align="center">
<input type="submit" value="Update" class="signoutButton"/>
</td>
</core:if>
</tr>
</table>
</center>
</form>
</body>
</html>