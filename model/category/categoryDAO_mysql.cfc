<cfcomponent displayname="MySQL categoryDAO" extends="uk.co.tcias.gregs.model.category.categoryDAO">
 
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfargument name="category" type="uk.co.tcias.gregs.model.category.category" required="yes" displayname="create" hint="I am the category from which to create a record" />
		<cfset var categoryInsert = 0 />		
		<cfset var uuid = CreateUUID() />
		<cfabort />

		<cfquery name="categoryInsert" datasource="#variables.dsn#" >
			INSERT INTO categorisation (
				category_id,
				name,				
				priority
			) VALUES (
				'#uuid#',
				'#trim(arguments.category.getName())#',
				<cfqueryparam cfsqltype="CF_SQL_BIGINT" value="#arguments.category.getSortOrder()#" >
			)
		</cfquery>
		<cfreturn />
	</cffunction>
			 		
</cfcomponent>
