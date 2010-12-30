
<cfcomponent extends="MachII.framework.Listener" displayname="Category Listener" hint="I am the listener for categories">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">				
		<cfscript>			
	        var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
	        var dsn = appConstants.getDsn(); 
			var dbType = appConstants.getDbType(); 			
			var siteID = appConstants.getSiteID();
			variables.categoryGateway = createObject("component","uk.co.tcias.gregs.model.category.categoryGateway").init(dsn,siteID);
			variables.categoryDAO = createObject("component", "uk.co.tcias.gregs.model.dao.DAOFactory").init(dsn, "wild_tciasdb").getDAOFactory(dbType).getCategoryDAO();
		</cfscript>					
	</cffunction>
		
	<cffunction name="getNav" access="public" returntype="query" output="false" displayname="Get Nav" hint="I return a query containing all of the nav items.">
		<cfreturn variables.categoryGateway.getNav() />
	</cffunction>
	
	<cffunction name="getRelatedCategories" access="public" returntype="query" output="false" displayname="Get All Categories" hint="I return a query containing all of the faqs.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfset var category_id = arguments.event.getArg("category_ID") />
		<cfreturn variables.categoryGateway.getRelatedCategories(category_id) />
	</cffunction>		
	
	<cffunction name="getByTitle" access="public" returntype="uk.co.tcias.gregs.model.category.category" output="false" displayname="Get Category By Title" hint="I return a query containing a single Category identified by it's Title">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies an Category." /> 
		
		<cfset var categoryname = arguments.event.getArg("indexTitle") />
		<cfset var category = createObject("component","uk.co.tcias.gregs.model.category.category").init() />
		
		<cfset variables.categoryDAO.readByTitle(category,categoryname) />
		
		<cfreturn category />
	</cffunction>
	
	<cffunction name="getCategoryByID" access="public" returntype="uk.co.tcias.gregs.model.category.category" output="false" displayname="Get Category By Title" hint="I return a query containing a single Category identified by it's Title">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies an Category." /> 
		<cfset var categoryId = arguments.event.getArg("categoryId") />
		<cfset var category = createObject("component","uk.co.tcias.gregs.model.category.category").init() />
		<cfset variables.categoryDAO.readByID(category,categoryId) />
		<cfreturn category />
	</cffunction>
	
	<cffunction name="getCheckRelated" access="public" returntype="string" output="false" displayname="Check AND Get Related Categories By ID" hint="I return a query containing a related Categories identified by it's ID">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a ID field that identifies a related Categories." /> 
		<cfset var categoryObj = arguments.event.getArg("categoryObject") />
		<cfset var categoryIDs = "" />
		
		<cfset arguments.event.SetArg("category_ID",categoryObj.getCategoryID()) />
		<cfset categoryIDs = getRelatedCategories(arguments.event) />
		<cfif isQuery(categoryIDs) AND categoryIDs.recordcount>
		    <cfset categoryIDs = ListPrepend(valueList(categoryIDs.category_id), categoryObj.getCategoryID()) />
		    <!--- <cfabort showerror="stop is query and has result" /> --->
	    <cfelse>
	        <cfset categoryIDs = categoryObj.getCategoryID() />
		</cfif>
		<cfreturn categoryIDs />
	</cffunction>
	
	<cffunction name="getAll" access="public" returntype="query" output="false" displayname="Get All Category" hint="I return all categories stored in the database">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />
		<cfset var categoryQuery = variables.categoryGateway.getAllCategories()>
		<cfset arguments.event.setArg("categoryQuery", categoryQuery) />
		<cfreturn categoryQuery />
	</cffunction>
	
	<cffunction name="setCategory" access="public" returntype="void" output="false" displayname="Create Category" hint="I cause a Category to be created from the current event object.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />
		<cfset var category = arguments.event.getArg("category") />
		<cfdump var="#category#">
		<cfdump var="#variables.categoryDAO#">
		<cfabort />
		<cftry>
    		<cfset variables.categoryDAO.create(category) />
		    <cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to add the record. The error message is: #cfcatch.message#">
		    </cfcatch>
		</cftry>
		<cfset announceEvent('cms.category.addSuccess') />
		
	</cffunction>

	<cffunction name="setCategoryByID" access="public" returntype="void" output="false" displayname="Update Category" hint="I cause a Category to be updated from the current event object.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />		
		<cfset var category = arguments.event.getArg("category") />
		
		<cftry>
    		<cfset variables.categoryDAO.update(category) />
		
		    <cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to update the record. The error message is: #cfcatch.message#">
		    </cfcatch>
		</cftry>
		
		<cfset announceEvent('cms.category.updateSuccess') />
		
	</cffunction>
	
	<cffunction name="removeCategoryByID" access="public" returntype="void" output="false" displayname="Delete Category" hint="I cause a Category to be deleted.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event" />		
		<cfset var category = arguments.event.getArg("category") />
		<cftry>
    		<cfset variables.categoryDAO.delete(category) />
		    <cfcatch type="database">
		        <cfthrow message="Sorry there was an error while trying to delete the record. The error message is: #cfcatch.message#">
		    </cfcatch>
		</cftry>
		<cfset announceEvent('cms.category.deleteSuccess') />
		
	</cffunction>

</cfcomponent>
