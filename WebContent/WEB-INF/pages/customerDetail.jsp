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
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</head>
<body>
<div class="loginback">
<div>
<h3 class="page-title">
							Customer Ledger <small>It shows the Customer purchase and payment history</small>
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
							<li><a href="#">Customer Ledger</a></li>
						</ul>
</div>						
<div class="tablecontent" style="float:center;">
<table width="100%"  class="textStyle" >
<core:if test="${ORDER_FOUND eq null }">
<tr >
<td align="center">
<font color="blue" size="5"> Order Information not found </font>
</td></tr>
</core:if>

<core:if test="${ORDER_FOUND ne null }">
<tr bgcolor="#404040">
	<td class="textStyle" align="center" colspan="7">
	    <font style="float:left; font-size:120%;" color="yellow"><font color="white" >Shop Name : </font>${SHOP_NAME} </font>
	    <a style="float:right; color:blue; font:times New romans;font-size:120%; " href="listofcustomers.vpb">Back</a>
    </td>
</tr>
<tr bgcolor="grey">
<td align="center"><font color="white" > Sr.No. </font></td>
<td align="center"><font color="white" > Bill No.</font></td>
<td align="center"><font color="white" > Billing Date </font></td>
<td align="center"><font color="white" > Bill Amount </font></td>
<td align="center"><font color="white" > Amount Paid </font></td>
<td align="center"><font color="white" > Return </font></td>
<td align="center"><font color="white" > Due Amount </font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff"; 
%>
<core:forEach var="oto" items="${ORDER_FOUND }">
<%
++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>
<tr bgcolor="<%=color%>">
<td align="center">
<font ><%=i %></font>
</td>
<td align="center">
<form action="showorderinfo.vpb" method="post">
<input type="hidden" value="${oto.orderId }" name="orderId"/>
<input type="hidden" value="customerDetailDef.jsp" name="page"/>
<input type="hidden" value="${oto.userId}" name="userid"/>
<input type="hidden" value="${oto.shopName}" name="shopName"/>
<core:if test="${oto.billNumber eq 0 }">
<input type="submit" value="${oto.orderId }" class="tableButton"/>
</core:if>
<core:if test="${oto.billNumber ne 0 and oto.grandTotal ne 0}">M-${oto.billNumber}</core:if>
<core:if test="${oto.billNumber ne 0 and oto.grandTotal eq 0 and oto.amountPaid ne 0}">C-${oto.billNumber}</core:if>
<core:if test="${oto.billNumber ne 0 and oto.grandTotal eq 0 and oto.amountPaid eq 0}">R-${oto.billNumber}</core:if>

</form>
</td>

<td align="center">
<font > ${oto.orderDate }  </font>
</td>
<td align="center">
<font face="Rupee Foradian"></font><font > <nitesh:fmtToIndianCurrency value="${oto.grandTotal }"/>  </font>
</td>

<td align="center">
<font><nitesh:fmtToIndianCurrency value="${oto.amountPaid }"/></font>
<font style="float: right;">
  <core:if test="${oto.paymentMode eq 'bycash' }"> <i class="icon-money"></i> </core:if>
  <core:if test="${(oto.paymentMode eq '') and (oto.amountPaid gt 0)}"> <i class="icon-money"></i> </core:if>
  <core:if test="${oto.paymentMode eq 'bycheque' }"> <i class="fa fa-check-square"></i> </core:if>
  <core:if test="${oto.paymentMode eq 'bybank' }"> <i class="fa fa-bank"></i> </core:if>
</font>  
</td>

<td align="center">
<font  face="Rupee Foradian"></font><font  > <nitesh:fmtToIndianCurrency value="${oto.returnAmount }"/> </font>
</td>

