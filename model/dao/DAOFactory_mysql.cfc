<cfcomponent displayname="DAOFactory for MySQL" extends="uk.co.tcias.gregs.model.dao.DAOFactory">
 
	<cffunction name="getContentDAO" access="public" returntype="uk.co.tcias.gregs.model.main.contentDAO" output="false">
		<cfset var contentDAO = "" />				
		<cfset contentDAO = createObject("component","uk.co.tcias.gregs.model.main.contentDAO_mysql").init(variables.dsn) />
		<cfreturn contentDAO />
	</cffunction>
	
	<cffunction name="getCategoryDAO" access="public" returntype="uk.co.tcias.gregs.model.category.categoryDAO" output="false">
		<cfset var categoryDAO = "" />				
		<cfset categoryDAO = createObject("component","uk.co.tcias.gregs.model.category.categoryDAO_mysql").init(variables.dsn) />
		<cfreturn categoryDAO />
	</cffunction>
	
	<cffunction name="getResourceDAO" access="public" returntype="uk.co.tcias.gregs.model.resource.resourceDAO" output="false">
		<cfset var resourceDAO = "" />				
		<cfset resourceDAO = createObject("component","uk.co.tcias.gregs.model.resource.resourceDAO_mysql").init(variables.dsn) />
		<cfreturn resourceDAO />
	</cffunction>
	
	<cffunction name="getCommentDAO" access="public" returntype="uk.co.tcias.gregs.model.comment.commentDAO" output="false">
		<cfset var commentDAO = "" />				
		<cfset commentDAO = createObject("component","uk.co.tcias.gregs.model.comment.commentDAO_mysql").init(variables.dsn) />
		<cfreturn commentDAO />
	</cffunction>
	
	<cffunction name="getLoginDAO" access="public" returntype="uk.co.tcias.gregs.model.login.loginDAO" output="false">
		<cfset var loginDAO = "" />				
		<cfset loginDAO = createObject("component","uk.co.tcias.gregs.model.login.loginDAO_mysql").init(variables.dsn) />
		<cfreturn loginDAO />
	</cffunction>
	
</cfcomponent>
