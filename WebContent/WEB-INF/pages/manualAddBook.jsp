<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
  href="<%=request.getContextPath()%>/css/nkindia.css">
  
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <!--  <link rel="stylesheet" type="text/css" href="css/default.css"/>-->
		 
		
<!-- Start of StatCounter Code for Default Guide -->

</head>
<body >
<center>
<table class="textStyle" height="100%" width="1167px" style="margin-top:-40px;">
<tr bgcolor="#404040">
<td class="textStyle" align="center" colspan="7">
<font size="5" color="white"><b> Add Book Manually </b></font>
</td></tr>
<tr bgcolor="#ffffff">
<td align="center" colspan="3">
<font size="4" color="green"><b><nitesh:error property="addingBookError"/> </b></font>
</td></tr>
</table>
<form action="manualAddBook.vpb" class="register" method="post">
<fieldset class="row2">
				
				<p> 
					<input type="button" value="Add Field" onClick="addRow('dataTable')" /> 
					<input type="button" value="Remove Field" onClick="deleteRow('dataTable')"  /> 
					
				</p>
               <table id="dataTable" class="form" border="0" align="center">
                  <tbody>
                    <tr>
                      <p>
					   	<td><input type="checkbox" required="required" name="chk[]" checked="checked" /></td>
						
						 <td>
							<label for="BX_publication">Publication</label>
						 
							<select  id="BX_publication" required="required" name="publication">
								<option value="">Select</option>
								<option value="Megha">Megha</option>
								<option value="Pragyan">Pragyan</option>
								<option value="Ekta">Ekta</option>
								<option value="United">United</option>
								<option value="Oxbridge">Oxbridge</option>
								<option value="Viddarthi">Viddarthi</option>
								<option value="Ratna">Ratna</option>
								<option value="Unique">Unique</option>
								<option value="Bhudipuran">Bhudipuran</option>
								<option value="Sangam">Sangam</option>
								<option value="Cash">Cash</option>
								<option value="Swagat">Swagat</option>
								<option value="Satyal">Satyal</option>
								<option value="Upyogi">Upyogi</option>
								<option value="Everest">Everest</option>
								<option value="Neema">NeemaGuess</option>
								<option value="Oxford">Oxford-Hero</option>
								<option value="Pragyan">Pragyan</option>
								<option value="Sunrise">Sunrise</option>
								<option value="KEDC">KEDC</option>
								<option value="Subh Aaarambh">Subh Aaarambh</option>
								<option value="Sultan Chand">Sultan Chand</option>
								<option value="Allied">Allied</option>
								<option value="Oxford">Oxford</option>
								<option value="Orient">Orient</option>
								<option value="Saraswati">Saraswati</option>
								<option value="Readmore">Readmore</option>
								<option value="Athrai">Athrai</option>
								<option value="Majdoor">Majdoor</option>
								<option value="Times">Times</option>
								<option value="Asia">Asia</option>
								<option value="Oasis">Oasis</option>
								<option value="Sultan Chand">Sultan Chand</option>
								<option value="XYZ">XYZ</option>
								<option value="All">All</option>
								<option value="Nirantar">Nirantar</option>
								<option value="Nilgiree">Nilgiree</option>
								<option value="JBD">JBD</option>
								<option value="Koselee">Koselee</option>
								<option value="Online">Online</option>
								<option value="Vivek">Vivek</option>
								<option value="Navneet">Navneet</option>
								<option value="Nepal Sahitya">Nepal Sahitya</option>
							</select>
						</td>	
						
						 <td>
							<label for="BX_bname">Book Name</label>
							<select  id="BX_publication" required="required" name="bname">
								<option value="">Select</option>
								<option value="English">English</option>
								<option value="Nepali">Nepali</option>
								<option value="Math">Math</option>
								<option value="Gulmohar">Gulmohar</option>
								<option value="Life Skill">Life Skill</option>
								<option value="Science">Science</option>
								<option value="Young Eassy Letter">Young Eassy Letter</option>
								<option value="EnglishGrammer">EnglishGrammer</option>
								<option value="Nepali.Byakaran">Nepali.Byakaran</option>
								<option value="Nepali.Byakaran(Byakaran Khand)">Nepali.Byakaran(Byakaran Khand)</option>
								<option value="OptMath">Opt Math</option>
								<option value="English Practice">English Practice</option>
								<option value="Way to Social">Way to Social</option>
								<option value="SpeedyOptMath">SpeedyOptMath</option>
								<option value="G.K">G.K</option>
								<option value="10-set">10-set</option>
								<option value="Cash">Cash</option>
								<option value="Saral Nepali">Saral Nepali</option>
								<option value="Naya Nepali">Naya Nepali</option>
								<option value="Leaning with words">Leaning with words</option>
								<option value="Computer">Computer</option>
								<option value="Advance Computer">Advance Computer</option>
								<option value="Headway grammer">Headway grammer</option>
								<option value="MoralScience">Moral Science</option>
								<option value="SocialStudy">Social Study</option>
								<option value="Nepali Byakaran(Rachana Khand)">Nepali Byakaran(Rachana Khand)</option>
								<option value="Select English">Select English</option>
								<option value="Dictionery">Dictionery</option>
								<option value="Math">Math</option>
								<option value="Essential Eng Grammer">Essential Eng Grammer</option>
								<option value="Headway">Headway</option>
								<option value="Symphony">Symphony</option>
								<option value="Nepali Lekhan Mala">Nepali Lekhan Mala</option>
								<option value="Supliment English">Supliment English</option>
								<option value="SpeedyMath">SpeedyMath</option>
								<option value="Conversation">Conversation</option>
								<option value="SpeedyMath">SpeedyMath</option>
								<option value="Curssive">Curssive</option>
								<option value="Evaluation">Evaluation</option>
								<option value="Drawing">Drawing</option>
								<option value="Economics(E)">Economics(E)</option>
								<option value="Bussincess Study(E)">Bussincess Study(E)</option>
								<option value="Bussincess Study(N)">Bussincess Study(N)</option>
								<option value="Pedagogy">Pedagogy</option>
								<option value="Education">Education</option>
								<option value="Basic Algebra">Basic Algebra</option>
								<option value="Speak in English">Speak in English</option>
								<option value="Population">Population</option>
								<option value="Phulbari">Phulbari</option>
								<option value="MajorEnglish">MajorEnglish</option>
								<option value="Capital Letter">Capital Letter</option>
								<option value="Small Letter">Small Letter</option>
								<option value="Number Book">Number Book</option>
								<option value="English(WB)">English(WB)</option>
								<option value="Nepali Padha Lekh rang bhara">Nepali Padha Lekh rang bhara</option>
								<option value="All in One">All in One</option>
								<option value="All in One(WB)">All in One(WB)</option>
								<option value="All in One(1st)">All in One(1st)</option>
								<option value="All in One(2nd)">All in One(2nd)</option>
								<option value="All in One(3rd)">All in One(3rd)</option>
								<option value="Health&Phy">Health&Phy</option>
								<option value="Occupation">Occupation</option>
								<option value="Kit">Kit</option>
								<option value="PositiveLiving">PositiveLiving</option>
								<option value="DelightEngish">DelightEngish</option>
								<option value="Atlas">Atlas</option>
								<option value="Account">Account</option>
								<option value="Read&Write(U/L)">Read&Write(U/L)</option>
								<option value="Read&Write(A/W)">Read&Write(A/W)</option>
								<option value="Calender">Calender</option>
								<option value="Table">Table</option>
								<option value="Biology">Biology</option>
								<option value="Physics">Physics</option>
								<option value="Books">Books</option>
								<option value="Rem.English">Rem.English</option>
								<option value="Translation">Translation</option>
								<option value="Marketing">Marketing</option>
								<option value="Child Development">Child Development</option>
								<option value="Priciple of Accounting-E">Priciple of Accounting-E</option>
							</select>
						 </td>
						 <td>
