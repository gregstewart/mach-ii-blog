<cfcomponent name="user" displayname="User" hint="I model a single user.">

	<!--- uk.co.tcias.gregs.model.user. --->
	<cffunction name="init" access="public" returntype="user" output="false" displayname="User Constructor" hint="I initialize a user.">
		<cfargument name="userID" type="string" required="false" default="" displayname="user ID" hint="I am the unique user ID passed in" />
		<cfargument name="username" type="string" required="false" default="" displayname="my user name" hint="I am the user name" />
		<cfargument name="isLoggedIn" type="boolean" required="false" default="false" displayname="is logged in" hint="I am a boolean value indicating whether the use is logged in" />
		<cfargument name="userBannerID" type="numeric" required="false" default="0" displayname="user banner ID" hint="I am the unique user's current banner id to display'" />

		<cfscript>
			variables.instance = structNew();
			setUserID(arguments.userID);
			setUsername(arguments.username);
			setIsLoggedIn(arguments.isLoggedIn);
			setUserBannerID(arguments.userBannerID);
		</cfscript>
		<cfreturn this />
	</cffunction>

	<cffunction name="getMemento" access="public" returntype="struct" output="false" hint="I return a memento of this users instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setMemento" access="public" returntype="uk.co.tcias.gregs.model.user.user" output="false" hint="I set this user's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes" displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<!--- GETTERS/SETTERS --->

	<cffunction name="getUserID" access="public" returntype="string" output="false" displayname="get user ID" hint="I return userID">
		<cfreturn variables.instance.userID />
	</cffunction>
	<cffunction name="setUserID" access="public" returntype="void" output="false" displayname="set user ID" hint="I set the userID">
		<cfargument name="userID" type="string" required="true" />
		<cfset variables.instance.userID = arguments.userID />
	</cffunction>

	<cffunction name="getIsLoggedIn" access="public" returntype="boolean" output="false" displayname="get is logged in" hint="I return a boolean value flagging the login status">
		<cfreturn variables.instance.isLoggedIn />
	</cffunction>
	<cffunction name="setIsLoggedIn" access="public" returntype="void" output="false" displayname="set the login status" hint="I set the login status">
		<cfargument name="isLoggedIn" type="boolean" required="true" displayname="I am the logged in flag" />
		<cfset variables.instance.isLoggedIn = arguments.isLoggedIn >
	</cffunction>

	<cffunction name="getUsername" access="public" returntype="string" output="false" displayname="get user name" hint="I return the user name">
		<cfreturn variables.instance.username />
	</cffunction>
	<cffunction name="setUsername" access="public" returntype="void" output="false" displayname="set user name" hint="I set the user name">
		<cfargument name="username" type="string" required="true" displayname="I am the username passed in" />
		<cfset variables.instance.username = arguments.username />
	</cffunction>

	<cffunction name="getUserBannerID" access="public" returntype="numeric" output="false" displayname="get user banner ID" hint="I return userBannerID">
		<cfreturn variables.instance.userBannerID />
	</cffunction>
	<cffunction name="setUserBannerID" access="public" returntype="void" output="false" displayname="set user banner ID" hint="I set the userBannerID">
		<cfargument name="userBannerID" type="numeric" required="true" />
		<cfset variables.instance.userBannerID = arguments.userBannerID />
	</cffunction>

	<!--- <cffunction name="getUserTO" access="public" return="appPath.model.user.userTO" output="false" displayname="get user Transfer Object" hint="I return the user Transfer Object">
		<cfreturn createUserTO() />
	</cffunction> --->

	<!--- <cffunction name="setUserFromTO" access="public" return="void" output="false" hint="set the instance data from TO">
		<cfargument name="userTO" type="machii_info.model.user.userTO" />
		<cfscript>
			setuserID(userTO.userID);
			setUsername(userTO.username);
			setFirstname(userTO.firstName);
			setLastname(userTO.lastName);
			setEmail(userTO.email);
			setPassword(userTO.password);
			setPassword2(userTO.password);
			setCompany(userTO.company);
			setIsAdmin(userTO.isAdmin);
		</cfscript>
	</cffunction> --->

	<!--- <cffunction name="createUserTO" access="package" return="appPath.model.user.userTO" output="false" displayname="create the user TO" hint="I create the user TO">
		<cfscript>
			var userTO = createObject("component", "userTO").init(argumentcollection=variables.instance,errors=variables.errors);
			return userTO;
		</cfscript>
	</cffunction> --->
	<cffunction name="nextUserBannerID" access="public" returntype="void" output="false" displayname="next user banner id" hint="I set the next user banner id, i.e. incrememt the current one by one">
        <cfscript>
            var currentBannerID = getUserBannerID();
            if (currentBannerID lte 50) {
                setUserBannerID(currentBannerID+1);
            } else {
                if (currentBannerID mod 2) {
                	setUserBannerID(1);
                } else {
                	setUserBannerID(0);
                }
            }
        </cfscript>
    </cffunction>
</cfcomponent>