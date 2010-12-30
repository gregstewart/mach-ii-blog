
<cfcomponent displayname="Category Gateway" hint="I am a data gateway to categories">

	<!--- uk.co.tcias.gregs.model.category. --->
	<cffunction name="init" access="public" returntype="categoryGateway" output="false" displayname="Gateway Constructor" hint="I initialize the category gateway.">
		<cfargument name="dsn" type="string" required="yes" displayname="Data Source Name" hint="I am the data source name." />	
		<cfargument name="siteID" type="string" required="yes" displayname="This site's ID" hint="I am the site identifier." />	
		
		<cfset variables.dsn = arguments.dsn />
		<cfset variables.siteID = arguments.siteID />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getNav" access="public" returntype="query" output="false" displayname="Get nav" hint="I return a query containing nav items">
		<cfset var qrySelect = 0 />
		
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT ca.category_id, ca.name 
			FROM categorisation ca
			WHERE ca.related_to = <cfqueryparam cfsqltype="cf_sql_varchar" value="#variables.siteID#" />
			ORDER BY ca.priority;
		</cfquery>
		
		<cfreturn qrySelect />
	</cffunction>
	
	<cffunction name="getRelatedCategories" access="public" returntype="query" output="false" displayname="Get related categories" hint="I return a query containing related categories">
		<cfargument name="category_id" default="#variables.siteID#" required="true" type="string" />
		
		<cfset var qrySelect = 0 />
		
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT ca.category_id, ca.name 
			FROM categorisation ca
			WHERE ca.related_to = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.category_id#" />
			ORDER BY ca.priority;
		</cfquery>
		
		<cfreturn qrySelect />
	</cffunction>
	
	<cffunction name="getAllCategories" access="public" returntype="query" output="false" displayname="Get related categories" hint="I return a query containing all categories">
		
		<cfset var qrySelect = 0 />
		
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT ca1.category_id, ca1.name, ca1.related_to,  '' AS "related_name" <!--- ca2.name AS "related_name" ---> 
			FROM categorisation ca1 
				INNER JOIN categorisation ca2 ON ca1.related_to = ca2.category_id 
			ORDER BY ca2.name, ca1.name
		</cfquery>
		
		<cfreturn qrySelect />
	</cffunction>
	
</cfcomponent>