<td align="center">
<font  face="Rupee Foradian"></font><font >
   <core:if test="${(KHATA eq 'vpb_70_71') || (KHATA eq 'vpb_acadmic_71_72') }"><nitesh:fmtToIndianCurrency value="${oto.dueAmount }"/></core:if> 
   <core:if test="${(GET_OPENING_BALANCE eq null) && (KHATA ne 'vpb_70_71') && (KHATA ne 'vpb_acadmic_71_72') }"><nitesh:fmtToIndianCurrency value="${oto.dueAmount }"/></core:if>
   <core:if test="${(GET_OPENING_BALANCE ne null) && (KHATA ne 'vpb_70_71') && (KHATA ne 'vpb_acadmic_71_72') }"> <nitesh:fmtToIndianCurrency value="${GET_OPENING_BALANCE+ oto.dueAmount}"/></core:if> </font>
</td>
</tr>
</core:forEach>
<core:if test="${(GET_OPENING_BALANCE ne null) && ((KHATA ne 'vpb_70_71') && (KHATA ne 'vpb_acadmic_71_72') ) }">
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" > Total  </font>
</td>

<td align="center">
 <font color="white" >
  <nitesh:fmtToIndianCurrency value="${TOTAL_BILL}"/>
 </font>
</td>
<td align="center">
 <font color="white" >
  <nitesh:fmtToIndianCurrency value="${TOTAL_PAID}"/>
 </font> 
</td>
<td align="center">
  <font color="white" >
   <nitesh:fmtToIndianCurrency value="${TOTAL_RETURN}"/>
  </font> 
</td>
<td align="center">
  <font color="white" > 
   <nitesh:fmtToIndianCurrency  value="${(TOTAL_BILL) - (TOTAL_PAID + TOTAL_RETURN)}" />
  </font> 
</td>
</tr>
<tr bgcolor="grey">
   <td colspan="6" align="right">
    <font color="white" > Opening Balance  </font>
   </td> 
   <td align="center">
   <font color="white" >
     <nitesh:fmtToIndianCurrency  value="${GET_OPENING_BALANCE}" />
   </font>  
   </td>
</tr>
<tr bgcolor="grey">
   <td colspan="6" align="right">
    <font color="white" > Grand Total  </font>
   </td> 
   <td align="center">
    <font color="white" >
     <nitesh:fmtToIndianCurrency  value="${(((TOTAL_BILL) - (TOTAL_PAID + TOTAL_RETURN)) + GET_OPENING_BALANCE)}" />
    </font> 
   </td>
</tr>
</core:if>
<core:if test="${(GET_OPENING_BALANCE eq null) && ((KHATA ne 'vpb_70_71') && (KHATA ne 'vpb_acadmic_71_72') )  }">
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" > Total  </font>
</td>

<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_BILL}" />
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_PAID}" />
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_RETURN}" />
</font>  
</td>
<td align="center">
<font color="white" >
 <nitesh:fmtToIndianCurrency  value="${(TOTAL_BILL - TOTAL_PAID)-TOTAL_RETURN}" />
</font> 
</td>
</tr>
</core:if>
<core:if test="${(KHATA eq 'vpb_70_71') || (KHATA eq 'vpb_acadmic_71_72') }">
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" > Total  </font>
</td>

<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_BILL}" />
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_PAID}" />
</font>  
</td>
<td align="center">
<font color="white" >
  <nitesh:fmtToIndianCurrency  value="${TOTAL_RETURN}" />
</font>  
</td>
<td align="center">
<font color="white" >
 <nitesh:fmtToIndianCurrency  value="${(TOTAL_BILL - TOTAL_PAID)-TOTAL_RETURN}" />
</font> 
</td>
</tr>
</core:if>
</core:if>
</table>
<br/>
<div align="center">
<core:if test="${ORDER_TO ne null }">
<table width="90%" cellspacing="0" class="textStyle" border="1">
<tr bgcolor="#404040">
<td align="center" colspan="7" >
<font color="white" > Information about the order with id <font color="white">${ORDER_TO.orderId}</font></font>
</td>
</tr>

<tr bgcolor="grey">
<td align="center" colspan="2">
<font color="white"> Address </font>
</td>

<td align="center">
<font color="white"> Street </font>
</td>

<td align="center">
<font color="white"> City </font>
</td>


<td align="center">
<font color="white"> Order Date </font>
</td>

