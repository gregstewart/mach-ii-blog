<!-- $Id: trace.cfc,v 1.1 2004/03/16 08:33:13 seancorfield Exp $ - Copyright (c) 2003 Macromedia, Inc. -->
<!---
	Description:
		A plugin to log traces of execution of Mach-II actions into a log file

	Usage:
		<plugin name="{plugin-name}" type="openxcf.machii.plugins.trace">
			<parameters>
				<parameter name="file" value="{filename}" />
			</parameters>
		</plugin>

	$Header: /cvsroot/openxcf/machii/plugins/trace.cfc,v 1.1 2004/03/16 08:33:13 seancorfield Exp $
--->

<cfcomponent name="trace" extends="MachII.framework.Plugin">

	<cfset variables.filename = "trace" />

	<cffunction name="configure" access="public" returntype="void" output="false">
		<cfset var params = getParameters() />
		<cfscript>
			if ( structKeyExists(params, "file") ) {
				variables.filename = params.file;
			}
		</cfscript>
	</cffunction>

	<cffunction name="preProcess" access="public" returntype="void" output="true"
		hint="Plugin point called before event processing begins. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="preProcess", eventContext=arguments.eventContext) />
		<cfset request.tickStart = request.tick />
	</cffunction>

	<cffunction name="preEvent" access="public" returntype="void" output="true"
		hint="Plugin point called before each event is processed. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="preEvent", eventContext=arguments.eventContext) />
	</cffunction>
	
	<cffunction name="postEvent" access="public" returntype="void" output="true"
		hint="Plugin point called after each event is processed. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="postEvent", eventContext=arguments.eventContext) />
	</cffunction>
	
	<cffunction name="preView" access="public" returntype="void" output="true"
		hint="Plugin point called before each view is processed. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="preView", eventContext=arguments.eventContext) />
	</cffunction>
	
	<cffunction name="postView" access="public" returntype="void" output="true"
		hint="Plugin point called after each view is processed. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="postView", eventContext=arguments.eventContext) />
	</cffunction>
	
	<cffunction name="postProcess" access="public" returntype="void" output="true"
		hint="Plugin point called after event processing finishes. Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfset trace(method="postProcess", eventContext=arguments.eventContext) />
		<cfset logToFile(text="Total since preProcess: #request.tick - request.tickStart#") />
	</cffunction>

	<cffunction name="handleException" access="public" returntype="void" output="true"
		hint="Plugin point called when an exception occurs (before exception event is handled). Override to provide custom functionality.">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfargument name="exception" type="MachII.util.Exception" required="true" />
		<cfset trace(method="handleException", eventContext=arguments.eventContext) />
		<cfset logToFile(text="- Exception: msg: #arguments.exception.getMessage()#, detail: #arguments.exception.getDetail()#") />
	</cffunction>

	<cffunction name="trace" access="private">
		<cfargument name="method" type="string" required="true" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfif arguments.eventContext.hasCurrentEvent()>
			<cfset traceit(text="#arguments.method# :: #arguments.eventContext.getCurrentEvent().getName()#") />
		<cfelse>
			<cfset traceit(text="#arguments.method# :: no event") />
		</cfif>
	</cffunction>

	<cffunction name="traceit" access="private">
		<cfargument name="text" type="string" required="true" />
		<!---cftrace text="#arguments.text#" /--->
		<cfset var tc = getTickCount() />
		<cfif structkeyExists(request, "tick")>
			<!---cfset tc = tc - (createObject("JAVA", "coldfusion.server.ServiceFactory").getDebuggingService().getDebuggerStartTime()) /--->
			<!--- <cfset logToFile(text="[#tc# ms (#tc - request.tick#)] - #arguments.text#") /> --->
			<cfset logToScreen(text="[#tc# ms (#tc - request.tick#)] - #arguments.text#") />
			
			<cfset request.tick = tc />
		<cfelse>
			<!---cfset tc = tc - (createObject("JAVA", "coldfusion.server.ServiceFactory").getDebuggingService().getDebuggerStartTime()) /--->
			<cfset logToFile(text="[#tc# ms (1st trace)] - #arguments.text#") />
			<cfset request.tick = tc />
		</cfif>
	</cffunction>

	<cffunction name="logToFile" access="private">
		<cfargument name="text" type="string" required="true" />
		<cflog file="#variables.filename#" text="#arguments.text#" />
	</cffunction>
	
	<cffunction name="logToScreen" access="private">
		<cfargument name="text" type="string" required="true" />
		<p><cfoutput>#arguments.text#</cfoutput></p>
	</cffunction>
</cfcomponent>
