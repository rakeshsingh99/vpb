<%@ taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> Viddarthi Pustak Bhandar</title>
</head>
<body bgcolor="lightgrey">
<nitesh:validateSession/>
<nitesh:removeSearchInfoFromSession/>

<jsp:include page="/WEB-INF/pages/headerInside.jsp"/>

<div id="site-wrapper">
        <div  id="site-canvas">   
               <jsp:include page="/WEB-INF/pages/customerDetail.jsp"/>
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