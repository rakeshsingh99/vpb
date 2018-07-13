<%@ taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Viddarthi Pustak Bhandar </title>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/indaxstyle.css">
</head>
<body bgcolor="lightyellow">

<table width="90%" align="center" height="97%">
<tr height="5px" valign="top">
<td align="center">
<jsp:include page="/WEB-INF/pages/header.jsp"/>
</td>
</tr>

<tr valign="top" >
<td align="center">
<jsp:include page="/WEB-INF/pages/register.jsp"/>
</td>
</tr>

<tr height="2px" valign="bottom" >
<td align="center">
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
</td>
</tr>
</table>
</body>
</html>