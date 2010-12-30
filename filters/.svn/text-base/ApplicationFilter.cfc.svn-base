
<cfcomponent extends="MachII.framework.EventFilter">
	<cffunction name="configure" returntype="void" access="public" output="false">
		<!--- perform any initialization --->
	</cffunction>

	<cffunction name="filterEvent" returntype="boolean" access="public" output="false" hint="If I am a certain categoryObject I can announce a special event">
		<cfargument name="event" type="MachII.framework.Event" required="yes" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="yes" />
		<cfargument name="paramArgs" type="struct" required="yes" />
		<cfset var invalidEvent = getParameter("invalidEvent") />
		<cfset var clearEventQueue = getParameter("clearEventQueue") />
		
		<!--- other var declarations --->
		<cfif structKeyExists(paramArgs,"invalidEvent")>
			<cfset invalidEvent = paramArgs.invalidEvent />
		</cfif>
		
		<cfif structKeyExists(paramArgs,"clearEventQueue")>
			<cfset clearEventQueue = paramArgs.clearEventQueue />
		</cfif>

		<cfif arguments.event.isArgDefined("categoryObject") and arguments.event.getArg("categoryObject").getName() eq "home">
			
			<!--- note: clearEventQueue parameter is really a string --->
			<cfif clearEventQueue is "true">
				<cfset arguments.eventContext.clearEventQueue() />
			</cfif>
			
			<!--- pass current event's arguments into the new event: --->
			<cfset arguments.eventContext.announceEvent(invalidEvent,arguments.event.getArgs()) />
			<cfreturn false />
		</cfif>
		
		<cfreturn true />
	</cffunction>
</cfcomponent>
