<cfcomponent displayname="DAOFactory for MySQL" extends="uk.co.tcias.gregs.model.dao.DAOFactory">
 
	<!--- <cffunction name="getContentDAO" access="public" returntype="model.main.contentDAO" output="false">
		<cfset var contentDAO = "" />				
		<cfset contentDAO = createObject("component","model.main.contentDAO_mysql").init(variables.dsn) />
		<cfreturn contentDAO />
	</cffunction>
	
	<cffunction name="getCategoryDAO" access="public" returntype="model.category.categoryDAO" output="false">
		<cfset var categoryDAO = "" />				
		<cfset categoryDAO = createObject("component","model.category.categoryDAO_mysql").init(variables.dsn) />
		<cfreturn categoryDAO />
	</cffunction>
	
	<cffunction name="getResourceDAO" access="public" returntype="model.resource.resourceDAO" output="false">
		<cfset var resourceDAO = "" />				
		<cfset resourceDAO = createObject("component","model.resource.resourceDAO_mysql").init(variables.dsn) />
		<cfreturn resourceDAO />
	</cffunction> --->
	
	<cffunction name="getCommentDAO" access="public" returntype="uk.co.tcias.gregs.model.comment.commentDAO" output="false">
		<cfset var commentDAO = "" />				
		<cfset commentDAO = createObject("component","uk.co.tcias.gregs.model.comment.commentDAO_xml").init(variables.dsn) />
		<cfreturn commentDAO />
	</cffunction>
	
</cfcomponent>
