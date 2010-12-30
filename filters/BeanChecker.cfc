
<cfcomponent extends="MachII.framework.EventFilter" display="Bean Checker filter"	hint="I am an experimental event filter that compares to beans." output="true">
	
	<cffunction name="filterEvent" access="public" returntype="void" displayname="filterEvent method" hint="I am invoked by the Mach II framework." output="true">
		<cfargument name="event" type="MachII.framework.Event" required="true" displayname="event object" hint="I am the current event object created by the Mach II framework." />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" displayname="eventContext object" hint="I am the current event context object created by the Mach II framework." />
		<cfargument name="paramArgs" type="struct" required="false" default="#structNew()#" displayname="paramArgs structure" hint="I am the structure containing the parameters specified in the filter invocation in mach-ii.xml." />
		
		<cfscript>
			var beanToCheck = "";
			var beanToOverwrite = "";
			
			if ( structKeyExists( arguments.paramArgs, "beanToCheck" ) ) {
				beanToCheck = arguments.paramArgs.beanToCheck;
			} else {
				beanToCheck = getParameter( "beanToCheck", "" );
			}
			
			if ( structKeyExists( arguments.paramArgs, "beanToOverwrite" ) ) {
				beanToOverwrite = arguments.paramArgs.beanToOverwrite;
			} else {
				beanToOverwrite = getParameter( "beanToOverwrite", "" );
			}
			
			if (arguments.event.isArgDefined( beanToCheck )  ) {
				arguments.event.setArg(beanToOverwrite, arguments.event.getArg(beanToCheck));
			}
		</cfscript>
		
		<cfdump var="#beanToOverwrite#" label="overwrite">
		<cfdump var="#beanToCheck#" label="check">
		
		<cfreturn true />
	</cffunction>
	
</cfcomponent>
