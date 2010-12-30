
<cfapplication name="gregs" sessionmanagement="yes" />

<cfif cgi.SERVER_NAME eq "gregs.tcias.co.uk">
    <!---<cfset request.appPath = "../../uk.co.tcias/gregs/" />--->
    <cfset request.appPath = "/home/gregs/uk.co.tcias/gregs/" />
<cfelseif cgi.SERVER_NAME eq "gregs.tcias.simmons">
	<cfset request.appPath = "c:/u3/fusion/fusion/htdocs/gregs/" />
<cfelse>
    <cfset request.appPath = "/Users/gregstewart/Documents/workspace/uk/co/tcias/gregs/" />
</cfif>

<!--- Close session on browser close --->
<cfif StructKeyExists(cookie,cfid) and StructKeyExists(cookie,cftoken)>
    <cfcookie name="cfid" value="#cookie.cfid#" />
    <cfcookie name="cftoken" value="#cookie.cftoken#" />
</cfif>
