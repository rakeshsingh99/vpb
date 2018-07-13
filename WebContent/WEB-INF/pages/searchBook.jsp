<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="vpb" %>
<%@taglib uri="/WEB-INF/nk.tld" prefix="rakesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<%@page import="com.book.shop.to.*" %>
<%@ page language="java" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width" />
<link rel="stylesheet" type="text/css" href="css1/dynamic-size.css"/>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/metro.css">
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  
</head>

<style>
 /** select form **/
select 
{
	display: block;
	position: relative;
	height: 2.0em;
	padding: 0px;
	width: 100%;
	font-size: 0.875em;
	margin-bottom: 0.5em;
	direction: ltr;
	-moz-box-sizing: border-box;
	font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
	line-height: 2.25em;
	background: linear-gradient(to bottom, white 0%, rgb(243, 243, 243) 100%) repeat scroll 0% 0% transparent;
	border: 1px solid rgb(204, 204, 204);
}
</style>
<body>
<div class="loginback">
<div>
<h3 class="page-title">
							Search <small>Here we can search books and place an order</small>
						</h3>
						<ul class="breadcrumb">
							<li>
								<i class="icon-home"></i>
								<a href="userHomeDef.jsp">Home</a> 
								<span class="icon-angle-right"></span>
							</li>
							<li>
							    <i class="icon-search"></i>
								<a href="#">Search</a>
							</li>
						</ul>
</div>	
<div class="tablecontent" align="center">
<table width="100%"  class="textStyle">
<tr bgcolor="#404040">
	<td  align="center" colspan="6">
		<font style="float:center; font-size:120%;" color="white"><b> Search Book </b></font>
		<a style="float:right; font-size:120%;" class="btn green" href="manualAddBookDef.jsp">Add to Database</a>
		</td>
</tr>
<core:if test="${searchingBookError ne null }">
<tr bgcolor="lightyellow">
<td align="center" colspan="6" >
<b><font color="red"><b><vpb:error property="searchingBookError"/></b> </font></b>
</td></tr>
</core:if>
</table>
<form action="searchBook.vpb" method="post" >
  <table class="textStyle"  align="center" >
   <tr valign="top">

		<td align="center"><b> Publication </b>
		
		<vpb:showPublication/>
		</td>
		
		<td align="center"><b> Book Name </b>        
		        <select  id="BX_publication"  name="bname">
										<option value="">Select</option>
										<option value="English">English</option>
										<option value="Nepali-">Nepali</option>
										<option value="Math">Math</option>
										<option value="Science">Science</option>
										<option value="EnglishGrammer">EnglishGrammer</option>
										<option value="Nepali.Byakaran">Nepali.Byakaran</option>
										<option value="OptMath">Opt Math</option>
										<option value="SpeedyOptMath">SpeedyOptMath</option>
										<option value="G.K">G.K</option>
										<option value="Computer">Computer</option>
										<option value="MoralScience">Moral Science</option>
										<option value="SocialStudy">Social Study</option>
										<option value="Math">Math</option>
										<option value="SpeedyMath">SpeedyMath</option>
										<option value="Conversation">Conversation</option>
										<option value="SpeedyMath">SpeedyMath</option>
										<option value="Curssive">Curssive</option>
										<option value="Drawing">Drawing</option>
										<option value="Population">Population</option>
										<option value="MajorEnglish">MajorEnglish</option>
										<option value="Capital Letter">Capital Letter</option>
										<option value="Small Letter">Small Letter</option>
										<option value="Number Book">Number Book</option>
										<option value="Headway">Headway</option>
										<option value="English(WB)">English(WB)</option>
										<option value="Nepali Padha Lekh rang bhara">Nepali Padha Lekh rang bhara</option>
										<option value="All in One">All in One</option>
										<option value="All in One(WB)">All in One(WB)</option>
										<option value="All in One(1st)">All in One(1st)</option>
										<option value="All in One(2nd)">All in One(2nd)</option>
										<option value="All in One(3rd)">All in One(3rd)</option>
										<option value="Health&Phy">Health&Phy</option>
										<option value="Occupation">Occupation</option>
										<option value="Headway">Headway</option>
										<option value="Kit">Kit</option>
										<option value="PositiveLiving">PositiveLiving</option>
										<option value="DelightEngish">DelightEngish</option>
										<option value="Atlas">Atlas</option>
										<option value="Account">Account</option>
										<option value="Read&Write(U/L)">Read&Write(U/L)</option>
										<option value="Read&Write(A/W)">Read&Write(A/W)</option>
										<option value="Calender">Calender</option>
										<option value="Table">Table</option>
										<option value="Rem.English">Rem.English</option>
										<option value="Marketing">Marketing</option>
										<option value="Child Development">Child Development</option>
										<option value="Priciple of Accounting-E">Priciple of Accounting-E</option>
									</select>
		        
		        
		</td>
		
		<td align="center"><b> Class </b>
		
		<select  name="class" id="BX_class" >
										<option value="">Select</option>
										<option value="PP">Pre-Primer</option>
										<option value="P">Primer</option>
										<option value="NUR">Nursery</option>
										<option value="LKG">LKG</option>
										<option value="UKG">UKG</option>
										<option value="L/U">L/U</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="KA">KA</option>
										<option value="KHA">KHA</option>
										<option value="GA">GA</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
										<option value="BBS 1yr">BBS 1yr</option>
										<option value="BBS 2yr">BBS 2yr</option>
										<option value="BBS 3yr">BBS 3yr</option>
										<option value="B.Ed 1yr">B.Ed 1yr</option>
										<option value="B.Ed 2yr">B.Ed 2yr</option>
										<option value="B.Ed 3yr">B.Ed 3yr</option>
										
									</select>
		</td>


  </tr>
  
  <tr>
	<td align="center" colspan="6">
	<input type="submit" class="btn blue" value="Search" />
	</td>
