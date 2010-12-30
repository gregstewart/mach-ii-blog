<cfscript>
	attributes.contentTitle = "";
	attributes.totalRecord = event.getArg('results').recordcount;
	attribute.categoryName = event.getArg('categoryObject').getName(); 
   	WriteOutput("<div id=""item0"" class=""sechd"">"&Replace(Replace(Replace(attribute.categoryName, "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL")&"</div>");
    if (attributes.totalRecord neq 0) { // check that a result was returned
    	// loop over the query
    	for (i=1; i lte attributes.totalRecord; i=i+1) {
            // the category name differs from that stored in the query show header 
			if (attribute.categoryName neq event.getArg('results')['name'][i]) {
                
                // close the previous list
	        	if (i neq 1) {
	        	    WriteOutput("</ul>");
	        	}
	        	
	        	// set the temp category holder and show header
	        	attribute.categoryName = event.getArg('results')['name'][i];
	        	WriteOutput("<div id=""item"&i&""" class=""sechd"">"&Replace(Replace(Replace(attribute.categoryName, "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL")&"</div>");
                
                // if this is a new category in the query open list    
			    if (i neq 1) {
	        	    WriteOutput("<ul class=""list"">");
			    } else if (event.getArg('categoryObject').getName() eq event.getArg('results')['name'][i]) {
	        	    // else if the category name and the query category name are the same open the list
	        	    WriteOutput("<ul class=""list"">");
			    }
    		}
    		
	    	// format the content
    		attributes.contentTitle = Replace(Replace(Replace(lCase(event.getArg('results')['content_title'][i]), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			attributes.contentTitleLink = REReplace(Replace(attributes.contentTitle, " ", "_", "ALL"), "( HTTP\/)+[0-9].[0-9]", "");
    		
    		if (event.getArg('categoryObject').getName() neq "photos") 
    		{ 
    		    if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
    		    {
    		        attributes.contentTitleLink = "/" & Replace(lCase(event.getArg('results')['name'][i]), " ", "_", "ALL") & "/" & attributes.contentTitleLink & ".cfm";
    			} else {
    				attributes.contentTitleLink = "index.cfm?event=main.showArticle&articleTitle=" & attributes.contentTitleLink;
    			}
				WriteOutput("<li> &##187;&##187; <a href=""" & attributes.contentTitleLink & """ title="""&attributes.contentTitle&""">"&attributes.contentTitle&"</a></li>");
    		} else {
    			WriteOutput("<li> &##187;&##187; <a href=""/?event=photos.showGallery&amp;galleryName="&attributes.contentTitleLink&"&amp;articleTitle="&attributes.contentTitleLink&""" title="""&attributes.contentTitle&""">"&attributes.contentTitle&"</a></li>");
    		}
    	}
   		WriteOutput("</ul>");
    } else {
		WriteOutput("<div id=""item12"" class=""sechd"">Oooops!</div><p>Sorry not content found.</p>");
   	}
    event.getArg('pageProperties').pageTitle = "";
    event.getArg('pageProperties').pageTitle = "gregs &##187;&##187; " & event.getArg('categoryObject').getName(); 	
</cfscript>
<div class="google"> 
<script type="text/javascript"><!--
google_ad_client = "pub-3215584413635284";
google_ad_width = 468;
google_ad_height = 60;
google_ad_format = "468x60_as";
google_ad_type = "text";
google_ad_channel ="";
//--></script>
<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</div>
