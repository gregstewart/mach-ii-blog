<cfsetting enablecfoutputonly="yes" />
<!--- 
	$Archive:  $
	$Author:  $
	$Date:  $
	$Logfile:  $
 --->
<cfsetting enablecfoutputonly="no" />

<!--- <cfdump var="#request.pageContent.content#" />
<p><cfoutput>#request.pageContent.content.getExpiryDate()#</cfoutput></p> --->
<cfscript>
if (event.isArgDefined('contentBean')) {
	writeoutput("We have a bean!!");
	request.pageContent.content = event.getArg('contentBean');
}
</cfscript>
<cfdump var="#request.pageContent.content#" />

<cfsetting enablecfoutputonly="yes" />
<!---
	$History:  $
 --->
<cfsetting enablecfoutputonly="no" />
