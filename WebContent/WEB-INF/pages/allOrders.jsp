<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.book.shop.to.*" %>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />

<link href="css/scrollingTable_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>

<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</head>

<body>
<div class="loginback" style="width: 100%; margin: 10px auto;" >
<div>
<h3 class="page-title">
  All Transaction <small>It shows customers complete list of transaction</small>
</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							   <li><a href="#">All Transaction</a></li>
						</ul>
  </div>

  

	<table bgcolor="#404040" width="100%" class="textStyle">
		<core:if test="${ORDER_FOUND eq null}">
			<tr bgcolor="#404040">
				<td align="center">
				  <font color="black" > We have no any Order....</font>
				</td>
			</tr>
		</core:if>
	
	   <core:if test="${ORDER_FOUND ne null}">
			<tr bgcolor="#5D6C5E">
				<td class="textStyle" align="center" colspan="7">
				  <font style="float:center; font-size:120%;" color="white"> All Transaction </font>
				</td>
			</tr>
	  </core:if>
	 </table>
	 
	 <table class="tbl1 scroll"> 
	       <thead>
	        <core:if test="${ORDER_FOUND ne null}">
			    <tr bgcolor="#A3C2EA">
				    <th ><font  color="white" > Bill# </font></th>
					<th ><font  color="white" > BillDate </font></th>
					<th ><font  color="white" > ShopName </font></th>
					<th ><font  color="white" > BillAmt </font></th>
					<th ><font  color="white" > Payment </font></th>
					<th ><font  color="white" > Return</font></th>
					<th ><font  color="white" > DueAmt </font></th>
				</tr>
		    </core:if>
		   </thead>
		   
		  <tbody>
			<core:if test="${ORDER_FOUND ne null}">	
			
				<%int x=-1; String color="#fdeaff";
				%>
				<core:forEach var="oto" items="${ORDER_FOUND }">
				<%
				x++;
				if(x==3)   x=0;
				if(x==0)   color="#fdeaff";
				else if(x==1)   color="#dee1fe";
				else if(x==2)   color="#e1ffde";
				%>
				<tr bgcolor="<%=color%>">
				
				<td >
					<core:if test="${oto.billNumber eq 0 }">${oto.orderId }</core:if>
					<core:if test="${oto.billNumber ne 0 and oto.grandTotal ne 0}">M-${oto.billNumber}</core:if>
					<core:if test="${oto.billNumber ne 0 and oto.grandTotal eq 0 and oto.amountPaid ne 0}">C-${oto.billNumber}</core:if>
					<core:if test="${oto.billNumber ne 0 and oto.grandTotal eq 0 and oto.amountPaid eq 0}">R-${oto.billNumber}</core:if>
			    </td>
				
				<td align="justify">
					<font >${oto.orderDate }</font>
				</td>
				
				<td >
					<font >${oto.shopName }</font>
			    </td>
				
				<td >
				    <font  ><nitesh:fmtToIndianCurrency value="${oto.grandTotal }"/></font>
				</td>
				
				<td class="rupee">
					<font  ><nitesh:fmtToIndianCurrency value="${oto.amountPaid }"/></font>
				</td>
			    
			    <td class="rupee" style="min-width: 30px;">
					<font  ><nitesh:fmtToIndianCurrency value="${oto.returnAmount }"/></font>
				</td>
				
				<td class="rupee">
					<font  ><nitesh:fmtToIndianCurrency value="${oto.dueAmount }"/></font>
				</td>
			
				</tr>
				</core:forEach>
			</core:if>
		</tbody>
	</table>
	<table bgcolor="#A3C2EA" width="100%" class="textStyle">
			<tr bgcolor="#A3C2EA">
				<td align="center">
				  <font color="#A3C2EA" > End</font>
				</td>
			</tr>
	 </table>	 
	
  </div> 
  
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script> 
	<script type="text/javascript" src="js/scrolltable.js"></script>
	<script type="text/javascript">

	    $(document).ready(function() {
			/* zebra stripe the tables (not necessary for scrolling) */
	        var tbl = $("table.tbl1");
	        addZebraStripe(tbl);
	        addMouseOver(tbl);
			
			/* make the table scrollable with a fixed header */
	        $("table.scroll").createScrollableTable({
	            width: '80%',
	            height: '400px'
	        });

	    });

	    
	    
	    
	    
	    function addZebraStripe(table) {
            table.find("tbody tr:odd").addClass("alt");
        }

        function addMouseOver(table) {
            table.find("tbody tr").hover(
                    function() {
                        $(this).addClass("over");
                    },
                    function() {
                        $(this).removeClass("over");
                    }
                );
        }

	</script>
  
</body>
</html>