<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>HTML5, CSS3 and jQuery Navigation menu</title>
		<link rel="stylesheet" href="css/nav.css">
		<!--[if IE]>
			<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
	</head>
	<body class="no-js">
    	<script>
			var el = document.getElementsByTagName("body")[0];
			el.className = "";
		</script>
        <noscript>
        	<!--[if IE]>
            	<link rel="stylesheet" href="css/ie.css">
            <![endif]-->
        </noscript>
		<nav id="topNav">
        	<ul>
            	<li><a href="logout.vpb" title="logout">logout</a></li>
          		<li><a href="changePasswordDef.jsp" title="change password">change password</a></li>
                <li><a href="detailsDef.jsp" title="view details">view details</a></li>
                <li><a href="allorders.vpb" title="all orders">all orders</a></li>
                <li><a href="searchBookDef.jsp" title="search">search</a></li>
                <li><a href="" title="add book">add book</a>
                	<ul>
                    	<li><a href="addBookDef.jsp" title="add single book">add single book</a></li>
                        <li class="last"><a href="multipleAddBookDef.jsp" title="add multiple book">add multiple book</a></li>
                    </ul>        
                </li>
               <li class="last"><a href="userHomeDef.jsp" title="home">home</a></li>
          </ul>          
          
        </nav>       
		<script src="js/jquery.js"></script>
        <script src="js/modernizr.js"></script>
		<script>
			(function($){
				
				//cache nav
				var nav = $("#topNav");
				
				//add indicator and hovers to submenu parents
				nav.find("li").each(function() {
					if ($(this).find("ul").length > 0) {
						$("<span>").text("^").appendTo($(this).children(":first"));

						//show subnav on hover
						$(this).mouseenter(function() {
							$(this).find("ul").stop(true, true).slideDown();
						});
						
						//hide submenus on exit
						$(this).mouseleave(function() {
							$(this).find("ul").stop(true, true).slideUp();
						});
					}
				});
			})(jQuery);
		</script>
	</body>
</html>