<font size="4" color="red"><b><nitesh:error property="bname"/> </b></font>
</td>
						
												
					
						 <td>
							<label for="BX_class">Class</label>							
                         
							<select  name="class" id="BX_class" required="required">
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
								<option value="-">-</option>
								
							</select>
						</td>
						
						
					   
					   <td>
							<label for="BX_cost">Cost</label>
							<input type="text"  class="small" required="required" name="cost">
					   </td>
					   <td>
<font size="4" color="red"><b><nitesh:error property="cost"/> </b></font>
</td>
						 
					   <td>
							<label for="BX_quantity">Quantity</label>
							<input type="text" class="small" required="required" name="quantity">
					   </td>
					   
					  <td>
							<label for="BX_publication">Edition</label>
						 
							<select  id="BX_publication"  name="rate">
								<option value="">Select</option>
								<option value="UE">UE</option>
								<option value="UE-1">UE-1</option>
								<option value="NE">NE</option>
							</select>
						</td>							
					   
					   
							</p>
                    </tr>                       
                    </tbody>
                </table>
                <table >
                <tr>                
                <td colspan="5" align="center">
                        <input class="submit" type="submit" value="Add to cart &raquo;"/>
                    </td></tr> 
                </table>
				<div class="clear"></div>
            </fieldset>



</form>
</center>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>