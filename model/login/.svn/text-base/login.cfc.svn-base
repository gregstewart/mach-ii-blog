
<cfcomponent displayname="Login" hint="I model a single Login.">

	<cffunction name="init" access="public" returntype="login" output="false" displayname="Login Constructor" hint="I initialize a Login.">
		<cfargument name="username" type="string" required="false" default="0" displayname="Username" hint="I am the username" />
		<cfargument name="password" type="string" required="false" default="" displayname="Password" hint="I am the password" />
		
		<cfscript>			
			variables.instance = structNew();
			setUsername(arguments.username);
			setPassword(arguments.password);
			variables.myErrors = structNew();
		</cfscript>				
		<cfreturn this />
	</cffunction>
			
	<!--- GETTERS/SETTERS --->
	
	<cffunction name="getUsername" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return username">
		<cfreturn variables.instance.username />
	</cffunction>	
	<cffunction name="setUsername" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set username">
		<cfargument name="username" type="string" required="true" default="" displayname="Username" hint="I am the username passed into the object" />
		<cfset variables.instance.username = arguments.username />
	</cffunction>	
			
	
	<cffunction name="getPassword" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return the password">
		<cfreturn variables.instance.password />
	</cffunction>
	<cffunction name="setPassword" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the password">
		<cfargument name="password" type="string" required="true" default="" displayname="Password" hint="I am the password passed into the object" />
		<cfset variables.instance.password = arguments.password />
	</cffunction>
	
	
	
	
	<!--- VALIDATE --->
	<cffunction name="getErrors" access="public" returntype="struct" output="false">
		<cfreturn variables.myErrors />
	</cffunction>
	<cffunction name="setErrors" access="package" returntype="void" output="false">
		<cfargument name="myErrors" type="struct" required="true" />
		<cfset variables.myErrors = arguments.myErrors />
	</cffunction>
	
	<cffunction name="validate" access="public" output="false" returntype="boolean" hint="I validate this bean">
		<cfset var formErrors = structNew() />
		<cfset var isValid = true />
		  
		<cfif getUsername() eq "">
			<cfset formErrors.username = "The username cannot be empty" />
		</cfif>
		<cfif getPassword() eq "">
			<cfset formErrors.password = "The password can't be empty" />
		</cfif>
		
		<cfif structCount(formErrors) >
			<cfset setErrors(formErrors) />
			<cfset isValid = false />
		</cfif>
		  
		<cfreturn isValid />
	</cffunction>
</cfcomponent>
