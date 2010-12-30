
<div id="error">
<cfscript>
writeOutput("<p>Sorry the form you just submitted contained the following errors:</p>");
tmpyStruct = event.getArg(event.getArg( 'formObjectName' )).getErrors();
WriteOutput("<ol>");
for (idx in tmpyStruct) {
	WriteOutput("<li>"&tmpyStruct[idx]&"</li>");
}
WriteOutput("</ol>");
</cfscript>
</div>

<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; Sorry an error has occured " />

<!--- <p><a href=""" & cgi.HTTP_REFERER & """>Click here</a> to return to previous page.</p> --->