</tr>
 </table>
</form>


<core:if test="${BOOK_LIST ne null }">
<form action="sortInfo.vpb" method="post">
<table width="90%">
<tr>
<td  align="left">
<vpb:showSortField/>
</td>
<td align="left">
<vpb:showSortOrder/>
</td>

<td align="left">
<input type="submit" class="btn blue" value=" Sort "/>
</td>

<td align="left">
<font  color="red"><vpb:error property="sortingError"/></font>
</td>

<td colspan="6" align="right">
<font color="green" ><b> ${START+1} to ${END} of ${TOTAL} </b></font>
</td>
</tr>
</table>
</form>

<table width="90%" style="font-family:Open Sans;">

<core:if test="${DELETE_MESSAGE ne null }">
<tr>
<td colspan="6" align="center" bgcolor="lightyellow">
<font color="red" ><b> ${DELETE_MESSAGE} </b></font>
</td>
</tr>
</core:if>

<core:if test="${ADDED_TO_CART_MESSAGE ne null }">
<tr>
<td colspan="6" align="center" bgcolor="lightyellow">
<b><font color="black" >${ADDED_BOOK.bookName}</font>
   <font color="red" > added to cart.Quantity of <font color="black">${ADDED_BOOK.bookName}</font> is <font color="green">
   ${ADDED_BOOK.selectedNumberOfBook}</font></font> </b>
</td>
</tr>
</core:if>

<core:if test="${REMOVED_TOTAL ne null }">
<tr>
<td colspan="6" align="center" bgcolor="lightyellow">
<font color="red"><b> ${REMOVED_TOTAL} </b></font>
</td>
</tr>
</core:if>

<tr bgcolor="grey">
<td align="center">
<font color="white"><b> Sr.No </b></font>
</td>

<td align="center">
<font color="white"><b> Book Name </b></font>
</td>

<td align="center">
<font color="white"><b> Class </b></font>
</td>

<td align="center">
<font color="white"><b> Stock </b></font>
</td>

<core:if test="${SELECTED_BOOK_LIST eq null }">
<td colspan="1" align="center" >
<font color="white"><b> Cost </b></font>
</td>
</core:if>

