<div id="success">
<cfscript>
    sessionUser = event.getArg("sessionUser");
	writeOutput("<p> Welcome back " & sessionUser.getUsername() & ", your login attempt was successful.</p>");
</cfscript>
</div>