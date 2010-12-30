<!--- Set the path to the application's mach-ii.xml file. --->
<cfset MACHII_CONFIG_PATH = request.appPath&"config/mach-ii.xml" />

<!--- Set the configuration mode (when to reload): -1=never, 0=dynamic, 1=always --->
<cfset request.isProductionMode = (listFindNoCase("gregs.tcias.co.uk,gregs.teacupinastorm.co.uk,gregs.teacupinastorm.com",CGI.SERVER_NAME ) GT 0) />

<cfif not request.isProductionMode or structKeyExists(URL,"reloadApp")>
    <cfoutput>App killed</cfoutput>
    <!--- <cfoutput>#listFindNoCase("gregs.tcias.co.uk",CGI.SERVER_NAME )#</cfoutput> --->
    <cfset MACHII_CONFIG_MODE = 1 />
<cfelse>
	<cfset MACHII_CONFIG_MODE = -1 />
</cfif>
<!--- Set the app key for sub-applications within a single cf-application. --->
<cfset MACHII_APP_KEY = GetFileFromPath(ExpandPath(".")) />

<!--- Include the mach-ii.cfm file included with the core code. --->
<cfinclude template="/MachII/mach-ii.cfm" />

