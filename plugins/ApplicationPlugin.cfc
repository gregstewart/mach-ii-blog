
<cfcomponent displayname="ApplicationPlugin" extends="MachII.framework.Plugin" hint="I do initialization tasks.">

	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfscript>
			var pm = getAppManager().getPropertyManager();
			// get some constants from the xml file
			var commentPath = pm.getProperty("commentPath");
			var photoPath = pm.getProperty("photoPath");
			var dsn = pm.getProperty("dsn");
			var dbType = pm.getProperty("dbType");
			var dbType2 = pm.getProperty("dbType2");
			var siteID = pm.getProperty("siteID");
			var pageTitle = pm.getProperty("pageTitle");
			var colSequence = pm.getProperty("colSequence");
			var cssContent = pm.getProperty("cssContent");
			var cssMaincol = pm.getProperty("cssMaincol");
			var cssSubCol = pm.getProperty("cssSubCol");
			var cssXcol = pm.getProperty("cssXcol");
			var cssWrap = pm.getProperty("cssWrap");
			var cssCol1 = pm.getProperty("cssCol1");
			var cssCol2 = pm.getProperty("cssCol2");
			var skipNav = pm.getProperty("skipNav");
			var styleSheet = pm.getProperty("styleSheet");
			var javaScripts = pm.getProperty("javaScripts");
			var onLoad = pm.getProperty("onLoad");
			var description = pm.getProperty("description");
			var keywords = pm.getProperty("keywords");
			var applicationRoot = pm.getProperty("applicationRoot");
			
			// create a user facade and store it in properties
			var userFacade = createObject("component","uk.co.tcias.gregs.model.user.userFacade");
			var formUdf = createObject("component","uk.co.tcias.gregs.model.udf.form");
            var utils = createObject("component","uk.co.tcias.gregs.model.udf.utils");

			// create a bean of application constants and store it in properties
		 	variables.appConstants = createObject("component", "uk.co.tcias.gregs.model.applicationConstantsBean").init(commentPath,photoPath,dsn,dbType,dbType2,siteID,pageTitle,colSequence,cssContent,cssMaincol,cssSubCol,cssXcol,cssWrap,cssCol1,cssCol2,skipNav,styleSheet,javaScripts,onLoad,description,keywords,applicationRoot);
			pm.setProperty("appConstants", variables.appConstants);
			pm.setProperty("userfacade",userFacade);
			pm.setProperty("formUdf",formUdf);
			pm.setProperty("utils",utils);
		 </cfscript>
		 
	</cffunction>

	<!--- PUBLIC FUNCTIONS --->
	<cffunction name="preProcess" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preProcess()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="preEvent" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preEvent()<br /></cfoutput> --->
		<cfscript>
		    var event = arguments.eventContext.getCurrentEvent();
		    var uf = getAppManager().getPropertyManager().getProperty("userfacade");
			var user = "";
			var uuid = "";
            var username = "";
            var isLoggedIn = false;
            var userBannerID = 0;
			// if the user doesn't have a session create it (using the facade)
			if (not uf.hasUser()){
				uuid = CreateUUID();
				user = createObject("component","uk.co.tcias.gregs.model.user.user").init(uuid,username,isLoggedIn,userBannerID);
				uf.setUser(user);
			}
			/* causes error in BD, but not in CFMX [moved to view and it works just fine] */
			// increment the banner
			// uf.getUser().nextUserBannerID();
			// set the session user in the event  using the facade
			event.setArg("sessionUser", uf.getUser());
			// outputs the event name
			// writeOutput(event.getName()&"<hr />");
		</cfscript>
		
	</cffunction>

	<cffunction name="postEvent" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postEvent()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="preView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postProcess" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postProcess()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="handleException" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfargument name="exception" type="MachII.util.Exception" required="true" />
		<cfoutput>&nbsp;InitializationPlugin.handleException()<br /></cfoutput>
		<cfoutput>#arguments.exception.getMessage()#</cfoutput>
	</cffunction>

</cfcomponent>
