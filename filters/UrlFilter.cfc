
<cfcomponent extends="MachII.framework.EventFilter">
	<cffunction name="configure" returntype="void" access="public" output="true">
		<!--- perform any initialization --->
	</cffunction>

	<cffunction name="filterEvent" returntype="boolean" access="public" output="true" hint="I remove url request variables that result from .htaccess">
		<cfargument name="event" type="MachII.framework.Event" required="yes" />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="yes" />
		<cfargument name="paramArgs" type="struct" required="yes" />
		<cfset var invalidEvent = getParameter("invalidEvent") />
		<cfset var count = 0 />
		<cfset var i = "" />

		
		<cfif structKeyExists(paramArgs,"invalidEvent")>
			<cfset invalidEvent = paramArgs.invalidEvent />
		</cfif>
		
		<cfset count = StructCount(arguments.event.getArgs()) />
		
		<cfoutput>#count#</cfoutput>
		
		<cfif count gt 0>
		    <!--- Let's loop over the event args and tidy up anything (POST/GET/HTTP) that is part of the FILE variable --->
		    
		    <cfloop collection="#arguments.event.getArgs()#" item="i">
		        <cfoutput>#i#</cfoutput><br />
		        <!--- <strong><cfoutput>#i# - #arguments.event.getArg(i)#</cfoutput></strong><br />
		        
		        <cfif i neq "FILE">
		            <cfset arguments.event.setArg(trim(i),trim(REReplace(REReplace(arguments.event.getArg(i), "(GET|POST )", ""), "( HTTP\/)+[0-9].[0-9]", ""))) />
		        </cfif>
		        <strong><cfoutput>#i# - #arguments.event.getArg(i)#</cfoutput></strong><br /> --->
		    </cfloop>
		</cfif>
		
		<cfreturn true />
	</cffunction>
</cfcomponent>
