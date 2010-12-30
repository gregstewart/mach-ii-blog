
<cfcomponent displayname="Category" hint="I model a single resource.">

	<cffunction name="init" access="public" returntype="resource" output="false" displayname="resource Constructor" hint="I initialize a resource.">
		<cfargument name="resourceID" type="string" required="false" default="0" displayname="" hint="" />
		<cfargument name="name" type="string" required="false" default="" displayname="" hint="" />
		<cfscript>			
			variables.instance = structNew();
			setResource_ID(arguments.resourceID);
		</cfscript>				
		<cfreturn this />
	</cffunction>
			
	<!--- GETTERS/SETTERS --->

	<cffunction name="getResource_ID" access="public" returntype="numeric" output="false" displayname="Get Instance Memento" hint="I return Resource ID">
		<cfreturn variables.instance.Resource_ID />
	</cffunction>
	
	<cffunction name="setResource_ID" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set Resource_ID">
		<cfargument name="resourceID" type="numeric" required="true" />
		<cfset variables.instance.Resource_ID = arguments.resourceID />
	</cffunction>	
						
</cfcomponent>
