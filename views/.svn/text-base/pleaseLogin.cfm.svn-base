<cfsilent>
<cfscript>
	if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
    {
    	attributes.root = "/";
    } else {
    	attributes.root = "";
    }
</cfscript>
</cfsilent>
<div id="error">
<p>Sorry you need to login. If you were previoulsy logged in and find yourself here, it could be that your session timed out.</p>
<p>You can login again by <a href="<cfoutput>#attributes.root#</cfoutput>#login"">clicking here</a>.</p>
<!---<cfoutput>#event.getArg("reDirect")#</cfoutput> --->
</div>