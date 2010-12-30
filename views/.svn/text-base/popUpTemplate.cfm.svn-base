<cfcontent reset="true" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><cfoutput>#event.getArg('pageProperties').pageTitle#</cfoutput></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--- TODO: Check that the meta page properties are being set properly when pulled from the database --->
<cfif event.getArg('pageProperties').description neq ""><meta name="description" content="<cfoutput>#event.getArg('pageProperties').description#</cfoutput>" /></cfif>
<cfif event.getArg('pageProperties').keywords neq ""><meta name="keywords" content="<cfoutput>#event.getArg('pageProperties').keywords#</cfoutput>" /></cfif>
<base href="http://<cfoutput>#cgi.HTTP_HOST##event.getArg('pageProperties').applicationRoot#</cfoutput>" />
<script src="views/_scripts/_validation.js" language="JavaScript1.2" type="text/javascript"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 10px;
	border: 0;
	/*background: #0f8994 url(views/i/bg_dropShadow1.2.png) top center repeat-y;*/
	font-size : .75em;
	font-family: Verdana;
}

h3 {
    display: none;
}


#frm_myForm {
	width: 350px;
}

div.row {
	width: 350px;
	clear : both;
    padding-top : 5px;
}

div.row span.label {
  float : left;
  width : 100px;
  text-align : right;
}

div.row span.formw {
  float : right;
  width : 240px;
  text-align : left;
}

div.row span.button {
  margin: 0 auto;
	float: center;
}

fieldset {
	margin: 0;
	padding: 3px;
	background-color: #E8F4F5;
}

legend {
    font-weight: bold;
}

.comments div {
	background-color: #88C5CA;
	border: 1px solid #000;
	padding: 5px;
	margin-top: 10px;
}

div.displayComment {
	background-color: #C3E1E4;
	border: 1px solid #000;
	padding: 5px;
	margin-top: 10px;
}

.comments h4,p {
	margin: 0;
}

a {
	font-weight : bold;
	color : #074348;
	text-decoration : none;
}

a:hover {
	color : #0f8994;
	text-decoration : underline;
}

#footer {
	width: 100%;
	margin: 25px auto 0 auto;
	border-top: 1px dotted #474747;
	text-align: center;
}

</style>
</head>

<body<cfif event.getArg('pageProperties').onLoad neq ""> onLoad="<cfoutput>#event.getArg('pageProperties').onLoad#</cfoutput>"</cfif>>
<h3>Main col</h3>
<cfif event.isArgDefined('exception') AND event.getArg('exception') neq "">
	<div id="error"><cfoutput>#event.getArg('exception')#</cfoutput></div>
</cfif>
<cfoutput>#event.getArg('mainBody')#</cfoutput>
<cfoutput>#event.getArg('popUpFooter')#</cfoutput>
</body>
</html>