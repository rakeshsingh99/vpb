<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
	<meta charset="utf-8" />
	<title>Viddharthi Pustak Bhandar</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="assets/plugins/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">
	<link href="assets/css/style-metro.css" rel="stylesheet" type="text/css"/>
	<link href="assets/css/style.css" rel="stylesheet" type="text/css"/>	
	<link href="assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>	
    <link rel="stylesheet" type="text/css" href="css1/fonts.googleapis.css" />
    <link rel="stylesheet" type="text/css" href="css1/font-awesome-min.css" />
	
	<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
	<!-- BEGIN LOGO -->
	<div class="logo">
		<img src="img/vpblogo1.png" alt="" /> 
	</div>
	<!-- END LOGO -->
	<!-- BEGIN LOGIN -->
	<div class="content">
		<!-- BEGIN LOGIN FORM -->
		<form class="form-vertical login-form" action="login.vpb"  method="post">
			 <h2 class="form-title" >Account Login</h2>
      
<div class="control-group" >
       
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-user"></i>
             <input class="m-wrap placeholder-no-fix" type="text"  placeholder="Username" name="uname"/>
          </div>
        </div>
      </div>
<div class="control-group">
        
        <div class="controls">
          <div class="input-icon left">
            <i class="icon-lock"></i>
             <input class="m-wrap placeholder-no-fix" type="password" placeholder="Password" name="pass"/>
          </div>          		    
        </div>
        <div style="margin-top:10px; float: right;">
	           <select style="width:97px; height:33px;" class="btn" name="database">
					<option  value="vpb_71_72">Ledger</option>
					<option  value="vpb_70_71">70-71</option>
					<option  value="vpb_acadmic_71_72">Acadmic72</option>
					<option  value="vpb_71_72">71-72</option>
	          </select>
	    </div>	
      <div class="forget-password">
				
				        <font size="2">Forgot your password ?</font>				        
				        <p>
				          no worries, click <a href="forgetPasswordDef.jsp" style="font-size:10px;" onmouseover="this.style.backgroundColor='white';this.style.color='blue'"
   onmouseout="this.style.backgroundColor='transparent';this.style.color='blue'">here</a>
				          to reset your password.
				        </p>
				      </div>
<span><input type="reset" name="Reset" id="Reset" value="Reset" class="btn"></span><span><input type="hidden" name ="lasturl" value="<?php echo $this->lasturl;?>"/>&nbsp<input type="submit" name="Login" id="Login" value="Login" class="btn blue"></span>
<span><font size="2" color="red"><b><nitesh:error property="uname"/> </b></font></span><br/>
<span><font size="2" color="red"><b><nitesh:error property="pass"/> </b></font></span>
</div>
		</form>
		<!-- END REGISTRATION FORM -->
	</div>
	<!-- END LOGIN -->
	
	 <% int currentYear = new Date().getYear() + 1900; %>
	
	<!-- BEGIN COPYRIGHT -->
	<div class="copyright">
		<%= currentYear %> &copy; Viddharthi Pustak Bhandar
	</div>
	<!-- END COPYRIGHT -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<!-- BEGIN CORE PLUGINS -->
	<script src="js/jquery.js"></script>
	     
	<!-- END PAGE LEVEL SCRIPTS --> 
	<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/birgunj2.jpg");
	</script>  
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>