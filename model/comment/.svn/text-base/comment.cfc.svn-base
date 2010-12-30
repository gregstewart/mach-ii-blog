
<cfcomponent displayname="Comment" hint="I model a single comment.">

	<!--- uk.co.tcias.gregs.model.comment. --->
	<cffunction name="init" access="public" returntype="comment" output="false" displayname="comment Constructor" hint="I initialize a comment.">
		<cfargument name="commentID" type="string" required="false" default="0" displayname="" hint="" />
		<cfargument name="name" type="string" required="false" default="" displayname="" hint="" />
		<cfargument name="email" type="string" required="false" default="" displayname="" hint="" />
		<cfargument name="website" type="string" required="false" default="" displayname="" hint="" />
		<cfargument name="comment" type="string" required="false" default="" displayname="" hint="" />
		<cfargument name="commentCount" type="numeric" required="false" default="0" displayname="number of comments" hint="I count the number of comments returned" />
		
		<cfscript>			
			variables.instance = structNew();
			setCommentID(arguments.commentID);
			setName(arguments.name);
			setEmail(arguments.email);
			setWebsite(arguments.website);
			setComment(arguments.comment);
			setCommentCount(arguments.commentCount);
		</cfscript>				
		<cfreturn this />
	</cffunction>
			
	<!--- GETTERS/SETTERS --->
	
	<cffunction name="getCommentID" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return commentID">
		<cfreturn variables.instance.commentID />
	</cffunction>	
	<cffunction name="setCommentID" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set commentID">
		<cfargument name="commentID" type="string" required="true" />
		<cfset variables.instance.commentID = arguments.commentID />
	</cffunction>
	
	<cffunction name="getContentID" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return commentID">
		<cfreturn variables.instance.commentID />
	</cffunction>	
	<cffunction name="setContentID" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set commentID">
		<cfargument name="contentID" type="string" required="true" />
		<cfset variables.instance.commentID = arguments.contentID />
	</cffunction>
	
	<cffunction name="getComment" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return commentObject">
		<cfreturn variables.instance.comment />
	</cffunction>
	<cffunction name="setComment" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the commentObject">
		<cfargument name="comment" type="string" required="true" />
		<cfset variables.instance.comment = arguments.comment />
	</cffunction>
	
	
	<cffunction name="getName" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return name">
		<cfreturn variables.instance.name />
	</cffunction>
	<cffunction name="setName" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the name">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.instance.name = arguments.name />
	</cffunction>
	
	
	<cffunction name="getEmail" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return email">
		<cfreturn variables.instance.email />
	</cffunction>
	<cffunction name="setEmail" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the email">
		<cfargument name="email" type="string" required="true" />
		<cfset variables.instance.email = arguments.email />
	</cffunction>
	
	
	<cffunction name="getWebsite" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return website">
		<cfreturn variables.instance.website />
	</cffunction>
	<cffunction name="setWebsite" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the website">
		<cfargument name="website" type="string" required="true" />
		<cfset variables.instance.website = arguments.website />
	</cffunction>
	
	<cffunction name="getCommentObject" access="public" returntype="string" output="false" displayname="Get Instance Memento" hint="I return comment object">
		<cfreturn variables.instance.commentObject />
	</cffunction>
	<cffunction name="setCommentObject" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the comment object">
		<cfargument name="commentObject" type="string" required="true" />
		<cfset variables.instance.commentObject = arguments.commentObject />
	</cffunction>
	
	<cffunction name="getCommentCount" access="public" returntype="numeric" output="false" displayname="Get Instance Memento" hint="I return comment count">
		<cfreturn variables.instance.commentCount />
	</cffunction>
	<cffunction name="setCommentCount" access="public" returntype="void" output="false" displayname="Set Instance Memento" hint="I set the comment Count">
		<cfargument name="commentCount" type="string" required="true" />
		<cfset variables.instance.commentCount = arguments.commentCount />
	</cffunction>
	
	<cffunction name="getErrors" access="public" returntype="struct" output="false">
		<cfreturn variables.myErrors />
	</cffunction>
	<cffunction name="setErrors" access="package" returntype="void" output="false">
		<cfargument name="myErrors" type="struct" required="true" />
		<cfset variables.myErrors = arguments.myErrors />
	</cffunction>
	
	<cffunction name="isSpam" access="private" returntype="boolean" output="false" displayname="Is Spam" hint="I check the comment for spam">
		<cfset var spamWords = "" />
		<cfset var i = 0 />
		
		<cffile action="read" file="#request.appPath#config/blacklist.txt" variable="spamWords" />
		
		<!--- TODO: It should also learn new words! --->
		<cfloop list="#spamWords#" delimiters=" " index="i">
			<cfif getComment() Contains(i)>
				<cfreturn true />
			</cfif>
		</cfloop>
		<cfreturn false />
	</cffunction>
		
	<!--- VALIDATE --->
	<cffunction name="validate" access="public" output="false" returntype="boolean" hint="I validate this bean">
		<cfset var formErrors = structNew() />
		<cfset var isValid = true />
		
		<cfif getComment() eq "">
			<cfset formErrors.comment = "You need to add some content to the comment field" />
		<cfelse>
			<cfif isSpam()>
				<cfset formErrors.isSpam = "Your comment contains words or URLs that were previoulsy associated with Spam entries. Therefore you can't submit a comment." />
			</cfif>
		</cfif>

		<cfif structCount(formErrors) >
			<cfset setErrors(formErrors) />
			<cfset isValid = false />
		</cfif>
		 
		<cfreturn isValid />
	</cffunction>
</cfcomponent>
