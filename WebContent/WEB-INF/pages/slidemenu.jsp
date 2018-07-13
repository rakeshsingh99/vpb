<!DOCTYPE HTML>
<html manifest = ""lang = "en-US" >
<head>
<meta charset="UTF-8">
<title>Touch Sliding Menu | Sencha Examples | extdesenv.com </title>
	
<!-- Sencha Touch 2.2.1 CDN -->
<script src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css " href="http://cdn.sencha.io/touch/sencha-touch-2.2.1/resources/css/sencha-touch.css" />
<script type="text/javascript" src="http://cdn.sencha.io/touch/sencha-touch-2.2.1/sencha-touch-all.js" ></script>
<script type="text/javascript" src="logs/Menu.js"></script>	
<link rel="stylesheet" type="text/css " href="logs/Menu.css" />

<!-- App Code -->
<script type="text/javascript ">

Ext.setup({
    onReady: function() {
        var viewport = Ext.Viewport;

		// add extra css to viewport
		Ext.Viewport.innerElement.addCls('viewport-inner');
		
		// add initial views
        viewport.add([{
            xtype: 'mainmenu'
        },{
            xtype: 'container',
			html: '<jsp:include page="/WEB-INF/pages/header1.jsp"/><jsp:include page="/WEB-INF/pages/welcomeMenu1.jsp"/><jsp:include page="/WEB-INF/pages/login1.jsp"/>',
			padding: 10,
			items: [{
				xtype: 'toolbar',
				docked: 'top',
				title: 'Sliding Menu',
				items: [{
					iconCls: 'more',
					handler: function() {
						Ext.Viewport.child('mainmenu').toggle();
					}
				}]
			}]
        }]);
    }
});
</script>
</head>
<body>
</body>
</html>