<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page import="com.book.shop.to.*" %>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>
<link rel="stylesheet" href="http://keith-wood.name/css/jquery.calendars.picker.css" id="theme">
<link rel="stylesheet" href="http://keith-wood.name/themesDemo/south-street/jquery-ui.css" id="themeUI">
<link rel="stylesheet" href="http://keith-wood.name/css/ui-south-street.calendars.picker.css" id="themeTR">
	<link rel="stylesheet" type="text/css" href="css/jquery.calendars.picker.css"> 
	<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
  
  <style>
  
 
 form.register{
    width:100%;
    padding:0px;
    margin-top: -40px;
}
 
    form p{
    font-size: 8pt;
    clear:both;
    margin: 0;
    color:gray;
    padding:4px;
}

.register .form label{
    float: left;
    text-align: left;
    margin-right: 8px;
    margin-top:0px;
    width:auto;
}
.register .form input{
	width:100px;
}
.form td{
	border-right:1px solid #F1F1F1;
	border-top:1px solid #F1F1F1;
	border-bottom:1px solid #F1F1F1;
	border-left:0px solid #F1F1F1;
	padding:2px;
	margin:0;
}
  </style>
  <script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</body>
</head>
<body>
<div class="loginback">
<div>
<h3 class="page-title" >
							Add Opening Balance <small >here we can add previous year ledger Balance</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="listofcustomers.vpb">Customers List</a>
								<span class="icon-angle-right"></span>
							</li>
							<li>
								<a href="#">Add Opening Balance</a>
						   </li>		
						</ul>
</div>		
<div align="center">
<form action="addOpeningBalance.vpb" class="register" method="post">		
				
               <table  class="textStyle form" align="center">
                  <tbody>
                    						 
					<tr>
                      <p>
						 <td>
							<label style=" for="BX_publication">Ledger Year</label>
						 </td>
						 <td>	
							<select name="ledgeryear">
							  <option value="70-71" >70-71</option>
							</select>
						</td>
						
						 </p>
						 </tr>
					<tr>	 
						 <p>
						 
					   <td>
							<label style="for="BX_quantity">Opening Balance</label>
					   </td>
						 <td>		
							<input type="text"  required="required" name="openingbalance">
					   </td>				   
					  
					   
							</p>
                    </tr>
                    
                    </tbody>
                </table>
                <table >
                <tr>                
                <td colspan="5" align="center">
                        <input type="hidden" value="${SHOP_NAME }" name="shopname"/>
                        <input class="btn blue" type="submit" value="Add Balance &raquo;"/>
                    </td></tr> 
                </table>
				<div class="clear"></div>



</form>
</div>
</div>
<script type="text/javascript" src="js/jquery.calendars.js"></script> 
<script type="text/javascript" src="js/jquery.calendars.plus.js"></script>
<script type="text/javascript" src="js/jquery.plugin.js"></script> 
<script type="text/javascript" src="js/jquery.calendars.picker.js"></script>
<script type="text/javascript" src="js/jquery.calendars.nepali.js"></script>
<script>
  $(selector).calendarsPicker({calendar: $.calendars.instance('nepali')});
</script>

</html>