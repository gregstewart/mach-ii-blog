
<cfcomponent displayname="Login DAO" hint="I abstract data access for login">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.login.loginDAO" output="false" >		
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="create" returntype="void" output="false" hint="CRUD method">
		<cfabort showerror="loginDAO.create - This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="read" access="public" returntype="query" output="false" hint="CRUD method">
		<cfargument name="username" type="String" required="true" default="" displayname="Username" hint="I am the username to look up." />		
		<cfargument name="password" type="String" required="true" default="" displayname="Username" hint="I am the password to look up." />		
		<cfset var userSelect = 0 />
		
		
		<cfquery name="userSelect" datasource="#variables.dsn#">
		  	SELECT u.user_id, u.firstname, u.name
			FROM users u 
			WHERE u.username = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.username)#" /> 
			AND u.password = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.password)#" />
		</cfquery>	
		<!--- 
		Due to a incompatibility in hashing functions dupe the system while developing<cfscript>
			userSelect = QueryNew("user_id,name,first_name");
			QueryAddRow(userSelect,1);
			QuerySetCell(userSelect,"user_id","e5cff44757a2dc9f0f913ed8f0e32715");
			QuerySetCell(userSelect,"name","Stewart");
			QuerySetCell(userSelect,"first_name","Greg");
		</cfscript> --->	
		
		<cfreturn userSelect />
						
	</cffunction>
	
</cfcomponent>
