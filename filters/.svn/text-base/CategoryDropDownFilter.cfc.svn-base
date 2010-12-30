<!---
	
	<event-filters>
		...
		<event-filter name="categoryDropDownFilter" type="filters.CategoryDropDownFilter" />
		...
	</event-filters>

	Use me to cconvert a get all category query into an array for enhanced display purposes 
	(the related category name is also selected for clearer display). 
	
	For example: blog => becomes => about >> blog
	
	<event-handlers>
		...
		<event-handler event="foo">
			<filter name="categoryDropDownFilter">
				<parameter name="categoryQuery" value="bar" />
			</filter>
			...
		</event-handler>
		...
	</event-handlers>
	
	categoryQuery is required (the filter will fail without them).
	this parameter can be specified in the <parameters> block when the
	event-filter is defined - parameter values specified in the <filter> tag override
	the default values set in the <parameters> block.
	take the query and convert it into an array
	first concatenate the field name and the related name into a string
	then add the id of name to position 1
	and the concatenated string to position 2
	return true.
--->
<cfcomponent extends="MachII.framework.EventFilter" display="Category Drop Down filter"
	hint="I am an event filter that manages the display of the category drop down." output="true">
	
	<cffunction name="filterEvent" access="public" returntype="boolean"
		displayname="filterEvent method" hint="I am invoked by the Mach II framework." output="true">
		<cfargument name="event" type="MachII.framework.Event" required="true"
			displayname="event object" hint="I am the current event object created by the Mach II framework." />
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true"
			displayname="eventContext object" hint="I am the current event context object created by the Mach II framework." />
		<cfargument name="paramArgs" type="struct" required="false" default="#structNew()#"
			displayname="paramArgs structure" hint="I am the structure containing the parameters specified in the filter invocation in mach-ii.xml." />
        
		<cfscript>
			var pm = getAppManager().getPropertyManager();	
			var categoryQuery = "";
			var i = 0;
			var categoryArray = ArrayNew(2);
			
			if (arguments.event.isArgDefined("categoryQuery")) {
			    categoryQuery = arguments.event.getArg("categoryQuery"); 
			} else {
			    // TODO: if there is no value we will want this to fail and announce an event
			}
			
		</cfscript>
    	
    	<cfif categoryQuery.recordcount gt 0>
			
		    <cfloop query="categoryQuery">
		        
		        <cfset categoryArray[categoryQuery.currentRow][1] = categoryQuery.category_id />
		        <!--- TO DO: BUG IN BD6.2 doesn't recognise column aliases--->
		        <cfset categoryArray[categoryQuery.currentRow][2] = categoryQuery.related_name & " - " & categoryQuery.name />
		        <cfset categoryArray[categoryQuery.currentRow][3] = categoryQuery.related_name  /> 
		        <!--- <cfset categoryArray[categoryQuery.currentRow][2] = categoryQuery.name />
		        <cfset categoryArray[categoryQuery.currentRow][3] = categoryQuery.name  />--->
		    </cfloop>
		    
		    <cfset arguments.event.setArg("categoryArray", categoryArray, "array") />
		    
		    <cfreturn true />
		<cfelse>
		    <cfreturn false />
		</cfif>
		
	</cffunction>
	
</cfcomponent>
