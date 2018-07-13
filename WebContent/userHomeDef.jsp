<%@ taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Viddarthi Pustak Bhandar</title>
<style type="text/css">
ul#menu, ul#menu ul.sub-menu {
    padding:0;
    margin: 0;
}
ul#menu li, ul#menu ul.sub-menu li {
    list-style-type: none;
    display: inline-block;
}

#navmenu{margin-top:8px;}
#navmenu ul {padding:0;line-hight:30pt;margin:0;margin-left:auto;}
#navmenu li {list-style:none;float:left;position:relative;}
#navmenu ul li a {
background-color: #2B2B2B;
display: block;
width: 86px;
color: #FFF;
text-decoration: none;
text-align: center;
border-right-width: 1pt;
border-bottom-width: 1pt;
border-left-width: 1pt;
border-right-style: solid;
border-bottom-style: solid;
border-left-style: solid;
border-right-color: #333;
border-bottom-color: #000;
border-left-color: #333;
line-height: 30pt;
font-family: Georgia;
font-weight: bold;
}
#navmenu ul li a:hover{
background-color: #FFF;
color: #0CF;
}
#navmenu ul li ul {
position: absolute;
visibility: hidden;
}
#navmenu ul li:hover ul {
visibility: visible;
}

</style>
</head>
<body >
<nitesh:validateSession/>
<nitesh:removeSearchInfoFromSession/>
<%session.removeAttribute("BILLING_CUSTOMER_NAME"); %>

<jsp:include page="/WEB-INF/pages/headerInside.jsp"/>

<div id="site-wrapper">
        <div id="site-canvas">   
                <jsp:include page="/WEB-INF/pages/userHome.jsp"/>
            <div id="site-menu">
               <div id="navmenu">
					<ul>
					   <core:if test="${USER_TO.role eq 'Admin'}">
						  <li><a href="listofsuppliers.vpb" rel="nofollow"><i style="font-size: 40px; " class="icon-shopping-cart"></i> Supplier </a></li>	  
						  <li><a href="listofcustomers.vpb" rel="nofollow"><i style="font-size: 40px;" class="icon-user"></i> Customer </a></li>
					   </core:if>  	  
						  <li><a  href="userHomeDef.jsp" rel="nofollow"> <i style=" font-size: 40px;" class="icon-home"></i> Home </a></li>
						  <li><a href="searchBookDef.jsp" rel="nofollow"><i style="font-size: 40px;" class="icon-search"></i> Search </a></li>
					   <core:if test="${USER_TO.role eq 'Admin'}">	  
						  <li><a href="manualAddBookDef.jsp" rel="nofollow"><i style="font-size: 40px;" class="icon-plus"></i> AddBook </a></li>	  
						  <li><a href="allorders.vpb" rel="nofollow"><i style="font-size: 40px;" class="icon-list"></i> AllOrders </a></li>
					   </core:if>
					   <core:if test="${USER_TO.role eq 'User'}">	  
						  <li><a href="userOrderStatusDef.jsp" rel="nofollow"><i style="font-size: 40px;" class="icon-list"></i> Orders </a></li>
					   </core:if>
					   <core:if test="${USER_TO.role eq 'Admin'}">	  
						  <li><a href="showOldLedger.vpb" rel="nofollow"><i style="font-size: 40px;" class="icon-list"></i> Ledger </a></li>
					   </core:if>	  
					</ul>
              </div>
            </div>           
	
	   </div><!-- #site-canvas -->

    </div><!-- #site-wrapper> -->





<jsp:include page="/WEB-INF/pages/footerInside.jsp"/>
</body>
</html>