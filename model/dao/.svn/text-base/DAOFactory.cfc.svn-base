<cfcomponent displayname="Abstract DAOFactory">
 
	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.dao.DAOFactory">		
		<cfargument name="dsn" type="string" required="true" />		
		<cfscript>			
			variables.dsn = arguments.dsn;
		</cfscript>		
		<cfreturn this />
	</cffunction>
 
	<cffunction name="getDAOFactory" access="public" returntype="uk.co.tcias.gregs.model.dao.DAOFactory" output="false">
		<cfargument name="factoryType" type="string" required="Yes" />  
		<cfset var returndaofactory = "">	  
		<cfswitch expression="#ucase(arguments.factoryType)#">
			<cfcase value="MYSQL">
				<cfset returndaofactory = createObject("component","uk.co.tcias.gregs.model.dao.DAOFactory_mysql").init(variables.dsn) />
			</cfcase>
			<cfcase value="XML">
				<cfset returndaofactory = createObject("component","uk.co.tcias.gregs.model.dao.DAOFactory_xml").init(variables.dsn) />
			</cfcase>
		</cfswitch>
		<cfreturn returndaofactory />
	</cffunction>
 	
	<cffunction name="getContentDAO" access="public">
		<cfabort showerror="This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="getCategoryDAO" access="public">
		<cfabort showerror="This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="getLoginDAO" access="public">
		<cfabort showerror="This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="getCommentDAO" access="public">
		<cfabort showerror="This Method is Abstract and needs to be overridden">
	</cffunction>
	
</cfcomponent>
