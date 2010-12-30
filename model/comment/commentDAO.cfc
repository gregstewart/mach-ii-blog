
<cfcomponent displayname="Comment DAO" hint="I abstract data access for comment">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.comment.commentDAO" output="false" >		
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfabort showerror="contentDAO.create - This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="readByID" access="public" returntype="void" output="false"  hint="CRUD method">
		<cfargument name="content" type="uk.co.tcias.gregs.model.comment.comment" required="yes" displayname="read" hint="I am the comment object into which data is read." />
		<cfargument name="contentID" type="numeric" required="true" hint="I am the ID of the comment record to read." />		
		<cfset var contentSelect = 0 />
						
	</cffunction>
		
</cfcomponent>
