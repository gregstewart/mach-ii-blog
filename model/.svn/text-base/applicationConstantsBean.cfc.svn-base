<cfcomponent displayName="ApplicationConstantsBean" hint="An application constants bean.">
	
	<!--- CONSTRUCTOR --->
	<!--- uk.co.tcias.gregs.model. --->
	<cffunction name="init" access="public" returntype="ApplicationConstantsBean" output="false" >
		<cfargument name="commentPath" type="string" required="true" />	
		<cfargument name="photoPath" type="string" required="true" />		
		<cfargument name="dsn" type="string" required="true" />		
		<cfargument name="dbType" type="string" required="true"  />
		<cfargument name="dbType2" type="string" required="true"  />
		<cfargument name="siteID" type="string" required="true" />		
		<cfargument name="pageTitle" type="string" required="true" />		
		<cfargument name="colSequence" type="string" required="true"  />
		<cfargument name="cssContent" type="numeric" required="true" />		
		<cfargument name="cssMaincol" type="numeric" required="true"  />
		<cfargument name="cssSubCol" type="numeric" required="true" />		
		<cfargument name="cssXcol" type="numeric" required="true"  />
		<cfargument name="cssWrap" type="numeric" required="true" />		
		<cfargument name="cssCol1" type="numeric" required="true"  />
		<cfargument name="cssCol2" type="numeric" required="true" />		
		<cfargument name="skipNav" type="string" required="true"  />
		<cfargument name="styleSheet" type="string" required="true"  />
		<cfargument name="javaScripts" type="string" required="true"  />
		<cfargument name="onLoad" type="string" required="true"  />
		<cfargument name="description" type="string" required="true"  />
		<cfargument name="keywords" type="string" required="true"  />
		<cfargument name="applicationRoot" type="string" required="true"  />
		
		<cfscript>
			variables.instance = structNew();
			setCommentPath(arguments.commentPath);
			setPhotoPath(arguments.photoPath);
			setDsn(arguments.dsn);	
			setDbType(arguments.dbType);
			setDbType2(arguments.dbType2);
			setSiteID(arguments.siteID);
			setPageTitle(arguments.pageTitle);
			setColSequence(arguments.colSequence);
			setCssContent(arguments.cssContent);
			setCssMaincol(arguments.cssMaincol);
			setCssSubCol(arguments.cssSubCol);
			setCssXcol(arguments.cssXcol);
			setCssWrap(arguments.cssWrap);
			setCssCol1(arguments.cssCol1);
			setCssCol2(arguments.cssCol2);
			setSkipNav(arguments.skipNav);
			setStyleSheet(arguments.styleSheet);
			setJavaScripts(arguments.javaScripts);
			setOnLoad(arguments.onLoad);
			setDescription(arguments.description);
			setKeywords(arguments.keywords);
			setApplicationRoot(arguments.applicationRoot);
		</cfscript>
		
		<cfreturn this />
	</cffunction>
	
	<!--- GETTERS/SETTERS --->
	<cffunction name="getCommentPath" access="public" returntype="string" output="false">
		<cfreturn variables.instance.commentPath />
	</cffunction>
	<cffunction name="setCommentPath" access="public" returntype="void" output="false">
		<cfargument name="commentPath" type="string" required="true" />
		<cfset variables.instance.commentPath= arguments.commentPath />
	</cffunction>
	
	<cffunction name="getPhotoPath" access="public" returntype="string" output="false">
		<cfreturn variables.instance.photoPath />
	</cffunction>
	<cffunction name="setPhotoPath" access="public" returntype="void" output="false">
		<cfargument name="photoPath" type="string" required="true" />
		<cfset variables.instance.photoPath= arguments.photoPath />
	</cffunction>
	
	<cffunction name="getDbType" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dbType />
	</cffunction>
	<cffunction name="setDbType" access="public" returntype="void" output="false">
		<cfargument name="dbType" type="string" required="true" />
		<cfset variables.instance.dbType = arguments.dbType />
	</cffunction>
	
	<cffunction name="getDbType2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dbType2 />
	</cffunction>
	<cffunction name="setDbType2" access="public" returntype="void" output="false">
		<cfargument name="dbType2" type="string" required="true" />
		<cfset variables.instance.dbType2 = arguments.dbType2 />
	</cffunction>
	
	<cffunction name="getDsn" access="public" returntype="string" output="false">
		<cfreturn variables.instance.dsn />
	</cffunction>
	<cffunction name="setDsn" access="public" returntype="void" output="false">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.instance.dsn = arguments.dsn />
	</cffunction>
	
	<cffunction name="getSiteID" access="public" returntype="string" output="false">
		<cfreturn variables.instance.siteID />
	</cffunction>
	<cffunction name="setSiteID" access="public" returntype="void" output="false">
		<cfargument name="siteID" type="string" required="true" />
		<cfset variables.instance.siteID = arguments.siteID />
	</cffunction>
	
	<cffunction name="getPageTitle" access="public" returntype="string" output="false">
		<cfreturn variables.instance.pageTitle />
	</cffunction>
	<cffunction name="setPageTitle" access="public" returntype="void" output="false">
		<cfargument name="pageTitle" type="string" required="true" />
		<cfset variables.instance.pageTitle = arguments.pageTitle />
	</cffunction>
	
	<cffunction name="getColSequence" access="public" returntype="string" output="false">
		<cfreturn variables.instance.colSequence />
	</cffunction>
	<cffunction name="setColSequence" access="public" returntype="void" output="false">
		<cfargument name="colSequence" type="string" required="true" />
		<cfset variables.instance.colSequence = arguments.colSequence />
	</cffunction>
	
	<cffunction name="getCssContent" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssContent />
	</cffunction>
	<cffunction name="setCssContent" access="public" returntype="void" output="false">
		<cfargument name="cssContent" type="string" required="true" />
		<cfset variables.instance.cssContent = arguments.cssContent/>
	</cffunction>
	
	<cffunction name="getCssMaincol" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssMaincol />
	</cffunction>
	<cffunction name="setCssMaincol" access="public" returntype="void" output="false">
		<cfargument name="cssMaincol" type="string" required="true" />
		<cfset variables.instance.cssMaincol = arguments.cssMaincol />
	</cffunction>
	
	<cffunction name="getCssSubCol" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssSubCol />
	</cffunction>
	<cffunction name="setCssSubCol" access="public" returntype="void" output="false">
		<cfargument name="cssSubCol" type="string" required="true" />
		<cfset variables.instance.cssSubCol = arguments.cssSubCol />
	</cffunction>
	
	<cffunction name="getCssXcol" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssXcol />
	</cffunction>
	<cffunction name="setCssXcol" access="public" returntype="void" output="false">
		<cfargument name="cssXcol" type="string" required="true" />
		<cfset variables.instance.cssXcol = arguments.cssXcol />
	</cffunction>
	
	<cffunction name="getCssWrap" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssWrap />
	</cffunction>
	<cffunction name="setCssWrap" access="public" returntype="void" output="false">
		<cfargument name="cssWrap" type="string" required="true" />
		<cfset variables.instance.cssWrap = arguments.cssWrap />
	</cffunction>
	
	<cffunction name="getCssCol1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssCol1 />
	</cffunction>
	<cffunction name="setCssCol1" access="public" returntype="void" output="false">
		<cfargument name="cssCol1" type="string" required="true" />
		<cfset variables.instance.cssCol1 = arguments.cssCol1 />
	</cffunction>
	
	<cffunction name="getCssCol2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.cssCol2 />
	</cffunction>
	<cffunction name="setCssCol2" access="public" returntype="void" output="false">
		<cfargument name="cssCol2" type="string" required="true" />
		<cfset variables.instance.cssCol2 = arguments.cssCol2 />
	</cffunction>
	
	<cffunction name="getSkipNav" access="public" returntype="string" output="false">
		<cfreturn variables.instance.skipNav />
	</cffunction>
	<cffunction name="setSkipNav" access="public" returntype="void" output="false">
		<cfargument name="skipNav" type="string" required="true" />
		<cfset variables.instance.skipNav = arguments.skipNav />
	</cffunction>
	
	<cffunction name="getStyleSheet" access="public" returntype="string" output="false">
		<cfreturn variables.instance.styleSheet />
	</cffunction>
	<cffunction name="setStyleSheet" access="public" returntype="void" output="false">
		<cfargument name="styleSheet" type="string" required="true" />
		<cfset variables.instance.styleSheet = arguments.styleSheet />
	</cffunction>
	
	<cffunction name="getJavaScripts" access="public" returntype="string" output="false">
		<cfreturn variables.instance.javaScripts />
	</cffunction>
	<cffunction name="setJavaScripts" access="public" returntype="void" output="false">
		<cfargument name="javaScripts" type="string" required="true" />
		<cfset variables.instance.javaScripts = arguments.javaScripts />
	</cffunction>
	
	<cffunction name="getOnLoad" access="public" returntype="string" output="false">
		<cfreturn variables.instance.onLoad />
	</cffunction>
	<cffunction name="setOnLoad" access="public" returntype="void" output="false">
		<cfargument name="onLoad" type="string" required="true" />
		<cfset variables.instance.onLoad = arguments.onLoad />
	</cffunction>
	
	<cffunction name="getDescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.description />
	</cffunction>
	<cffunction name="setDescription" access="public" returntype="void" output="false">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>
	
	<cffunction name="getKeywords" access="public" returntype="string" output="false">
		<cfreturn variables.instance.keywords />
	</cffunction>
	<cffunction name="setKeywords" access="public" returntype="void" output="false">
		<cfargument name="keywords" type="string" required="true" />
		<cfset variables.instance.keywords = arguments.keywords />
	</cffunction>
	
	<cffunction name="getApplicationRoot" access="public" returntype="string" output="false">
		<cfreturn variables.instance.applicationRoot />
	</cffunction>
	<cffunction name="setApplicationRoot" access="public" returntype="void" output="false">
		<cfargument name="applicationRoot" type="string" required="true" />
		<cfset variables.instance.applicationRoot = arguments.applicationRoot />
	</cffunction>
	
</cfcomponent>
