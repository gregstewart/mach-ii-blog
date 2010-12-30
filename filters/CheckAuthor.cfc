<!---
	
	<event-filters>
		...
		<event-filter name="checkAythor" type="filters.CheckAuthor" />
		...
	</event-filters>

	Use me to check the value of the author against that of the logged in user:
	
	<event-handlers>
		...
		<event-handler event="foo">
			<filter name="checkAuthor">
				<parameter name="contentObject" value="bar" />
				<parameter name="invalidEvent" value="noEditPermission" />
				<parameter name="clearEventQueue" value="true" />
			</filter>
			...
		</event-handler>
		...
	</event-handlers>
	
	userObject is required (the filter will fail without them).
	clearEventQueue and invalidEvent is optional and defaults to false.
	these three parameters can be specified in the <parameters> block when the
	event-filter is defined - parameter values specified in the <filter> tag override
	the default values set in the <parameters> block.
	if the event argument bar's validate() method returns false,
	then this filter will add contentObject to the current event arguments,
    if the author id is blank, the on from the user session is applied to the author 
    else
        if the author id is different to the user id then no edit pernmission
            clear event queue
            announce invalid event
            and return false
        else 
		    return true
	else this filter will return true.
--->
<cfcomponent extends="MachII.framework.EventFilter" display="Check Author filter"
	hint="I am an event filter that manages validation of a form object." output="true">
	
	<cffunction name="filterEvent" access="public" returntype="boolean"
		displayname="filterEvent method" hint="I am invoked by the Mach II framework." output="true">
		<cfargument name="event" type="MachII.framework.Event" required="true"
			displayname="event object" hint="I am the current event object created by the Mach II framework." />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true"
			displayname="eventContext object" hint="I am the current event context object created by the Mach II framework." />
		<cfargument name="paramArgs" type="struct" required="false" default="#structNew()#"
			displayname="paramArgs structure" hint="I am the structure containing the parameters specified in the filter invocation in mach-ii.xml." />
        
		<cfscript>
			var pm = getAppManager().getPropertyManager();	
			var uf = pm.getProperty("userfacade");
			var user = uf.getUser();
			var contentObject = "";
			var invalidEvent = "";
			var clearEventQueue = false;
		
			if ( structKeyExists( arguments.paramArgs, "contentObject" ) ) {
				contentObject = arguments.paramArgs.contentObject;
			} else {
				contentObject = getParameter( "contentObject", "" );
			}
			if ( structKeyExists( arguments.paramArgs, "invalidEvent" ) ) {
				invalidEvent = arguments.paramArgs.invalidEvent;
			} else {
				invalidEvent = getParameter( "invalidEvent", "" );
			}
			if ( structKeyExists( arguments.paramArgs, "clearEventQueue" ) ) {
				clearEventQueue = arguments.paramArgs.clearEventQueue;
			} else {
				clearEventQueue = getParameter( "clearEventQueue", false );
			}
            
		</cfscript>
		
		<!--- <cfdump var="#arguments.event.getArg( contentObject )#" label="Test" />
		<cfabort /> --->
		<cfscript>		
			if (arguments.event.getArg( contentObject ).getAuthor() eq "") {
			    arguments.event.getArg( contentObject ).setAuthor(user.getUserID());
			    return true;	
			} else {
			    if (arguments.event.getArg( contentObject ).getAuthor() neq user.getUserID()) {
			    	if ( clearEventQueue ) {
						arguments.eventContext.clearEventQueue();
					}
					arguments.event.setArg( "contentObject", contentObject );
					arguments.eventContext.announceEvent( invalidEvent, arguments.event.getArgs() );
			    	return false;
			    } else {
			        return true;
			    }
			}
		</cfscript>
		
	</cffunction>
	
</cfcomponent>
