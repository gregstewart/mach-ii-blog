
<cfcomponent displayname="Content" hint="I model a single Content.">

	<cffunction name="init" access="public" returntype="content" output="false" displayname="Content Constructor" hint="I initialize a Content.">
		<cfargument name="contentID" type="string" required="false" default="0" displayname="Content ID" hint="I am the content identifier" />
		<cfargument name="title" type="string" required="false" default="" displayname="Title" hint="I am thetitle of the item of content" />
		<cfargument name="articleContent" type="string" required="false" default="" displayname="Article" hint="I am the body of content" />		
		<cfargument name="name" type="string" required="false" default="" displayname="Category name" hint="I am the selected category for this item of content" />
		<cfargument name="categoryID" type="string" required="false" default="" displayname="Category name" hint="I am the selected category for this item of content" />
		<cfargument name="teaser" type="string" required="false" default="" displayname="Teaser" hint="I am the teaser for this item." />		
		<cfargument name="publicationDate" type="date" required="false" default="#now()#" displayname="Publication date" hint="I am the date this item is to be published on" />		
		<cfargument name="expiryDate" type="date" required="false" default="#now()#" displayname="Expiry Date" hint="I am the date this item is set to expire on" />		
		<cfargument name="dateAdded" type="date" required="false" default="#now()#" displayname="Date Added" hint="I am the date this item was added on" />		
		<cfargument name="contentMetaData" type="string" required="false" default="" displayname="Content Meta Data" hint="I am the meta data for this item" />		
		<cfargument name="isPublished" type="boolean" required="false" default="false" displayname="is Published" hint="I am a flag that indicates whether I was published or not" />		
		<cfargument name="author" type="string" required="false" default="" displayname="is Published" hint="I am a flag that indicates whether I was published or not" />		
		<cfargument name="contentType" type="string" required="false" default="bb4f74b892a4854e3f0bcf262acf1e09" displayname="content type" hint="I am the content type" />		
		
		<cfscript>			
			variables.instance = structNew();
			setContentID(arguments.contentID);
			setTitle(arguments.title);
			setArticleContent(arguments.articleContent);
			setCatName(arguments.name);
			setCategoryID(arguments.categoryID);
			setTeaser(arguments.teaser);
			setPublicationDate(arguments.publicationDate);
			setExpiryDate(arguments.expiryDate);
			setDateAdded(arguments.dateAdded);
			setContentMetaData(arguments.contentMetaData);
			setIsPublished(arguments.isPublished);
			setAuthor(arguments.author);
			setContentType(arguments.contentType);
			variables.myErrors = structNew();
		</cfscript>				
		<cfreturn this />
	</cffunction>
			
	<!--- GETTERS/SETTERS --->
	
	<cffunction name="getContentID" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return contentID">
		<cfreturn variables.instance.ContentID />
	</cffunction>	
	<cffunction name="setContentID" access="public" returntype="void" output="false" displayname="Get Instance Memento" hint="I return ContentID">
		<cfargument name="Contentid" type="string" required="true" default="#CreateUUID()#" />
		<cfset variables.instance.ContentID = arguments.Contentid />
	</cffunction>	
			
	
	<cffunction name="getTitle" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return the title">
		<cfreturn variables.instance.title />
	</cffunction>
	<cffunction name="setTitle" access="public" returntype="void" output="false" displayname="Get Instance Memento" hint="I set the content title">
		<cfargument name="title" type="string" required="true" default="" />
		<cfset variables.instance.title = arguments.title />
	</cffunction>
	
	
	<cffunction name="getArticleContent" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return the article content">
		<cfreturn variables.instance.articleContent />
	</cffunction>
	<cffunction name="setArticleContent" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the content">
		<cfargument name="articleContent" type="string" required="true" default="" />
		<cfset variables.instance.articleContent = arguments.articleContent />
	</cffunction>
						

	<cffunction name="getCatName" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return the category name">
		<cfreturn variables.instance.name />
	</cffunction>
	<cffunction name="setCatName" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the category name">
		<cfargument name="name" type="string" required="true" default="" />
		<cfset variables.instance.name = arguments.name />
	</cffunction>
	
	
	<cffunction name="getCategoryID" access="public" returntype="string" output="false" displayname="Get category id" hint="I return categoryID">
		<cfreturn variables.instance.categoryID />
	</cffunction>	
	<cffunction name="setCategoryID" access="public" returntype="void" output="false" displayname="set category id" hint="I return categoryID">
		<cfargument name="categoryID" type="string" required="true" default="#CreateUUID()#" />
		<cfset variables.instance.categoryID = arguments.categoryID />
	</cffunction>	
	
	
	<cffunction name="getTeaser" access="public" returntype="string" output="false" displayname="Get the teaser" hint="I return the teaser">
		<cfreturn variables.instance.teaser />
	</cffunction>
	<cffunction name="setTeaser" access="public" returntype="void" output="false" displayname="Set teaser" hint="I set the teaser">
		<cfargument name="teaser" type="string" required="true" default="" />
		<cfset variables.instance.teaser = arguments.teaser />
	</cffunction>
	
	
	<cffunction name="getPublicationDate" access="public" returntype="string" output="false" displayname="Get the publication date" hint="I return the publication date">
		<cfreturn DateFormat(variables.instance.publicationDate,"yyyy-mm-dd hh:mm:ss" )/>
	</cffunction>
	<cffunction name="setPublicationDate" access="public" returntype="void" output="false" displayname="Set publication date" hint="I set the publication date">
		<cfargument name="publicationDate" type="string" required="true" default="#now()#" />
		<!--- 
			I opted for setting this to string because I'll validate the manually, otherwise the framework throws an error
		 --->
		<cfset variables.instance.publicationDate = arguments.publicationDate />
	</cffunction>
	
	
	<cffunction name="getExpiryDate" access="public" returntype="string" output="false" displayname="Get the expiry date" hint="I return the expiry date">
		<cfreturn DateFormat(variables.instance.expiryDate,"yyyy-mm-dd hh:mm:ss") />
	</cffunction>
	<cffunction name="setExpiryDate" access="public" returntype="void" output="false" displayname="Set expiry date" hint="I set the expiry date">
		<cfargument name="expiryDate" type="string" required="true" default="#now()#" />
		<cfset variables.instance.expiryDate = arguments.expiryDate />
	</cffunction>
	
	
	<cffunction name="getDateAdded" access="public" returntype="string" output="false" displayname="Get the date added" hint="I return the date added">
		<cfreturn DateFormat(variables.instance.dateAdded,"yyyy-mm-dd hh:mm:ss") />
	</cffunction>
	<cffunction name="setDateAdded" access="public" returntype="void" output="false" displayname="Set date added" hint="I set the date added">
		<cfargument name="dateAdded" type="string" required="true" default="#now()#" />
		<cfset variables.instance.dateAdded = arguments.dateAdded />
	</cffunction>
	
	
	<cffunction name="getContentMetaData" access="public" returntype="string" output="false" displayname="Get the meta data" hint="I return the meta data">
		<cfreturn variables.instance.contentMetaData />
	</cffunction>
	<cffunction name="setContentMetaData" access="public" returntype="void" output="false" displayname="Set meta data" hint="I set the meta data">
		<cfargument name="contentMetaData" type="string" required="true" default="" />
		<cfset variables.instance.contentMetaData = arguments.contentMetaData />
	</cffunction>
	
	
	<cffunction name="getIsPublished" access="public" returntype="boolean" output="false" displayname="Get the is publishedstatus" hint="I return the is published status">
		<cfreturn variables.instance.isPublished />
	</cffunction>
	<cffunction name="setIsPublished" access="public" returntype="void" output="false" displayname="Set  is published status" hint="I set the meta data">
		<cfargument name="isPublished" type="boolean" required="true" default="false" />
		<cfset variables.instance.isPublished = arguments.isPublished />
	</cffunction>
	
	
	<cffunction name="getAuthor" access="public" returntype="string" output="false" displayname="Get the author ID" hint="I return the iauthor ID">
		<cfreturn variables.instance.author />
	</cffunction>
	<cffunction name="setAuthor" access="public" returntype="void" output="false" displayname="Set the author ID" hint="I set the author ID">
		<cfargument name="author" type="string" required="true" default="false" />
		<cfset variables.instance.author = arguments.author />
	</cffunction>


	<cffunction name="getContentType" access="public" returntype="string" output="false" displayname="Get the Content Type" hint="I return the Content Type">
		<cfreturn variables.instance.contentType/>
	</cffunction>
	<cffunction name="setContentType" access="public" returntype="void" output="false" displayname="Set the Content Type" hint="I set the Content Type">
		<cfargument name="contentType" type="string" required="true" default="false" />
		<cfset variables.instance.contentType = arguments.contentType />
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
		  
		<cfif getTitle() eq "">
			<cfset formErrors.title = "The content title cannot be empty" />
		</cfif>
		<cfif getTeaser() eq "">
			<cfset formErrors.teaser = "The teaser can't be empty" />
		</cfif>
		<cfif getArticleContent() eq "">
			<cfset formErrors.articleContent = "The article nody can't be empty" />
		</cfif>
		<cfif getPublicationDate() eq "">
			<!--- 
				{ts '2005-04-06 00:00:00'} 
				2005-04-06 00:00:00  
			 --->
			<cfset formErrors.publicationDate = "The publication date can't be empty" />
		<cfelse>
			<cfif NOT isDate(getPublicationDate())>
				<cfset formErrors.publicationDate = "Sorry the date you submitted ("& getPublicationDate() &") as a publication date is invalid. The application expects the following format: yyyy-mm-dd hh:mm:ss.0" />
			</cfif>
		</cfif>
		<cfif getExpiryDate() eq "">
			<cfset formErrors.expiryDate = "The expiry date can't be empty" />
		<cfelse>
			<cfif NOT isDate(getExpiryDate())>
				<cfset formErrors.expiryDate = "Sorry the date you submitted ("& getExpiryDate() &") as an expiry date is invalid. The application expects the following format: yyyy-mm-dd hh:mm:ss.0" />
			</cfif>
		</cfif>
		
		<cfif structCount(formErrors) >
			<cfset setErrors(formErrors) />
			<cfset isValid = false />
		</cfif>
		  
		<cfreturn isValid />
	</cffunction>
</cfcomponent>
