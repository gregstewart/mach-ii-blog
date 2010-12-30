<cfcomponent name="userFacade" displayname="User Facade" hint="I am a facade to manipulate the user in session scope.">
    <!--- uk.co.tcias.gregs.model.user. --->
    <cffunction name="init" access="public" returntype="userFacade" output="false" displayname="Init" hint="I initialise the component and return it's instance">
		<cfreturn this />
	</cffunction>

	<!--- uk.co.tcias.gregs.model.user. --->
	<cffunction name="getUser" access="public" returntype="user" output="false" displayname="get user" hint="I return the user object stored in the session">
		<cfreturn session.user />
	</cffunction>

	<cffunction name="setUser" access="public" returntype="void" output="false" displayname="set user" hint="I put the user object into the session">
		<cfargument name="user" required="true" type="uk.co.tcias.gregs.model.user.user" />
		<cfset session.user = arguments.user >
	</cffunction>

	<cffunction name="hasUser" access="public" returntype="boolean" output="false" displayname="has user" hint="check if the user objects exists in session" >
		<cfreturn (isDefined("session.user")) />
	</cffunction>

</cfcomponent>