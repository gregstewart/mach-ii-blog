
<cfcomponent 
	displayname="SimplePlugin" 
	extends="MachII.framework.Plugin" 
	hint="A simple Plugin example.">

	<!--- PROPERTIES --->
	
	<!--- CONSTRUCTOR --->
	<cffunction name="init" access="public" returntype="void" output="false">
		<cfset startTick = getTickCount() />
		<cfoutput>&nbsp;SimplePlugin.init()<br />Execution start: #startTick#<br /></cfoutput>
	</cffunction>
	
	<cffunction name="configure" access="public" returntype="void" output="false">
	</cffunction>
	
	<!--- PUBLIC FUNCTIONS --->
	<cffunction name="preProcess" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset nextTick = getTickCount() />
		<cfset totalTick = startTick + nextTick />
		<cfoutput>&nbsp;SimplePlugin.preProcess() and the context is: <br />preProcess execution: #nextTick#<br />Total execution time: #totalTick#<br /></cfoutput>
	</cffunction>
	
	<cffunction name="preEvent" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfoutput>&nbsp;SimplePlugin.preEvent() and the context is: <br /></cfoutput>
		<cfloop collection="#arguments.eventContext#" item="i">
			<cfoutput>#i# - #arguments.eventContext[i]#<br /></cfoutput>
		</cfloop>
	</cffunction>
	
	<cffunction name="postEvent" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfoutput>&nbsp;SimplePlugin.postEvent()<br /></cfoutput>
	</cffunction>
	
	<cffunction name="preView" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfoutput>&nbsp;SimplePlugin.preView()<br /></cfoutput>
	</cffunction>
	
	<cffunction name="postView" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfoutput>&nbsp;SimplePlugin.postView()<br /></cfoutput>
	</cffunction>
	
	<cffunction name="postProcess" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfoutput>&nbsp;SimplePlugin.postProcess()<br /></cfoutput>
	</cffunction>
	
	<cffunction name="handleException" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfargument name="exception" type="MachII.util.Exception" required="true" />
		<cfoutput>&nbsp;SimplePlugin.handleException()<br /></cfoutput>
	</cffunction>

</cfcomponent>