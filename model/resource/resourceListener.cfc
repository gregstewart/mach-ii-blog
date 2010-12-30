
<cfcomponent extends="MachII.framework.Listener" displayname="Resource Listener" hint="I am the listener for resources">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">				
		<cfscript>			
	        var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
	        var dsn = appConstants.getDsn(); 
			var dbType = appConstants.getDbType(); 			
			variables.resourceGateway = createObject("component","uk.co.tcias.gregs.model.resource.resourceGateway").init(dsn);
			variables.resourceDAO = CreateObject("component", "uk.co.tcias.gregs.model.dao.DAOFactory").init(dsn, "wild_tciasdb").getDAOFactory(dbType).getResourceDAO();
		</cfscript>					
	</cffunction>
		
	<cffunction name="getFriends" access="public" returntype="query" output="false" displayname="Get Friends" hint="I return a query containing all of the friend items.">
		<cfreturn variables.resourceGateway.getFriends() />
	</cffunction>
	
	<cffunction name="getFavourites" access="public" returntype="query" output="false" displayname="Get Favourites" hint="I return a query containing all of the favourites items.">
		<cfreturn variables.resourceGateway.getFavourites() />
	</cffunction>

</cfcomponent>
