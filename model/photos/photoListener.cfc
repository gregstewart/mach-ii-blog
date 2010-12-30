
<cfcomponent extends="MachII.framework.Listener" displayname="Photo Listener" hint="I am the listener for photos">

	<cffunction name="configure" access="public" returntype="void" output="false" displayname="Listener Constructor" hint="I initialize this listener as part of the framework startup.">				
		<cfscript>			
	    	var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
			var pathToFile = ExpandPath(appConstants.getPhotoPath());		
			variables.photoGateway = createObject("component","uk.co.tcias.gregs.model.photos.photoGateway").init(pathToFile);
		</cfscript>					
	</cffunction>
		
	<cffunction name="getPhotosByTitle" access="public" returntype="query" output="false" displayname="Get All Content" hint="I return a query containing all of the Content.">
		<cfargument name="event" type="MachII.framework.Event" required="yes" displayname="Event" hint="I am the current event, containing a title field that identifies this content." /> 
		<cfset var galleryName = REReplace(arguments.event.getArg("galleryName"), "( HTTP\/)+[0-9].[0-9]", "") /> <!--- oddly enough URLReWrite doesn't strip out HTTP info --->
		<cfreturn variables.photoGateway.findAll(galleryName) />
	</cffunction>		
	
</cfcomponent>
