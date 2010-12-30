
<cfcomponent displayname="Category" hint="I model a single category.">

	<!--- uk.co.tcias.gregs.model.category. --->
	<cffunction name="init" access="public" returntype="category" output="false" displayname="Category Constructor" hint="I initialize a category.">
		<cfargument name="categoryID" type="string" required="false" default="0" displayname="" hint="" />
		<cfargument name="name" type="string" required="false" default="" displayname="" hint="" />
		<cfargument name="priority" type="numeric" required="false" default="0" displayname="" hint="" />		
		
		<cfscript>			
			variables.instance = structNew();
			setCategoryID(arguments.categoryID);
			setName(arguments.name);
			setPriority(arguments.priority);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
			
	<!--- GETTERS/SETTERS --->
	
	<cffunction name="getCategoryID" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return category ID">
		<cfreturn variables.instance.CategoryID />
	</cffunction>
	<cffunction name="setCategoryID" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set category_ID">
		<cfargument name="categoryID" type="string" required="true" />
		<cfset variables.instance.CategoryID = arguments.categoryID />
	</cffunction>	
			
	<cffunction name="getName" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return the category name">
		<cfreturn variables.instance.Name />
	</cffunction>
	<cffunction name="setName" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the category name">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.instance.name = arguments.name />
	</cffunction>
	
	<cffunction name="getPriority" access="public" returntype="numeric" output="false" displayname="Get Instance Memento" hint="I return the priority">
		<cfreturn variables.instance.priority />
	</cffunction>
	<cffunction name="setPriority" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the priority">
		<cfargument name="priority" type="any" required="true" />
		
		<cfset variables.instance.priority = arguments.priority />
	</cffunction>
						
</cfcomponent>
