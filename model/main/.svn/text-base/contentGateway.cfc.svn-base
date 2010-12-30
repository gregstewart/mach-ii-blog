
<cfcomponent displayname="Content Gateway" hint="I am a data gateway to content">

	<!--- uk.co.tcias.gregs.model.main. --->
	<cffunction name="init" access="public" returntype="contentGateway" output="false" displayname="Gateway Constructor" hint="I initialize the content gateway.">
		<cfargument name="dsn" type="string" required="yes" displayname="Data Source Name" hint="I am the data source name." />	
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="findAll" access="public" returntype="query" output="false" displayname="Find All" hint="I return a query containing all content">
		<cfset var qrySelect = 0 />
		<cfset var nOI = 10 />
		
		<!--- gregstewart - 14/4/2006 - Weird way that this version of BlueDragon incorrectly returns computed columns, e.g. formattedDate is returned as computed_Column_8 --->
		
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT co.content_id, co.content_title, co.content, co.content_category_id, ca.name, ca.level, 
			      ca.related_to, DATE_FORMAT(co.date_published,'%d %M %Y') as formattedDate, co.content_teaser,
			      DATE_FORMAT(co.date_published,'%Y-%m-%d') as dcDate, DATE_FORMAT(co.date_published,'%H:%i:%s-00:00') as dcTime,
			      co.date_published 
			FROM content co, categorisation ca
			WHERE co.content_type = 'bb4f74b892a4854e3f0bcf262acf1e09' 
			AND co.content_category_id = ca.category_id 
			AND co.published = 1 
			AND co.date_published <= CURDATE() 
			ORDER BY co.date_published 
			DESC LIMIT 0, <cfqueryparam cfsqltype="cf_sql_integer" value="#nOI#" />;
		</cfquery>
		
		<cfreturn qrySelect />
	</cffunction>
	
	
	<cffunction name="findAllTitles" access="public" returntype="query" output="false" displayname="Find All" hint="I return a query containing all content">
		<cfargument name="anyRestrictions" displayname="Any Restrictions" default="true" required="true" type="boolean" hint="Run the query with any restrictions?">
		<cfset var qrySelect = 0 />
		<cfset var limitQuery = arguments.anyRestrictions />
		
		<!-- I wonder why this is the only query that resides in the gateway 
           Because that's what gateways do they retrieve multiple rows
       -->
		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT co.content_id, co.content_title
			FROM content co
			WHERE co.content_type = 'bb4f74b892a4854e3f0bcf262acf1e09' 
			<cfif limitQuery eq true>
				AND co.published = 1 
			</cfif> 
			ORDER BY co.date_published
		</cfquery>

		<cfreturn qrySelect />
	</cffunction>
	
	
	<cffunction name="readByCatID" access="public" returntype="query" output="false" displayname="Find All content items for a category" hint="I return a query containing all content for a category">
		<cfargument name="categoryID" default="" required="true" type="string" displayname="I am the category id" hint="I am the category ID to look up content items for" />
		<cfset var qrySelect = 0 />

		<cfquery name="qrySelect" datasource="#variables.dsn#">
			SELECT co.content_id, co.content_title, co.content, ca.name
			FROM content co, categorisation ca
			WHERE co.content_category_id = ca.category_id
			AND co.content_type = 'bb4f74b892a4854e3f0bcf262acf1e09' 
			AND co.content_category_id IN (<cfqueryparam list="true" cfsqltype="cf_sql_varchar" value="#arguments.categoryID#" />) 
			AND co.published = 1 
			AND co.date_published <= CURDATE() 
			ORDER BY ca.name, co.date_published 
		</cfquery>
		<cfreturn qrySelect />
	</cffunction>
	
</cfcomponent>
