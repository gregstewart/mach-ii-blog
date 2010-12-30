<!---
	Security.cfc
	
	I am an event-filter that manages security of an application.  
	I access the user's session via a UserFacade and check if they are logged in.
	
	Define me as a filter like this:
	
	<event-filters>
		...
		<event-filter name="security" type="mypath.filters.Security" >
			<parameters>
				<parameter name="invalidEvent" value="showLogin" />
			</parameters>
		</event-filter>		
		...
	</event-filters>

	Use me to secure an event handler like this:
	
	<event-handlers>
		...
		<event-handler event="foo">
			<filter name="security">
				<parameter name="invalidEvent" value="someEvent" />
			</filter>			
			...
		</event-handler>
		...
		<event-handler event="bar">
			<filter name="security" />
			...
		</event-handler>
		
	</event-handlers>
	
	invalidEvent is required.
	It can be specified in the <parameters> block when the
	event-filter is defined - parameter values specified in the <filter> tag override
	the default values set in the <parameters> block.
	if isLoggedIn is true then 
		this filter will return true
	else 
		it will clear the event queue, announce the invalidEvent and return false.
--->
<cfcomponent extends="MachII.framework.EventFilter" display="Security filter" hint="I am an event filter that manages security of an application" output="true">
	
	<cffunction name="filterEvent" access="public" returntype="boolean" displayname="filterEvent method" hint="I am invoked by the Mach II framework." output="true">
		<cfargument name="event" type="MachII.framework.Event" required="true" displayname="event object" hint="I am the current event object created by the Mach II framework." />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" displayname="eventContext object" hint="I am the current event context object created by the Mach II framework." />
		<cfargument name="paramArgs" type="struct" required="false" default="#structNew()#" displayname="paramArgs structure" hint="I am the structure containing the parameters specified in the filter invocation in mach-ii.xml." />		
		<cfscript>		
			var pm = getAppManager().getPropertyManager();	
			var uf = pm.getProperty("userfacade");
			var invalidEvent = "";
			var clearEventQueue = true;			
			var isLoggedIn = false;
			
			if (uf.hasUser()){
				isLoggedIn = uf.getUser().getIsLoggedIn();
				
			}							
			if ( structKeyExists( arguments.paramArgs, "invalidEvent" ) ) {
				invalidEvent = arguments.paramArgs.invalidEvent;
			} else {
				invalidEvent = getParameter( "invalidEvent", "" );
			}
			if ( structKeyExists( arguments.paramArgs, "clearEventQueue" ) ) {
				clearEventQueue = arguments.paramArgs.clearEventQueue;
			} else {
				clearEventQueue = getParameter( "clearEventQueue", true );
			}
			
			/*
			convert to CFTAG syntax due to BD problems
			if ( isLoggedIn  ) {
				return true;	// allow processing to continue
			} else {
				if ( clearEventQueue ) {
					arguments.eventContext.clearEventQueue();
				}				
				arguments.eventContext.announceEvent( invalidEvent, arguments.event.getArgs() );
				return false;	// abort the current event handler
			}
			*/
		</cfscript>
		<cfif isLoggedIn >
			<cfreturn true />
		<cfelse>
			<cfif clearEventQueue >
				<cfset arguments.eventContext.clearEventQueue() />
			</cfif>
				<cfset arguments.eventContext.announceEvent( invalidEvent, arguments.event.getArgs() ) />
				<cfreturn false />	 <!--- abort the current event handler --->
		</cfif>
	</cffunction>
	
</cfcomponent>
