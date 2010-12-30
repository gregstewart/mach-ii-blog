<cfcomponent displayname="MySQL contentDAO" extends="uk.co.tcias.gregs.model.main.contentDAO" output="true">
 
	<cffunction name="create" returntype="void" output="false" hint="CRUD method" output="true">
		<cfargument name="content" type="uk.co.tcias.gregs.model.main.content" required="yes" displayname="read" hint="I am the content object from which data is read." />
		<cfset var uuid = CreateUUID() />
		<cfset var contentAdd = 0 />
		<cfset var meteDataAdd = 0 />
		<cfset var isPublished = 0 />
		
		<cftransaction>
			<cfif (arguments.content.getIsPublished() eq true)>
				<!--- because the database uses a bit to store boolean value convert it back to a numeric value --->
				<cfset isPublished = 1 />
			</cfif>
			
			<cfquery name="contentAdd" datasource="#variables.dsn#">
			    INSERT INTO content
			    (content_id, content_category_id, content_teaser, content_title, content, content_type, published, date_written, date_published, date_expires, date_modified, author, checked_out)
			    VALUES
			    (<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(uuid)#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getCategoryID())#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTeaser())#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTitle())#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getArticleContent())#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentType())#" />,
			    <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.content.getIsPublished()#" />, 
			    <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getDateAdded())#" />,
			    <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getPublicationDate())#" />,
			    <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getExpiryDate())#" />,
			    <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />,
			    <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getAuthor())#" />,
			    <cfqueryparam cfsqltype="cf_sql_bit" value="#val(0)#" />)
			</cfquery>
			<cfquery name="metaDataAdd" datasource="#variables.dsn#">
			    INSERT INTO meta_data
				(cat_id,meta_data)
				VALUES 
				(<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(uuid)#" />,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentMetaData())#" />)
			</cfquery>
		</cftransaction>
	</cffunction>
	
	<cffunction name="udpate" access="public" returntype="void" output="false" hint="CRUD method">
		<cfargument name="content" type="uk.co.tcias.gregs.model.main.content" required="yes" displayname="read" hint="I am the content object from which data is read." />
		<cfset var contentUpdate = 0 />
		<cfset var metaDataUpdate = 0 />
		<cfset var isPublished = 0 />
		<cftransaction>
			<cfif (arguments.content.getIsPublished() eq true)>
				<!--- because the database uses a bit to store boolean value convert it back to a numeric value --->
				<cfset isPublished = 1 />
			</cfif>
			
			<cfquery name="contentUpdate" datasource="#variables.dsn#">
				UPDATE content
				SET content_category_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getCatID())#" />, 
					content_teaser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTeaser())#" />, 
					content_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTitle())#" />, 
					content = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getArticleContent())#" />,
					content_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentType())#" />, <!--- hardwire this value --->
					published = <cfqueryparam cfsqltype="cf_sql_bit" value="#isPublished#" />, 
					date_written = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />, 
					date_published = <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getDatePublished())#" />, 
					date_expires = <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getDateExpired())#" />,
					date_modified = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />, 
					author = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getAuthor())#" />, 
					checked_out = <cfqueryparam cfsqltype="cf_sql_bit" value="#val(0)#" />, 
				WHERE content_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentID())#" />
			</cfquery>
			<cfquery name="metaDataUpdate" datasource="#variables.dsn#">
				UPDATE meta_data
				SET meta_data = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentMetaData())#" />
				WHERE cat_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentID())#" />
			</cfquery>
		</cftransaction>
	</cffunction>
	
</cfcomponent>
