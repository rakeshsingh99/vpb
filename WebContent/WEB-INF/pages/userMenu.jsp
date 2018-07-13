<%@page import="com.book.shop.to.UserTo" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns="http://www.w3.org/TR/REC-html40">
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia1.css">
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/indexsty1le.css">
</head>
<body>
<center>

<table class="textStyle" width="1116" height="66">
<div style="position: absolute; top: 130px; left:60px; padding-left: 30px;">
<font  size="3" color="yellow" ><b> Welcome &nbsp;<font color="white"> ${USER_TO.shopName} </font><core:if test="${USER_TO.role eq 'Admin'}">&nbsp;Admin </core:if><core:if test="${USER_TO.role eq 'User'}">&nbsp;User </core:if></b></font>
</div>
<div style="margin-top:-10px;" >
<tr style='mso-yfti-irow:1;height:24.75pt'>
  <td colspan=3 style='padding:0in 0in 0in 0in;height:24.75pt'>
  <table class=MsoNormalTable border=0 cellspacing=0 cellpadding=0 width=675
   style='width:506.25pt;mso-cellspacing:0in;mso-padding-alt:0in 0in 0in 0in'
   id="Table_05" height=35>
  
   <tr style='mso-yfti-irow:0;mso-yfti-firstrow:yes;mso-yfti-lastrow:yes'>
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><img width="348"
    height=33 id="_x0000_i1030" src="image/navtablebgleft.gif"><o:p></o:p></span></p>
    </td>
    
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="userHomeDef.jsp"><img width=50 height=33
    id="_x0000_i1031" src="image/btn_home.gif" name="btn_home" border=0></span></span><o:p></o:p></span></p>
    </td>
    <core:if test="${USER_TO.role eq 'Admin'}">
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="addBookDef.jsp"><img width=67 height=33
    id="_x0000_i1032" src="image/addbook.jpg" name="btn_aboutus" border=0></span></span><o:p></o:p></span></p>
    </td>
    </core:if>
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="searchBookDef.jsp"><img width=50 height=33
    id="_x0000_i1033" src="image/search.jpg" name="btn_contactus"
    border=0></span></span><o:p></o:p></span></p>
    </td>
    <core:if test="${USER_TO.role eq 'User'}">
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="userorderstatus.vpb"><img width=67 height=33
    id="_x0000_i1034" src="image/orderstatus.jpg" name="btn_products"
    border=0></span></span><o:p></o:p></span></p>
    </td>
    </core:if>
    <core:if test="${USER_TO.role eq 'Admin'}">
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="allorders.vpb"><img width=61 height=33
    id="_x0000_i1035" src="image/allorders.jpg" name="btn_services"
    border=0></span></span><o:p></o:p></span></p>
    </td>
    </core:if>
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="detailsDef.jsp"><img width=80 height=33
    id="_x0000_i1035" src="image/viewdetails.jpg" name="btn_services"
    border=0></span></span><o:p></o:p></span></p>
    </td>
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="changePasswordDef.jsp"><img width=110 height=33
    id="_x0000_i1035" src="image/changepassword.jpg" name="btn_services"
    border=0></span></span><o:p></o:p></span></p>
    </td>
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><span style='mso-field-code:
    " HYPERLINK \0022\0022 "'><span style='color:blue'><a href="logout.vpb"><img width=50 height=33
    id="_x0000_i1035" src="image/logout.jpg" name="btn_services"
    border=0></span></span><o:p></o:p></span></p>
    </td>    
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><img width=1 height=33
    id="_x0000_i1036" src="image/navtablespacer.gif"><o:p></o:p></span></p>
    </td>
    <core:if test="${USER_TO.role eq 'User'}">
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><img width="407"
    height=33 id="_x0000_i1037" src="image/navtablebgright.gif"><o:p></o:p></span></p>
    </td>
    </core:if>
    <core:if test="${USER_TO.role eq 'Admin'}">
    <td style='padding:0in 0in 0in 0in'>
    <p class=MsoNormal><span style='font-family:Tahoma'><img width="348"
    height=33 id="_x0000_i1037" src="image/navtablebgright.gif"><o:p></o:p></span></p>
    </td>
    </core:if>
   </tr>
   </div>
  </table>
  <p class=MsoNormal><span style='font-family:Tahoma'><o:p></o:p></span></p>
  </td>
 </tr>

</tr>

</table>
</center>
</body>
</html>