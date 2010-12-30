<cfcomponent displayname="LoginListener" extends="MachII.framework.Listener" hint="Authenticates a user’s login credentials based on username and password." output="true">	
	<cffunction name="configure" access="public" returntype="void" hint="I initialise the component when the framework fires up">
		<cfscript>			
	    	var appConstants = getAppManager().getPropertyManager().getProperty("appConstants");
	    	var dsn = appConstants.getDsn(); 
			var dbType = appConstants.getDbType(); 			
			variables.pm = getAppManager().getPropertyManager();
			variables.loginDAO = CreateObject("component", "uk.co.tcias.gregs.model.dao.DAOFactory").init(dsn, "wild_tciasdb").getDAOFactory(dbType).getLoginDAO();
		</cfscript>
	</cffunction>
	
	<cffunction name="doLogin" access="private" returntype="void" output="true">		
		<cfargument name="user_id" type="string" required="true" displayname="User ID" hint="I am the user's ID retrieved from the database" />
		<cfargument name="first_name" type="string" required="true" displayname="User First Name" hint="I am the user's first name as retrieved from the database" />
		<cfargument name="name" type="string" required="true" displayname="User Last Name" hint="I am the user's last name as retrieved from the database" />
		<cfscript>				
			var uf = pm.getProperty("userfacade");
			var user = uf.getUser();
			user.setIsLoggedIn(true);
			user.setUsername(arguments.first_name & " " & arguments.name);
			user.setUserID(arguments.user_id);
			uf.setUser(user);
		</cfscript>
		
	</cffunction>
	
	<cffunction name="doLogout" access="public" returntype="void">
		<cfargument name="event" type="MachII.framework.Event" required="true" />				
		<cfscript>	
			var uf = pm.getProperty("userfacade");
			var user = uf.getUser();
			user.setIsLoggedIn(false);						
			user.setUsername("");
			user.setUserID(CreateUUID());
			uf.setUser(user);
			announceEvent('logoutSuccess');
		</cfscript>	
	</cffunction>
	
	<cffunction name="attemptLogin" access="public" returntype="void" output="true">
		<cfargument name="event" type="MachII.framework.Event" required="true" />
		<!--- GET USER INFO --->
		<cfset var username = arguments.event.getArg('username') />
		<cfset var password = arguments.event.getArg('password') />
		<cfset var key = mid(password,1,2) />
		<cfset var encrypted = encrypt(password, key) />
		
		<!--- AUTHENTICATE USER INFO --->
		<cfif isLoginValid(username, encrypted)>
			<cfset announceEvent('loginSuccess') />
		<cfelse>
			<cfset announceEvent('loginFailure') />
		</cfif>
	</cffunction>
	
	<cffunction name="isLoginValid" access="public" returntype="boolean" hint="I attempt to validate the login credentials" output="true">
		<cfargument name="username" type="string" required="true" />
		<cfargument name="password" type="string" required="true" />
		
		<cfset var loginQuery = variables.loginDAO.read(arguments.username,arguments.password) />
		<cfif loginQuery.recordCount eq 1>
			<cfset doLogin(loginQuery.user_id,loginQuery.firstname,loginQuery.name) />
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>
</cfcomponent>