<td align="center">
<font color="white"> Opening Balance </font>
</td>
</tr>

<tr>
<td align="center"  colspan="2"><font >${ORDER_TO.address }</font></td>
<td align="center" ><font >${ORDER_TO.street }</font></td>
<td align="center" ><font >${ORDER_TO.city }</font></td>
<td align="center" ><font>${ORDER_TO.orderDate }</font>
<td align="center" ><font >${((ORDER_TO.dueAmount + GET_OPENING_BALANCE)  +ORDER_TO.amountPaid )-ORDER_TO.grandTotal }0</font>
</td>
</tr>
</table>
<font >Items Detail</font>
<table align="center" width="50%" cellspacing="0" border="1">
<tr bgcolor="#404040">
<td align="center" ><font color="white" >Sr.No</font></td>
<td align="center" ><font color="white" >Description</font></td>
<td align="center" ><font color="white" >Rate</font></td>
<td align="center" ><font color="white" >Qty</font></td>
<td align="center" ><font color="white" >Amount</font></td>
<td align="center" ><font color="white" >%</font></td>
<td align="center" ><font color="white" >Discount Total</font></td>
</tr>

<%
int i=0;
int x=-1;          String color="#fdeaff";
%>

<core:forEach var="bto" items="${ORDERKOLIST}">
<% ++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>

<tr bgcolor="<%=color%>">
<td align="center">
<font><%=i %></font>
</td>
<td align="left">
<font > ${bto.bookName }  </font>
</td>

<td align="center">
<font face="Rupee Foradian"></font><font > ${bto.cost }/-  </font>
</td>

<td align="center">
<font> ${bto.selectedNumberOfBook }  </font>
</td>

<td align="right">
<font face="Rupee Foradian"></font><font >
<nitesh:displayBookTotalAmount value="${bto.cost *bto.selectedNumberOfBook }" quantity="${bto.selectedNumberOfBook}"/>/-</font>
</td>
<td align="right">
<font  face="Rupee Foradian">${bto.discountPercentage }</font>
</td>
<td align="right" class="line">
<font >
  <nitesh:displayDiscountAmount value="${(bto.cost*bto.selectedNumberOfBook)-((bto.discountPercentage/100)*(bto.cost*bto.selectedNumberOfBook))}" /></font>
</td>
</tr>
</core:forEach>
<tr bgcolor="#dee1fe" class="total">
<td colspan="6" align="right" class="borderleft">Total:</td>
<td align="right" class="borderright">
<font  face="Rupee Foradian"><nitesh:displayDiscountTotal/></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="5" align="right" class="borderleft">Extra:</td>
<td align="right">${EXTRA_PERCENTAGE}%</td>
<td align="right" class="borderright">
<font face="Rupee Foradian"><nitesh:doubleConverter value="${TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100)}"/></font>
</td>
</tr>
<tr bgcolor="#e1ffde"><td colspan="6" align="right" class="borderleft">Fright:</td>
<td align="right" class="borderright">
<font  face="Rupee Foradian">${FRIGHT_AMOUNT }</font>
</td>
</tr>
<tr bgcolor="#dee1fe" class="grandtotal"><td colspan="6" align="right" class="borderleft">Grand Total:</td>
<td align="right" class="borderright">
<font  face="Rupee Foradian"><nitesh:doubleConverter value="${(TOTAL_BOOK_DISCOUNT_AMOUNT+FRIGHT_AMOUNT)-(TOTAL_BOOK_DISCOUNT_AMOUNT*(EXTRA_PERCENTAGE/100))}"/></font>
</td>
</tr>
<tr bgcolor="grey">
<td colspan="3" align="right">
<font color="white" > Total  </font>
</td>

<td align="center">
<font color="" > ${TOTAL_BOOK_QUANTITY}  </font>
</td>
<td align="right">
<font  face="Rupee Foradian"><nitesh:displayTotalAmount/>/-</font>
</td>
</tr>
</table>
</core:if>
</div>
</div>
</div>
</body>
</html>