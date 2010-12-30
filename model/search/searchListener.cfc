
<cfcomponent extends="MachII.framework.Listener" displayname="Search Listener" hint="I am the listener for the search">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">				
	    <cfscript>			
		    var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
		    var dsn = appConstants.getDsn(); 
			var dbType = appConstants.getDbType(); 			
			variables.searchGateway = createObject("component","uk.co.tcias.gregs.model.search.searchGateway").init(dsn);
		</cfscript>							
	</cffunction>
	
	<cffunction name="getResults" access="public" returntype="query" output="false" displayname="Get All Search Results" hint="I return a query containing the search results for a given string.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfset var searchString = arguments.event.getArg("r_search") />
		<cfset var searchStart= 1 />
		<cfif arguments.event.isArgDefined("start_pos")>
		    <cfset searchStart= arguments.event.getArg("start_pos") />
		</cfif>
		
		<cfreturn variables.searchGateway.findAll(searchString,searchStart) />
	</cffunction>

	<cffunction name="getResultTotal" access="public" returntype="query" output="false" displayname="Get total for Search Results" hint="I return a query containing the for the search.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfset var searchString = arguments.event.getArg("r_search") />

		<cfreturn variables.searchGateway.getSearchTotal(searchString) />
	</cffunction>
</cfcomponent>
