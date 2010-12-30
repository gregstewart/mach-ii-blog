
<cfcomponent displayname="Category DAO" hint="I abstract data access for Categories">

	<!--- uk.co.tcias.gregs.model.category. --->
	<cffunction name="init" access="public" returntype="categoryDAO" output="false">		
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfabort showerror="categoryDAO.create - This Method is Abstract and needs to be overridden" />
	</cffunction>
	
	<cffunction name="readByID" access="public" returntype="void" output="false"  hint="CRUD method">
		<cfargument name="category" type="uk.co.tcias.gregs.model.category.category" required="yes" displayname="read" hint="I am the category object into which data is read." />
		<cfargument name="categoryID" type="string" required="true" hint="I am the ID of the database record to read." />		
		<cfset var categorySelect = 0 />
		
        <cfquery name="categorySelect" datasource="#variables.dsn#">
			SELECT 	category_id, name, priority
			FROM	categorisation
			WHERE	category_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.categoryid#" >
		</cfquery>		
		<cfif categorySelect.recordCount>
			<cfscript>			
				arguments.category.setCategoryID(categorySelect.category_ID);
				arguments.category.setName(categorySelect.name);
				arguments.category.setPriority(categorySelect.priority);
			</cfscript>
		<cfelse>
			<cfthrow message="categoryID #arguments.categoryID# not found" type="category" detail="" errorcode="category.categoryNotFound" extendedinfo="" />
		</cfif>
	</cffunction>
		
	<cffunction name="readByTitle" access="public" returntype="void" output="false"  hint="CRUD method">
		<cfargument name="category" type="uk.co.tcias.gregs.model.category.category" required="yes" displayname="read" hint="I am the category object into which data is read." />
		<cfargument name="categoryname" type="string" required="true" hint="I am the ID of the database record to read." />		
		<cfset var categorySelect = 0 />
		<cfset var memento = structNew() />
		
		<cfquery name="categorySelect" datasource="#variables.dsn#">
			SELECT 	category_id, name, priority
			FROM	categorisation
			WHERE	name = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#trim(Replace(arguments.categoryname, "_", " ", "ALL"))#" >
		</cfquery>		
		
		<cfif categorySelect.recordCount>
			<cfscript>			
				arguments.category.setCategoryID(categorySelect.category_ID);
				arguments.category.setName(categorySelect.name);
				arguments.category.setPriority(categorySelect.priority);
			</cfscript>
		<cfelse>
			<cfthrow message="category name #arguments.categoryname# not found" type="category" detail="" errorcode="category.categoryNotFound" extendedinfo="" />
		</cfif>	
						
	</cffunction>
	
	<cffunction name="update" returntype="void" output="false" hint="CRUD method">
		<cfargument name="category" type="uk.co.tcias.gregs.model.category.category" required="true" />		
		
		<cfset categoryUpdate = 0 >
		<!--- TODO: Still need to add the related _to both here and in the UI --->
		<cfquery name="categoryUpdate" datasource="#variables.dsn#" >
			UPDATE categorisation	
			SET		name = '#trim(arguments.category.getName())#',					
					priority = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.category.getPriority()#" >
			WHERE	category_id = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.category.getCategoryID()#" >
		</cfquery> 		
	</cffunction>
		
	<cffunction name="delete" returntype="void" output="false" hint="CRUD method">
		<cfargument name="category" type="uk.co.tcias.gregs.model.category.category" required="true" />		
		<cfset categoryDelete = 0 >
		<cfquery name="categoryDelete" datasource="#variables.dsn#" >
			DELETE FROM categories	
			WHERE	category_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.category.getCategoryID()#" >
		</cfquery> 		
	</cffunction>
	
</cfcomponent>
