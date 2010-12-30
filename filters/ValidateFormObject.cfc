<!---
	$Id: ValidateFormObject.cfc,v 1.1 2004/03/16 08:32:59 seancorfield Exp $
	
	I am an event-filter that manages validation of a form object created by FormObjectBeaner.
	
	Define me as a filter like this:
	
	<event-filters>
		...
		<event-filter name="validateFormObject" type="openxcf.machii.filters.ValidateFormObject" />
		...
	</event-filters>

	Use me to validate a form object like this:
	
	<event-handlers>
		...
		<event-handler event="foo">
			<filter name="formObjectBeaner">
				<parameter name="formObjectName" value="bar" />
				<parameter name="formObjectType" value="my.model.Bar" />
			</filter>
			<filter name="validateFormObject">
				<parameter name="formObjectName" value="bar" />
				<parameter name="invalidEvent" value="formHasInvalidBar" />
				<parameter name="clearEventQueue" value="true" />
			</filter>
			...
		</event-handler>
		...
	</event-handlers>
	
	formObjectName and invalidEvent are required (the filter will fail without them).
	clearEventQueue is optional and defaults to false.
	these three parameters can be specified in the <parameters> block when the
	event-filter is defined - parameter values specified in the <filter> tag override
	the default values set in the <parameters> block.
	if the event argument bar's validate() method returns false,
	then this filter will add formObjectName to the current event arguments,
		optionally clear the event queue,
		announce formHasInvalidBar passing the current event arguments
		and finally return false
	else this filter will return true.
--->
<cfcomponent extends="MachII.framework.EventFilter" display="ValidateFormObject filter"
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
			var formObjectName = "";
			var invalidEvent = "";
			var clearEventQueue = false;
			
			if ( structKeyExists( arguments.paramArgs, "formObjectName" ) ) {
				formObjectName = arguments.paramArgs.formObjectName;
			} else {
				formObjectName = getParameter( "formObjectName", "" );
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
            
            if ( arguments.event.getArg( formObjectName ).validate() ) {
				return true;	// allow processing to continue
			} else {
				if ( clearEventQueue ) {
					arguments.eventContext.clearEventQueue();
				}
				arguments.event.setArg( "formObjectName", formObjectName );
				arguments.eventContext.announceEvent( invalidEvent, arguments.event.getArgs() );
				return false;	// abort the current event handler
			}
		</cfscript>
		
	</cffunction>
	
</cfcomponent>
