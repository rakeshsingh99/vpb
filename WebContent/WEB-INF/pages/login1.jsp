<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/WEB-INF/nk.tld" prefix="nitesh" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

</head>
<body>
<center>
<form action="login.vpb" class="register" method="post" >
<div class="loginback">
  <div class="logo"><img src="img/vpblog.png"></img> 
		</div>
  
        <div class="login">
		
		<div class="content">
      <div class="form-title">Account Login</div>
      
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
      <div class="forget-password">
				                  <p> <font size="2">New User</font>
				        <a href="registerDef.jsp" style="font-size:10px;" onmouseover="this.style.backgroundColor='white';this.style.color='blue'"
   onmouseout="this.style.backgroundColor='transparent';this.style.color='blue'">SignUp Here</a></p>
				        <font size="2">Forgot your password ?</font>
				        <p>
				          no worries, click <a href="forgetPasswordDef.jsp" style="font-size:10px;" onmouseover="this.style.backgroundColor='white';this.style.color='blue'"
   onmouseout="this.style.backgroundColor='transparent';this.style.color='blue'">here</a>
				          to reset your password.
				        </p>
				      </div>
<span><input type="reset" name="Reset" id="Reset" value="Reset" class="btn"></span><span><input type="submit" name="Login" id="Login" value="Login" class="btn blue"></span>
<span><font size="2" color="red"><b><nitesh:error property="uname"/> </b></font></span><br/>
<span><font size="2" color="red"><b><nitesh:error property="pass"/> </b></font></span>
</div>
	</div>
	</div>
	</div>
</form>
</center>
<script src="js/jquery.js" ></script>
<script src="js1/jquery.backstretch.js" ></script>
<script type="text/javascript">
	     $.backstretch("img/background12.jpg");
	</script>  

</body>
</html>