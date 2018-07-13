<html>
<head>
	<title>Nepali Calendar</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" href="http://keith-wood.name/css/jquery.calendars.picker.css" id="theme">
<link rel="stylesheet" href="http://keith-wood.name/themesDemo/south-street/jquery-ui.css" id="themeUI">
<link rel="stylesheet" href="http://keith-wood.name/css/ui-south-street.calendars.picker.css" id="themeTR">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/jquery.calendars.js"></script> 
<script type="text/javascript" src="js/jquery.calendars.plus.js"></script>
	<link rel="stylesheet" type="text/css" href="css/jquery.calendars.picker.css"> 
<script type="text/javascript" src="js/jquery.plugin.js"></script> 
<script type="text/javascript" src="js/jquery.calendars.picker.js"></script>
<script type="text/javascript" src="js/jquery.calendars.nepali.js"></script>
</head>
<body>
	<h2>Nepali Calendar</h2>
	
	<input type="text" id="selector" class="" value="2069-08-02"/>
	<input type="text" id="nepaliDate" class="nepali-calendar" value="2069-08-02"/>
	<input type="text" id="nepaliDate1" class="nepali-calendar" value="2069-08-12"/><br/>
	<input type="text" id="nepaliDate2" class="nepali-calendar" value="2069-08-18"/>
	<input type="text" id="nepaliDate3" class="nepali-calendar" value="2069-08-21"/><br/>
	<input type="text" id="nepaliDate4" class="nepali-calendar" value="2069-08-25"/>
	<input type="text" id="test">
</body>
</html>
<script>
  $(selector).calendarsPicker({calendar: $.calendars.instance('nepali')});
   
	$(document).ready(function(){
		$('.nepali-calendar').nepaliDatePicker();
	});
</script>