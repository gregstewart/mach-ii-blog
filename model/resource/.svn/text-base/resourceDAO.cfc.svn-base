
<cfcomponent displayname="resource DAO" hint="I abstract data access for resources">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.resource.resourceDAO" output="false">		
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfabort showerror="resourceDAO.create - This Method is Abstract and needs to be overridden" />
	</cffunction>
	
	<cffunction name="read" access="public" returntype="void" output="false"  hint="CRUD method">
		<cfargument name="resource" type="uk.co.tcias.gregs.model.resource.resource" required="yes" displayname="read" hint="I am the resource object into which data is read." />
		<cfargument name="resource_ID" type="numeric" required="true" hint="I am the ID of the database record to read." />		
		<cfset var resourceSelect = 0 />
		<cfset var memento = structNew() />
		<cfquery name="resourceSelect" datasource="#variables.dsn#">
			SELECT * 
			FROM	resources
			WHERE	resource_id = <cfqueryparam cfsqltype="string" value="#arguments.resource_ID#" >
		</cfquery>		
		<cfif resourceSelect.recordCount>
			<cfscript>			
				arguments.resource.setResource_ID(resourceSelect.resource_ID);
				arguments.resource.setName(resourceSelect.name);
				arguments.resource.setPriority(resourceSelect.priority);
			</cfscript>
		<cfelse>
			<cfthrow message="resource_ID #arguments.resource_ID# not found" type="resource" detail="" errorcode="resource.resourceNotFound" extendedinfo="" />
		</cfif>	
						
	</cffunction>
	
</cfcomponent>