<core:if test="${SELECTED_BOOK_LIST ne null }">
<td colspan="1" align="center" >
<font color="white" ><b> Cost </b></font>
</td>
</core:if>
<core:if test="${SELECTED_BOOK_LIST ne null }">
<td bgcolor="grey" align="center" >
<a  href="showCartDef.jsp"><font class="textStyle" color="blue" ><b > Show My Cart </b></font></a>
</td>
</core:if>


<%
int i=Integer.parseInt(session.getAttribute("START").toString());
int x=-1;          String color="#fdeaff"; 
%>
<core:forEach var="bto" items="${BOOK_LIST }">
<%
++i;            x++;
if(x==3)        x=0;
if(x==0)        color="#fdeaff";
else if(x==1)        color="#dee1fe";
else if(x==2)        color="#e1ffde";
%>
<tr bgcolor="<%=color%>">
<td align="center"><font ><%=i %></font></td>
<td align="left"><font > ${bto.bookName}</font></td>
<td align="center"><font > ${bto.cclass}</font></td>
<td align="center"><font > ${bto.quantity}</font></td>
<td align="center"><font face="Rupee Foradian"></font><font ><b>${bto.cost }/-</b></font></td>
<core:if test="${ADDED_BOOK.bookId ne bto.bookId}">
<td colspan="1" align="center">
<core:if test="${USER_TO.role eq 'Admin' && BILLING_CUSTOMER_NAME eq null}">
<form action="delete.vpb" method="post">
<input type="hidden" name="bookId" value="${bto.bookId }">
<input type="submit" value="Delete">
</form>
</core:if> 
<core:if test="${USER_TO.role eq 'Admin' && BILLING_CUSTOMER_NAME ne null}">
<form action="addtocart.vpb" method="post">
<input type="hidden" name="bookId" value="${bto.bookId }">
<input  type="hidden" name="stock" value="${bto.quantity }">
<input style="width:40px" type="text" required="required" name="quantityNeed" placeholder="Qty" >
<input type="submit" value="Add">
</form>
</core:if>      
<%-- <core:if test="${USER_TO.role eq 'User'}">
<form action="addtocart.vpb" method="post">
<input type="hidden" name="bookId" value="${bto.bookId }">
<input  type="hidden" name="stock" value="${bto.quantity }">
<input style="width:40px" type="text" required="required" name="quantityNeed" placeholder="Qty" >
<input type="submit" value="Add">
</form>
</core:if> --%>
</td>
</core:if>
<core:if test="${ADDED_BOOK.bookId eq bto.bookId}">
<td colspan="1" align="center">
<font color="grey"><b> Added ${ADDED_BOOK.selectedNumberOfBook }</b></font>
</td>
</core:if>
<core:if test="${INVALID ne false || CURRENT_BOOK_ID eq bto.bookId }">
<td>
<font color="red"><b><rakesh:error property="quantityNeed"/> </b></font>
</td>
</core:if>
</tr>
</core:forEach>

<core:if test="${TOTAL gt 5 }">
<tr bgcolor="grey" >
<td colspan="3" align="left">
<core:if test="${START gt 0 }">
<a href="previous.vpb"><font class="textStyle" color="blue" ><b> Previous </b></font></a>
</core:if>
</td>
<core:if test="${SELECTED_BOOK_LIST ne null }">
<td align="right" colspan="3" >
<core:if test="${END lt TOTAL }">
<a href="next.vpb"><font class="textStyle" color="blue" ><b> Next </b></font></a>
</core:if>
</td>
</core:if>
<core:if test="${SELECTED_BOOK_LIST eq null }">
<td align="right" colspan="3" >
<core:if test="${END lt TOTAL }">
<a href="next.vpb"><font class="textStyle" color="blue" ><b> Next </b></font></a>
</core:if>
</td>
</core:if>
</tr>
</core:if>
</table>
</core:if>
</div>
</div>
</body>
</html>