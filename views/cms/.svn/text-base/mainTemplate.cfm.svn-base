<cfcontent reset="true" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><cfoutput>#event.getArg('pageProperties').pageTitle#</cfoutput> &#187;&#187; CMS</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<cfif event.getArg('pageProperties').description neq ""><meta name="description" content="<cfoutput>#event.getArg('pageProperties').description#</cfoutput>" /></cfif>
<cfif event.getArg('pageProperties').keywords neq ""><meta name="keywords" content="<cfoutput>#event.getArg('pageProperties').keywords#</cfoutput>" /></cfif>
<base href="http://<cfoutput>#cgi.HTTP_HOST##event.getArg('pageProperties').applicationRoot#</cfoutput>" />
<!-- to correct the unsightly Flash of Unstyled Content. http://www.bluerobot.com/web/css/fouc.asp -->
<script type="text/javascript"></script>
<style type="text/css">@import "views/_styles/<cfoutput>#event.getArg('pageProperties').styleSheet#</cfoutput>";</style>
<style type="text/css">
	/* Default widths */
	#content { width:<cfoutput>#event.getArg('pageProperties').cssContent#</cfoutput>px; }
	.maincol { width:<cfoutput>#event.getArg('pageProperties').cssMaincol#</cfoutput>px; }
	.subcol { width:<cfoutput>#event.getArg('pageProperties').cssSubcol#</cfoutput>px; }
	.xcol { width:<cfoutput>#event.getArg('pageProperties').cssXcol#</cfoutput>px; }
	.col-MSX .wrap, .col-SMX .wrap { width:<cfoutput>#event.getArg('pageProperties').cssWrap#</cfoutput>px; }
	/* Overiding widths */
	.col-MSX .maincol, .col-SMX .maincol { width:<cfoutput>#event.getArg('pageProperties').cssCol1#</cfoutput>px; }
	.col-MSX .subcol, .col-SMX .subcol { width:<cfoutput>#event.getArg('pageProperties').cssCol2#</cfoutput>px; }
</style>
<cfloop list="#event.getArg('pageProperties').javaScripts#" index="i">
<cfoutput><script src="#i#" language="JavaScript1.2" type="text/javascript"></script></cfoutput>
</cfloop>
</head>

<body class="col-<cfoutput>#event.getArg('pageProperties').colSequence#</cfoutput>"<cfif event.getArg('pageProperties').onLoad neq ""> onLoad="<cfoutput>#event.getArg('pageProperties').onLoad#</cfoutput>"</cfif>>
<cfif event.getArg('pageProperties').skipNav eq 1><div class="hide"><a href="#content" title="Skip navigation." accesskey="2">Skip navigation</a>.</div></cfif>
<cfoutput>#event.getArg('header')#</cfoutput>
<!-- Start content -->
<div id="content">
	<cfif event.getArg('pageProperties').skipNav eq 1><a name="content"></a></cfif>
	<!-- Start wrap -->
	<div class="wrap">
	
		<!-- Main Column -->
		<div class="maincol">
			<h3>Main col</h3>
			<cfif event.isArgDefined('exception') AND event.getArg('exception') neq "">
				<cfoutput>#event.getArg('exception')#</cfoutput>
			</cfif>
			<cfoutput>#event.getArg('mainBody')#</cfoutput>
			<!--- <cfoutput>#arguments.content.maincol#</cfoutput> --->
		</div>
		<!-- End Main Column -->
		
		<!-- Sub Column -->
		<div class="subcol">
			<h3>Left col</h3>
			<cfoutput>#event.getArg('subCol')#</cfoutput>
		</div>
		<!-- End Sub Column -->
	
	</div>
	<!-- End wrap -->
	
	<!-- Xtra Column -->
	<div class="xcol">
		<h3>Right col</h3>
		<cfoutput>#event.getArg('xCol')#</cfoutput>
	</div>
	<!-- End Xtra Column -->

</div>
<!-- End content -->
<cfoutput>#event.getArg('footer')#</cfoutput>
<!-- CMS Navigation -->
<cfoutput>#event.getArg('cmsNav')#</cfoutput>
</body>
</html>