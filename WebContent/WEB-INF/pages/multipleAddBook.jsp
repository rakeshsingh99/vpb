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
<table class="textStyle" height="100%" width="100%" style="margin-top:-40px;">
<tr bgcolor="#404040">
<td class="textStyle" align="center" colspan="7">
<font size="5" color="white"><b> Add Multiple Book Information </b></font>
</td></tr>
<tr bgcolor="#ffffff">
<td align="center" colspan="3">
<font size="4" color="green"><b><nitesh:error property="addingBookError"/> </b></font>
</td></tr>
</table>
<form action="multipleAdd.vpb" class="register" method="post">
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
							<label for="BX_bname">Book Name</label>
							<input type="text" required="required" class="large"  name="bname">
						 </td>
						 <td>
<font size="4" color="red"><b><nitesh:error property="bname"/> </b></font>
</td>
						
						 <td>
							<label for="BX_publication">Publication</label>
						 
							<select  id="BX_publication" required="required" name="publication">
								<option value="">Select</option>
								<option value="Megha">Megha</option>
								<option value="Ekta">Ekta</option>
								<option value="United">United</option>
								<option value="Oxbridge">Oxbridge</option>
								<option value="Viddarthi">Viddarthi</option>
								<option value="Ratna">Ratna</option>
								<option value="Unique">Unique</option>
								<option value="Bhudipuran">Bhudipuran</option>
								<option value="Sangam">Sangam</option>
								<option value="Satyal">Satyal</option>
								<option value="Asia">Asia</option>
							</select>
						</td>							
					
						 <td>
							<label for="BX_class">Class</label>							
                         
							<select  name="class" id="BX_class" required="required">
								<option value="">Select</option>
								<option value="Nursery">Nursery</option>
								<option value="LKG">LKG</option>
								<option value="UKG">UKG</option>
								<option value="One">One</option>
								<option value="Two">Two</option>
								<option value="Three">Three</option>
								<option value="Four">Four</option>
								<option value="Five">Five</option>
								<option value="Six">Six</option>
								<option value="Seven">Seven</option>
								<option value="Eight">Eight</option>
								<option value="Nine">Nine</option>
								<option value="Ten">Ten</option>
							</select>
						</td>
						
						<td>
							<label for="BX_edition">Edition</label>
							
							<select id="BX_edition" required="required" name="edition">
								<option value="">Select</option>
								<option value="1st Edition">1st Edition</option>
								<option value="2nd Edition">2nd Edition</option>
								<option value="3rd Edition">3rd Edition</option>
								<option value="4th Edition">4th Edition</option>
								<option value="5th Edition">5th Edition</option>
								<option value="6th Edition">6th Edition</option>
								<option value="7th Edition">7th Edition</option>
								<option value="8th Edition">8th Edition</option>
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
					   
					   
							</p>
                    </tr>                       
                    </tbody>
                </table>
                <table >
                <tr>                
                <td colspan="5" align="center">
                        <input class="submit" type="submit" value="Add Muitiple Books &raquo;"/>
                    </td></tr> 
                </table>
				<div class="clear"></div>
            </fieldset>



</form>
</center>
<script type="text/javascript" src="js/script.js"></script>
</body>
</html>