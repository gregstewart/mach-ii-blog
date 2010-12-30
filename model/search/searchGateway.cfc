
<cfcomponent displayname="Search Gateway" hint="I am a data gateway to Search">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.search.searchGateway" output="false" displayname="Gateway Constructor" hint="I initialize the search gateway.">
		<cfargument name="dsn" type="string" required="yes" displayname="Data Source Name" hint="I am the data source name." />	
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="findAll" access="public" returntype="query" output="false" displayname="Find All" hint="I return a query containing all the possible search results">
		<cfargument name="searchString" default="" required="true" type="string" hint="I am the search string to search for" />
		<cfargument name="searchStart" default="0" required="false" type="numeric" hint="I indicate where to start results from" />
		<cfset var qrySelect = 0 />
		<cfset var nOI = 10 />
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT co.content_id, co.content_teaser, co.content, co.content_title, co.content_category_id, ca.name
			FROM content co, categorisation ca
			WHERE MATCH (content) AGAINST (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.searchString#" />)
            AND co.content_category_id = ca.category_id   
            AND co.published = 1
			AND co.date_published <= CURDATE() 
			LIMIT <cfqueryparam cfsqltype="cf_sql_integer" value="#val(arguments.searchStart)#" />,<cfqueryparam cfsqltype="cf_sql_integer" value="#nOI#" />
		</cfquery>
		
		<cfreturn qrySelect />
	</cffunction>
	
	<cffunction name="getSearchTotal" access="public" returntype="query" output="false" displayname="I do a count" hint="I return the total search hits">
		<cfargument name="searchString" default="" required="true" type="string" hint="I am the search string to search for" />
		
		<cfset var qryTotal = 0 />
		
		<cfquery name="qryTotal" datasource="#variables.dsn#">
			SELECT co.content_id
			FROM content co
			WHERE MATCH (content) AGAINST (<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.searchString#" />)
		</cfquery>
		
		<cfreturn qryTotal />
	</cffunction>
	
</cfcomponent>
