<cfcomponent displayname="MySQL commentDAO" extends="uk.co.tcias.gregs.model.comment.commentDAO">
 
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfargument name="comment" type="uk.co.tcias.gregs.model.comment.comment" required="yes" displayname="create" hint="I am the comment from which to create a record" />
		<cfset var commentInsert = 0 />		
		<cfset var qry_lastcomment = 0 />
		<cfquery name="contentInsert" datasource="#variables.dsn#" >
			INSERT INTO content (
				name,				
				sortOrder
			) VALUES (
				'#trim(arguments.content.getName())#',
				<cfqueryparam cfsqltype="CF_SQL_BIGINT" value="#arguments.content.getSortOrder()#" >
			)
		</cfquery>
		<cfquery name="qry_lastContent" datasource="#variables.dsn#" >
			SELECT contentID
			FROM	content
			WHERE	name = '#trim(arguments.content.getName())#'
		</cfquery>
		<cfset arguments.content.setContentID(qry_lastContent.contentID) >
		<cfreturn />
	</cffunction>
			 		
</cfcomponent>
