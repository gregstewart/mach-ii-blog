
<cfcomponent extends="MachII.framework.Listener" displayname="Application Listener" hint="I am the listener for the application">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">
		<cfscript>
			var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
	        variables.commentPath = appConstants.getCommentPath();
	        variables.photoPath = appConstants.getPhotoPath();
	        variables.dsn = appConstants.getDsn();
			variables.siteID = appConstants.getSiteID();
			variables.pageTitle = appConstants.getPageTitle();
			variables.colSequence = appConstants.getColSequence();
			variables.cssContent = appConstants.getCssContent();
			variables.cssMaincol = appConstants.getCssMaincol();
			variables.cssSubCol = appConstants.getCssSubCol();
			variables.cssXcol = appConstants.getCssXcol();
			variables.cssWrap = appConstants.getCssWrap();
			variables.cssCol1 = appConstants.getCssCol1();
			variables.cssCol2 = appConstants.getCssCol2();
			variables.skipNav = appConstants.getSkipNav();
			variables.styleSheet = appConstants.getStyleSheet();
			variables.javaScripts = appConstants.getJavaScripts();
			variables.onLoad = appConstants.getOnLoad();
			variables.description = appConstants.getDescription();
			variables.keywords = appConstants.getKeywords();
			variables.applicationRoot = appConstants.getApplicationRoot();
		</cfscript>
	</cffunction>

	<cffunction name="getAllPageProperties" access="public" returntype="struct" output="false" displayname="Get page properties" hint="returns all the page specific properties">
		<cfreturn variables />
	</cffunction>

	<cffunction name="sendNewCommentNotification" returntype="void" output="false" >
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />
		
		<cfmail from="info@tcias.co.uk" to="gregs@tcias.co.uk" subject="New Comment"  type="html">
			<p><a href="http://gregs.tcias.co.uk/index.cfm?event=comment.postComment&contentID=#arguments.event.getArg('commentBean').getContentId()#">A new comment was posted</a>:</p>
			comment: #arguments.event.getArg('commentBean').getComment()#
		</cfmail>
	</cffunction>

</cfcomponent>
