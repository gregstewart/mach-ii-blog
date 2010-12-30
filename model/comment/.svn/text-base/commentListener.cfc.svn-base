
<cfcomponent extends="MachII.framework.Listener" displayname="Comments Listener" hint="I am the listener for the comment" output="true">

	<cffunction name="configure" access="public" returntype="void" output="true" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">
	    <cfscript>
		    var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
		    var dsn = appConstants.getDsn();
			var dbType = appConstants.getDbType();
			var dbType2 = appConstants.getDbType2();
			
			variables.myUtils = CreateObject("component","uk.co.tcias.gregs.model.udf.utils");
			variables.pathToFile = ExpandPath(appConstants.getCommentPath());
			// writeOutput(pathToFile);
			// variables.searchGateway = createObject("component","model.search.searchGateway").init(dsn);
			variables.commentDAO = CreateObject("component", "uk.co.tcias.gregs.model.dao.DAOFactory").init(dsn, "wild_tciasdb").getDAOFactory(dbType2).getCommentDAO();
		</cfscript>
	</cffunction>

	<cffunction name="getComments" access="public" returntype="any" output="true" displayname="Get All Comments" hint="I return an object containing the comments for a given article.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." />
		
		<cfset var commentID = arguments.event.getArg("contentID") />
		<cfset var commentBean = createObject("component","uk.co.tcias.gregs.model.comment.comment").init() />
		
		<cfset variables.commentDAO.read(commentBean,commentID,variables.pathToFile) />
		<cfreturn commentBean />
	</cffunction>

	<cffunction name="setComment" access="public" returntype="void" output="true" displayname="add comment" hint="I add a new comment.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." />

		<cfset var commentBean = arguments.event.getArg("commentBean") />
		<cfset var commentID = commentBean.getCommentID() />
		<cfset var r_name = commentBean.getName() />
		<cfset var r_email = commentBean.getEmail() />
		<cfset var o_website = commentBean.getWebsite() />
		<cfset var r_comment = commentBean.getComment() />
		
		<!--- is a valid e-mail adddress --->
		<cfif (NOT variables.myUtils.IsEmail(r_email))>
			<!--- // re-direct and prompt --->
			<cfset arguments.event.setArg("error",2) />
		<cfelse>
		    <!--- // clean the HTML in the comment field
			//<cfset r_comment = myUtils.makeXHTMLValid(r_comment) /> --->
		
			<cfset arguments.event.setArg("error",0) />
			<cfset variables.commentDAO.create(commentID,r_name,r_email,o_website,r_comment,variables.pathToFile) />
		</cfif>
		<cfset arguments.event.setArg("contentID",commentID) />
		<cfset announceEvent("comment.postComment",arguments.event.getArgs()) />
		
		<cfreturn />
	</cffunction>

</cfcomponent>
