<cfscript>
    attributes.totalRecord = event.getArg('resultsTotal').recordCount;
    attributes.searchString = event.getArg("r_search");
	attributes.nOI = 10;
	attributes.next = StructNew();
	attributes.next["output"] = "";
	attributes.previous = StructNew();
	attributes.previous["output"] = "";
	
	// figure out the next set 
	if (event.isArgDefined("start_pos")) 
	{
		attributes.next["start_pos"] = event.getArg("start_pos");
		attributes.next["start_pos"] = attributes.next["start_pos"]+attributes.nOI;
	} else {
		attributes.next["start_pos"] = attributes.nOI+1;
	}
	
	if (event.isArgDefined("end_pos")) 
	{
		attributes.next["end_pos"] = event.getArg("end_pos");
		attributes.next["end_pos"] = attributes.next["end_pos"]+attributes.nOI;
		
		// if the current end is greater than the total record adjust the next end
		if (event.getArg("end_pos") gt attributes.totalRecord) 
		{
			attributes.next["end_pos"] = attributes.next["end_pos"]-(attributes.nOI-attributes.totalRecord);
		}
		
	} else {
		attributes.next["end_pos"] = attributes.next["start_pos"] + attributes.nOI-1;
	}
	
	// set the display
	if (attributes.next["start_pos"] lte attributes.totalRecord) 
	{
		attributes.next["output"] = "<a href=""?event=search.doSearch&r_search="&attributes.searchString&"&amp;start_pos="&attributes.next["start_pos"]&"&amp;end_pos="&attributes.next["end_pos"]&"&amp;results="&attributes.totalRecord&""" title=""Get the next set of results: "&attributes.next["start_pos"]&" - "&attributes.next["end_pos"]&""">next  &##187;&##187;</a>";
	}
	
	// previous section
	if (attributes.next["start_pos"]-attributes.nOI gt attributes.nOI) 
	{
		// take the number of Items of the current next start
		attributes.previous["start_pos"] =  event.getArg("start_pos") - attributes.nOI;
		// take the number of Items of the current next end
		attributes.previous["end_pos"] =  event.getArg("end_pos") - attributes.nOI;
		// set the display
		attributes.previous["output"] = "<a href=""?event=search.doSearch&r_search="&attributes.searchString&"&amp;start_pos="&attributes.previous["start_pos"]&"&amp;end_pos="&attributes.previous["end_pos"]&"&amp;results="&attributes.totalRecord&""" title=""Get the next set of results: "&attributes.previous["start_pos"]&" - "&attributes.previous["end_pos"]&""">&##171;&##171; previous</a>";
	}
</cfscript>			
<div id="header" class="sechd">Your search for "<strong><cfoutput>#attributes.searchString#</cfoutput></strong>" returned <cfoutput>#attributes.totalRecord#</cfoutput> results.</div>
<div align="center">
  <p><cfoutput>#attributes.previous["output"]#</cfoutput>  <cfoutput>#attributes.next["output"]#</cfoutput></p>
</div>
<div>
<cfscript>
	attributes.recordCount = event.getArg('results').recordcount;
	
	if (attributes.recordCount neq 0) 
	{ // check that a result was returned
	// loop over the query
	    
	    for (i=1; i lte attributes.recordCount; i=i+1) 
	    {
		    attributes.contentTitle = Replace(Replace(Replace(lCase(event.getArg('results')['content_title'][i]), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			attributes.content = Replace(Replace(Replace(event.getArg('results')['content'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			attributes.contentTeaser = Mid(Replace(Replace(Replace(event.getArg('results')['content_teaser'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL"), 1, 250);
			
			if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
			{
				attributes.catName = Replace(lCase(event.getArg('results')['name'][i]), " ", "_", "ALL");
				attributes.contentTitleLink = "/" & attributes.catName & "/" & Replace(attributes.contentTitle, " ", "_", "ALL") & ".cfm";
			} else {
				attributes.contentTitleLink = "index.cfm?event=main.showArticle&articleTitle=" & Replace(attributes.contentTitle, " ", "_", "ALL");
			}
			
			// set a var to indicate they are different (0 if identical)
			attributes.contentLonger = (len(attributes.content)) - (len(attributes.contentTeaser));
			
			WriteOutput("<h4>&##187;&##187; <a href=""" & attributes.contentTitleLink & """ title="""&attributes.contentTitle&""">"&attributes.contentTitle&"</a></h4>"&attributes.contentTeaser);
	    }
	 	  
	} else {
	    WriteOutput("Sorry no results were found");
	}
</cfscript>
  
</div>
<cfset event.getArg('pageProperties').pageTitle = "" />
<cfset event.getArg('pageProperties').pageTitle = " gregs &##187;&##187; search results" />  