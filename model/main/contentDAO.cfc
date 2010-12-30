
<cfcomponent displayname="Content DAO" hint="I abstract data access for content" output="true">

	<!--- uk.co.tcias.gregs.model.main. --->
	<cffunction name="init" access="public" returntype="contentDAO" output="false" >		
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="create" access="public" returntype="void" output="true" hint="CRUD method">
		<cfabort showerror="contentDAO.create - This Method is Abstract and needs to be overridden">
	</cffunction>
	
	<cffunction name="update" access="public" returntype="void" output="true" hint="CRUD method">
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
				SET content_category_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getCategoryID())#" />, 
					content_teaser = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTeaser())#" />, 
					content_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getTitle())#" />, 
					content = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getArticleContent())#" />,
					content_type = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentType())#" />, <!--- hardwire this value --->
					published = <cfqueryparam cfsqltype="cf_sql_bit" value="#arguments.content.getIsPublished()#" />, 
					date_written = <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getDateAdded())#" />, 
					date_published = <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getPublicationDate())#" />, 
					date_expires = <cfqueryparam cfsqltype="cf_sql_date" value="#trim(arguments.content.getExpiryDate())#" />,
					date_modified = <cfqueryparam cfsqltype="cf_sql_date" value="#now()#" />, 
					author = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getAuthor())#" />, 
					checked_out = <cfqueryparam cfsqltype="cf_sql_bit" value="#val(0)#" /> 
				WHERE content_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentID())#" />
			</cfquery>
			<cfquery name="metaDataUpdate" datasource="#variables.dsn#">
				UPDATE meta_data
				SET meta_data = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentMetaData())#" />
				WHERE cat_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.content.getContentID())#" />
			</cfquery>
		</cftransaction>
	</cffunction>
	
	<cffunction name="delete" returntype="void" output="true" hint="CRUD method">
		<cfargument name="contentID" type="string" required="yes" displayname="content id" hint="I am the content id." />
		<cfset var contentDelete = 0 />
		<cfset var metaDataDelete = 0 />
		<cfset var contentID = arguments.contentID />
		
		<cftransaction>
			<cfquery name="contentUpdate" datasource="#variables.dsn#">
				DELETE FROM content
				WHERE content_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(contentID)#" />
			</cfquery>
			<cfquery name="metaDataUpdate" datasource="#variables.dsn#">
				DELETE FROM meta_data
				WHERE cat_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(contentID)#" />
			</cfquery>
		</cftransaction>
	</cffunction>
	
	<cffunction name="readByID" access="public" returntype="void" output="true" hint="CRUD method">
		<cfargument name="content" type="uk.co.tcias.gregs.model.main.content" required="yes" displayname="read" hint="I am the content object into which data is read." />
		<cfargument name="contentID" type="string" required="true" hint="I am the ID of the database record to read." />		
		
		<cfset var contentSelect = 0 />	
		<cfset var metaDataSelect = 0 />
		
		<!--- some content does not have meta data the query fails
            SELECT 	co.content_id, co.content_category_id, co.content_teaser, co.content_title, co.content, 
					co.content_type, co.published, co.date_written, co.date_published, co.date_expires, 
					co.date_modified, co.author, co.checked_out, co.content_type, co.priority, ca.name, md.meta_data
			FROM	content co, categorisation ca, meta_data md
			WHERE	co.content_category_id = ca.category_id
			AND 	co.content_id = md.cat_id
			AND 	content_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contentid)#" />
        
         --->
		
		<cfquery name="contentSelect" datasource="#variables.dsn#">
			SELECT 	co.content_id, co.content_category_id, co.content_teaser, co.content_title, co.content, 
					co.content_type, co.published, co.date_written, co.date_published, co.date_expires, 
					co.date_modified, co.author, co.checked_out, co.content_type, co.priority, ca.name
			FROM	content co, categorisation ca
			WHERE	co.content_category_id = ca.category_id
			AND 	content_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contentid)#" />
		</cfquery>	
		
		<cfquery name="metaDataSelect" datasource="#variables.dsn#">
		    SELECT md.meta_data
		    FROM meta_data md
		    WHERE md.cat_id = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(arguments.contentid)#" />
		</cfquery>
		
		<cfif contentSelect.recordCount gt 0>
			<cfif (isNumeric(contentSelect.published))>
					<!--- because the application expects a bollean value convert the value stored in the db to true or false --->
					<cfif (contentSelect.published eq 1)>
						contentSelect.published = true;
					<cfelse>
						contentSelect.published = false;
					</cfif>
			</cfif>
			<cfscript>			
				arguments.content.setContentID(contentSelect.content_id);
				arguments.content.setTitle(contentSelect.content_title);
				arguments.content.setArticleContent(contentSelect.content);
				arguments.content.setCatName(contentSelect.name);
				arguments.content.setTeaser(contentSelect.content_teaser);
				arguments.content.setPublicationDate(contentSelect.date_published);
				arguments.content.setExpiryDate(contentSelect.date_expires);
				arguments.content.setDateAdded(contentSelect.date_written);
				if (metaDataSelect.recordCount) {
				    arguments.content.setContentMetaData(metaDataSelect.meta_data);
				}
				arguments.content.setIsPublished(contentSelect.published);
				arguments.content.setCategoryID(contentSelect.content_category_id);
				arguments.content.setAuthor(contentSelect.author);
				arguments.content.setContentType(contentSelect.content_type);
			</cfscript>
		<cfelse>
			<cfthrow message="contentID #arguments.contentID# not found" type="content" detail="" errorcode="content.contentNotFound" extendedinfo="" />
		</cfif>	
						
	</cffunction>
	
	<cffunction name="readByTitle" access="public" returntype="void" output="false" hint="CRUD method">
		<cfargument name="content" type="uk.co.tcias.gregs.model.main.content" required="yes" displayname="read" hint="I am the content object into which data is read." />
		<cfargument name="contentTitle" type="String" required="true" hint="I am the Title of the database record to read." />		
		<cfset var contentSelect = 0 />
		<cfset var memento = structNew() />
		<cfquery name="contentSelect" datasource="#variables.dsn#">
		  SELECT co.content_id, co.content_title, co.content_teaser, co.content_category_id, ca.name, ca.level, 
			      ca.related_to, DATE_FORMAT(co.date_published,'%d %M %Y') as formattedDate, co.content 
			FROM content co, categorisation ca 
			WHERE co.content_type = 'bb4f74b892a4854e3f0bcf262acf1e09' 
			AND co.content_category_id = ca.category_id 
			AND co.published = 1 
			AND co.date_published <= CURDATE() 
			AND	co.content_title = <cfqueryparam cfsqltype="cf_sql_varchar" value="#trim(Replace(arguments.contentTitle, "_", " ", "ALL"))#" />
		</cfquery>		
		<cfif contentSelect.recordCount eq 1>
			<cfdump var="#contentSelect#" />
			<cfscript>			
				arguments.content.setContentID(contentSelect.content_ID);
				arguments.content.setTitle(contentSelect.content_title);
				arguments.content.setArticleContent(contentSelect.content);
				arguments.content.setCatName(contentSelect.name);
				// arguments.content.setSortOrder(contentSelect.sortOrder);
			</cfscript>
		<cfelse>
			<cfthrow message="contentTitle #arguments.contentTitle# not found" type="content" detail="" errorcode="content.contentNotFound" extendedinfo="" >
		</cfif>	
						
	</cffunction>
	
</cfcomponent>
