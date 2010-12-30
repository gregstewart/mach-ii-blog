
<cfcomponent displayname="Resource Gateway" hint="I am a data gateway to Resources">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.resource.resourceGateway" output="false" displayname="Gateway Constructor" hint="I initialize the category gateway.">
		<cfargument name="dsn" type="string" required="yes" displayname="Data Source Name" hint="I am the data source name." />	
		
		<cfset variables.dsn = arguments.dsn />
		<cfset variables.resourceTypes = StructNew() />
		<cfset variables.resourceTypes['favourites'] = "9e145a16dd50cd3d2c65c7476e4e598a" />
		<cfset variables.resourceTypes['friends'] = "f263fa9210cea755aed6ebb0f42ca133" />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getFriends" access="public" returntype="query" output="false" displayname="Get friends" hint="I return a query containing favourite items">
		<cfset var qrySelect = 0 />
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT  re.display_name, re.value, re.description
      FROM resources re
      WHERE re.resource_type = "#variables.resourceTypes['friends']#"
		</cfquery>
		<cfreturn qrySelect />
	</cffunction>
	
	<cffunction name="getFavourites" access="public" returntype="query" output="false" displayname="Get favourites" hint="I return a query containing favourites items">
		<cfset var qrySelect = 0 />
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT  re.display_name, re.value, re.description
      FROM resources re
      WHERE re.resource_type = "#variables.resourceTypes['favourites']#"
		</cfquery>
		<cfreturn qrySelect />
	</cffunction>
	
</cfcomponent>
