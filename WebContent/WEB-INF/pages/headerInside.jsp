<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css1/foundation.css" />
<link rel="stylesheet" type="text/css" href="css1/jquery.mobile-1.4.2.css" />
<link rel="stylesheet" type="text/css" href="css1/style.css" />
<link rel="stylesheet" type="text/css" href="css1/font-awesome-min.css" />
  
<link rel="stylesheet" type="text/css" href="css1/style1.css" />	
<link rel="stylesheet" type="text/css" href="css1/fonts.googleapis.css" />
<link rel="stylesheet" type="text/css"  href="<%=request.getContextPath()%>/css1/slide-dropdownmenu.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
</head>
<body>

 <div class="heal"  >
 <a style="float:left; font-size:200%; text-decoration:none;" href="#" class="toggle-nav" id="big-sexy"><i class="icon-bar"></i><strong> VPB</strong></a>
  
  <table style="float:right;" class="textStyle">
<tr><td>
         <font color="yellow" ><b> Welcome! &nbsp;<font color="white"> ${USER_TO.shopName} </font><core:if test="${USER_TO.role eq 'Admin'}">&nbsp;Admin </core:if></b></font>
    </td>     
	<td>	    

		<ul>	
			<li  style="margin-bottom: -11px;"  class="dropdown" >
				<img class="topview" src="img/userlogo.png"/>
				
				<div class="dropdownContain">
					<div class="dropOut">
						<div class="triangle"></div>
						<ul>
							<li class="profile" ><a style="text-decoration: none;" href="detailsDef.jsp"><i class="icon-user"></i>  Profile</a></li>
							<li class="profile"><a style="text-decoration: none;" href="changePasswordDef.jsp"><i class="icon-lock"></i>  Change Password</a></li>
							<li class="profile"><a style="text-decoration: none;" href="logout.vpb"><i class="icon-key"></i> Log Out</a></li>
						</ul>
					</div>
				</div>
			
			</li>
	 </ul>
	 </td>
	 </tr>				
	</table>		
  </div>  
</body>
 <script type="text/javascript" src="js/jquery.js"></script> 
<script>
	  /*====================================
=            ON DOM READY            =
====================================*/
$(function() {
    $('.toggle-nav').click(function() {
        // Calling a function in case you want to expand upon this.
        toggleNav();
    });
});


/*========================================
=            CUSTOM FUNCTIONS            =
========================================*/
function toggleNav() {
    if ($('#site-wrapper').hasClass('show-nav')) {
        // Do things on Nav Close
        $('#site-wrapper').removeClass('show-nav');
    } else {
        // Do things on Nav Open
        $('#site-wrapper').addClass('show-nav');
    }

    //$('#site-wrapper').toggleClass('show-nav');
}
	  
	</script>
</html>