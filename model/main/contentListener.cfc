
<cfcomponent extends="MachII.framework.Listener" displayname="Category Listener" hint="I am the listener for categories">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">				
		<cfscript>			
	    	var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
	    	var dsn = appConstants.getDsn(); 
			var dbType = appConstants.getDbType(); 			
			variables.contentGateway = createObject("component","uk.co.tcias.gregs.model.main.contentGateway").init(dsn);
			variables.contentDAO = CreateObject("component", "uk.co.tcias.gregs.model.dao.DAOFactory").init(dsn, "wild_tciasdb").getDAOFactory(dbType).getContentDAO();
		</cfscript>					
	</cffunction>
		
	<cffunction name="getAll" access="public" returntype="query" output="false" displayname="Get All Content" hint="I return a query containing all of the Content.">
		<cfreturn variables.contentGateway.findAll() />
	</cffunction>
	
	<cffunction name="getAllCMSTitles" access="public" returntype="query" output="false" displayname="Get All Content" hint="I return a query containing all of the Content.">
		<cfreturn variables.contentGateway.findAllTitles("false") />
	</cffunction>
	
	<cffunction name="getAllTitles" access="public" returntype="query" output="false" displayname="Get All Content Titles" hint="I return a query containing all Content titles.">
		<cfreturn variables.contentGateway.findAllTitles("true") />
	</cffunction>		
	
	<cffunction name="getContentById" access="public" returntype="uk.co.tcias.gregs.model.main.content" output="false" displayname="Get Content By ID" hint="I return a query containing a single Content identified by it's ID">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing an ID field that identifies an Category." /> 
		<cfset var contentid = arguments.event.getArg("contentid") />
		<cfset var content = createObject("component","uk.co.tcias.gregs.model.main.content").init() />		
		
		<cfset variables.contentDAO.readByID(content,contentid) />
		<cfset arguments.event.setArg("content", content) />
		<cfreturn content />
	</cffunction>
	
	<cffunction name="removeContentById" access="public" returntype="void" output="false" displayname="Get Content By ID" hint="I return a query containing a single Content identified by it's ID">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing an ID field that identifies an Category." /> 
		<cfset var contentid = arguments.event.getArg("contentid") />
		<cftry>
		    <cfset variables.contentDAO.delete(contentid) />
		    <cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to delete the record. The error message returned is:  #cfcatch.message#">
		    </cfcatch>
		</cftry>
		<cfset announceEvent('cms.content.deleteSuccess') />
		
	</cffunction>
	
	<cffunction name="getContentByTitle" access="public" returntype="uk.co.tcias.gregs.model.main.content" output="false" displayname="Get Content By ID" hint="I return a query containing a single Content identified by it's Title">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfscript>
			var contentTitle = arguments.event.getArg("articleTitle");
			var content = createObject("component","uk.co.tcias.gregs.model.main.content").init();
			variables.contentDAO.readByTitle(content,contentTitle);
		</cfscript>

		<cfreturn content />
	</cffunction>
	
	<cffunction name="setContent" access="public" returntype="void" output="false" displayname="set Content" hint="I set a database record with the content information passed in">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing all of the current event information." /> 
		<cfset var content = arguments.event.getArg("contentBean") />
		<cftry>
    		<cfset variables.contentDAO.create(content) />
    		<cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to update the record. The error message is: #cfcatch.message#">
		    </cfcatch>
		</cftry>
		<cfset announceEvent('cms.content.addSuccess') />
	</cffunction>
	
	<cffunction name="setContentByID" access="public" returntype="void" output="true" displayname="Set Content By ID" hint="I return a query containing a single Content identified by it's ID">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfset var content = arguments.event.getArg("contentBean") />
		
		<cftry>
    		<cfset variables.contentDAO.update(content) />
		    <cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to update the record. The error message is: #cfcatch.message#">
		    </cfcatch>
		</cftry>
		<cfset announceEvent('cms.content.updateSuccess') />
	</cffunction>
	
	<cffunction name="getAllByCat" access="public" returntype="query" output="false" displayname="Get All Content By Category ID" hint="I return a query containing all of the Content for a category">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		
		<cfset var categoryID = "" />
		<cfset var myQuery = "" />
		
		<cfif arguments.event.isArgDefined("categoryIds")>
		    <cfset categoryID = arguments.event.getArg("categoryIds") />
		<cfelse>
		    <cfthrow message="No category was found" type="content" detail="No content could be found, because the category provided was not found." errorcode="content.contentNotFound" extendedinfo="" />
		</cfif>
		
		<cfset myQuery = variables.contentGateway.readByCatID(categoryID) />	
	    
	    <cfreturn myQuery />
	</cffunction>
	
	<cffunction name="chooseAction" access="public" returntype="void" output="false" displayname="Choose an action" hint="I choose whether to use an update or an add action based on the value of contentID (if 0 do add, else update)">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing an ID field that identifies an Category." />
		
		<cfif arguments.event.getArg("contentBean").getContentID() eq 0>
			<cfset announceEvent('cms.content.doAdd',arguments.event.getArgs()) />
		<cfelse>
			<cfset announceEvent('cms.content.doUpdate',arguments.event.getArgs()) />
		</cfif>
	</cffunction>
</cfcomponent>
