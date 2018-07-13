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

<script src="js1/jquery.backstretch-min.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</head>
<body>
<div class="loginback" style="width: 100%; margin: 10px auto;" >
<div>
<h3 class="page-title">
  Ledger BalanceSheet <small>It shows Customers ledger balance details</small>
</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<core:if test="${ADD_OPENING eq true }">
							<li>
								<a href="listofcustomers.vpb">Customers List</a>
								<span class="icon-angle-right"></span>
							</li>
							</core:if>
							   <li><a href="#">Ledger Balance Sheet</a></li>
						</ul>
</div>						


<table bgcolor="#5D6C5E" width="100%" class="textStyle">
	<core:if test="${OPENING_BALANCE eq null }">
		<tr >
			<td align="center">
			<font color="blue" size="5"> Ledger Balance Sheet not found </font>
			</td>
		</tr>
	</core:if>

	<core:if test="${OPENING_BALANCE ne null }">
	<tr bgcolor="#5D6C5E">
		<core:if test="${KHATA eq 'vpb_70_71' }">
			<td class="textStyle" align="center" colspan="3">
			<font style="float:center; font-size:120%;" color="white">70-71 Ledger Balance Sheet </font>
			<core:if test="${ADD_OPENING eq true }">
			<a style="float:right; color:blue; font:times New romans;font-size:120%; " href="listofcustomers.vpb">Back</a>
			</core:if>
			</td>
		</core:if>
	
		<core:if test="${KHATA eq 'vpb_71_72' }">
		<td class="textStyle" align="center" colspan="3">
		<font style="float:center; font-size:120%;" color="white">71-72 Ledger Balance Sheet </font>
		<core:if test="${ADD_OPENING eq true }">
		<a style="float:right; color:blue; font:times New romans;font-size:120%; " href="listofcustomers.vpb">Back</a>
		</core:if>
		</td>
		</core:if>
		
		<core:if test="${KHATA eq 'vpb_acadmic_71_72' }">
		<td class="textStyle" align="center" colspan="3">
		<font style="float:center; font-size:120%;" color="white">Academic 71-72 Ledger Balance Sheet </font>
		<core:if test="${ADD_OPENING eq true }">
		<a style="float:right; color:blue; font:times New romans;font-size:120%; " href="listofcustomers.vpb">Back</a>
		</core:if>
		</td>
		</core:if>
   </tr>
   </core:if>
   
</table>

   
   
<table class="tbl1 scroll"> 
  <thead>
	<core:if test="${OPENING_BALANCE ne null }">
	<tr bgcolor="#A3C2EA" >
		<th align="left"><font color="white" > S.No </font></th>
		<th align="left"><font color="white" > Shop Name </font></th>
		<core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
	    	<th align="right" ><font color="white" > Opening Balance</font></th>
		</core:if>
		<th align="center"><font color="white" > Current Balance</font></th>
		<th align="center"><font color="white" > Total Balance</font></th>
	</tr>
	</core:if>
  </thead>	
  
  
  <tbody>
	<core:if test="${OPENING_BALANCE ne null }">
		<%
		int i=0;
		int x=-1;          String color="#fdeaff"; 
		%>
			<core:forEach var="uinfoto" items="${OPENING_BALANCE }">
			<%
			++i;            x++;
			if(x==3)        x=0;
			if(x==0)        color="#fdeaff";
			else if(x==1)        color="#dee1fe";
			else if(x==2)        color="#e1ffde";
			%>
			<tr bgcolor="<%=color%>">
			<td align="center" style="min-width: 26px;">
			<font ><%=i %></font>
			</td>
			<td align="left">
			<font></font><font > ${uinfoto.shopName }  </font>
			</td>
			<core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
			<td align="left" style="min-width: 80px;">
			<font ><nitesh:fmtToIndianCurrency value="${uinfoto.openingBalance }" /> </font>
			</td>
			</core:if>
			<core:if test="${uinfoto.dueAmount lt 0}">
			  <td align="center">
			<font color="green" ><nitesh:fmtToIndianCurrency value="${uinfoto.dueAmount * -1}" /> </font>
			</td>
		</core:if>
		
		<core:if test="${uinfoto.dueAmount gt 0 || uinfoto.dueAmount eq 0}">
		  <td align="center">
		<font color="red" ><nitesh:fmtToIndianCurrency value="${uinfoto.dueAmount }" /> </font>
		</td>
		</core:if>
		
		<core:if test="${KHATA eq 'vpb_acadmic_71_72' }">
		   <td align="center" style="min-width: 26px;">
			<font ><nitesh:fmtToIndianCurrency value="${uinfoto.totalDue - uinfoto.openingBalance }" /> </font>
		   </td>
		</core:if>
		
		<core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
		   <td align="center">
			<font ><nitesh:fmtToIndianCurrency value="${uinfoto.totalDue }" /> </font>
		   </td>
		</core:if>
		
		
		</tr>
		</core:forEach>
	</core:if>
  </tbody>
  
</table>

<table  width="100%" class="textStyle">

  	 <core:if test="${OPENING_BALANCE ne null }">
  	 
  	    <core:if test="${KHATA eq 'vpb_acadmic_71_72' }">
  	       <tr bgcolor="#A3C2EA">
			<td align="right" colspan="4"><font color="white" >Total Ledger Balance :</font></td>
			<core:if test="${TOTAL_DUE_AMOUNT lt 0}">
			   <td align="right"><font color="green" ><nitesh:fmtToIndianCurrency value="${TOTAL_DUE_AMOUNT * -1}" /></font></td>
			</core:if>
			
			<core:if test="${TOTAL_DUE_AMOUNT gt 0}">
			   <td align="right"><font color="white" ><nitesh:fmtToIndianCurrency value="${TOTAL_DUE_AMOUNT}" /></font></td>
			</core:if>
			
			<td align="center" ><font color="white" ><nitesh:fmtToIndianCurrency value="${TOTAL_BALANCE - TOTAL_OPENING_BALANCE}" /></font></td>
		  </tr>
  	    </core:if>
  	    
  	    <core:if test="${KHATA ne 'vpb_acadmic_71_72' }">
  	       <tr bgcolor="#A3C2EA">
			<td align="right" colspan="3"><font color="white" >Total Ledger Balance :</font></td>
			<td align="right" style="min-width: 26px;"><font color="white" ><nitesh:fmtToIndianCurrency value="${TOTAL_OPENING_BALANCE}" /></font></td>
			
			<core:if test="${TOTAL_DUE_AMOUNT lt 0}">
			   <td align="right" style="min-width: 26px;"><font color="green" ><nitesh:fmtToIndianCurrency value="${TOTAL_DUE_AMOUNT * -1}" /></font></td>
			</core:if>
			
			<core:if test="${TOTAL_DUE_AMOUNT gt 0}">
			   <td align="right" style="min-width: 26px;"><font color="white" ><nitesh:fmtToIndianCurrency value="${TOTAL_DUE_AMOUNT}" /></font></td>
			</core:if>
			
			<td align="center"><font color="white" ><nitesh:fmtToIndianCurrency value="${TOTAL_BALANCE}" /></font></td>
		  </tr>
  	    </core:if>
  	    
  	    
		
	</core:if>
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