
<cfcomponent displayname="Photo Gateway" hint="I am a data gateway to photo">

	<cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.photos.photoGateway" output="false" displayname="Gateway Constructor" hint="I initialize the photo gateway.">
		<cfargument name="pathToFile" type="string" required="yes" displayname="Path to file" hint="I am the path to the photos." />	
		<cfset variables.pathToFile = arguments.pathToFile />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="findAll" access="public" returntype="query" output="false" displayname="Find All" hint="I return a query containing all photos">
		<cfargument name="galleryName" type="string" default="" required="true" displayname="Gallery Name" hint="I am the gallery to search for" />
		<cfset var qrySelect = 0 />
		
		<cfdirectory action="list" directory="#variables.pathToFile##arguments.galleryName#" name="qrySelect" />
		
		
		<cfreturn qrySelect />
	</cffunction>
	
</cfcomponent>