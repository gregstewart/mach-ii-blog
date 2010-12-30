<!---<cfdump var="#event.getArg('results')#"><cfabort /> --->
<cfscript>
   	// create the object with the function for formatting
    myUtils = getProperty('utils');
	
	// get the user session object and store it here
	attributes.sessionUser = event.getArg("sessionUser");
	attributes.results = event.getArg('results');
   	attributes.contentTitle = "";
	attributes.displayDate = "";
	
	attributes.totalRecord = attributes.results.recordcount;
   	
   	if (attributes.totalRecord neq 0) 
   	{ // check that a result was returned
    	
    	// loop over the query
    	for (i=1; i lte attributes.totalRecord; i=i+1) 
    	{
		    // output the value for column: columnName
	
			// format the content
			attributes.contentTitle = lCase(attributes.results['content_title'][i]);
			attributes.content = Replace(Replace(Replace(attributes.results['content'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			attributes.contentTeaser = Replace(Replace(Replace(attributes.results['content_teaser'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			
			// try to find the <code> tag
			if (Refind("<code>", attributes.contentTeaser)) 
			{
				// found so let's create the nice list code view
				// get all occurences (the positions)
				st = myUtils.reFindAll("(<code>)([\s\S]*?)(</code>)",attributes.contentTeaser);
	            //REFind("(<code>)([\s\S]*?)(</code>)",attributes.contentTeaser,1,"TRUE");
				// how many?
				// loop over the result
	            len = arrayLen(st.pos);
	            tmpy = arrayNew(2);
	            item = arrayNew(1);
	            formatted = arrayNew(1);
	            // tag length to not include in display
	            adjustRight = len("<code>")-1;
	            adjustLeft = len("</code>")-1;
	
	            for (j in st) 
	            {
					//writeoutput(len&"<br />");
					for (h=1; h lte len; h=h+1) 
					{
					    
					    if (j eq "pos") 
					    {
					        tmpy[h][1] = st.pos[h];
					        //writeoutput(st.pos[h]&"<br />");
					    } else {
					        tmpy[h][2] = st.len[h];
					        //writeoutput(st.len[h]&"<br />");
					    }
					    
					}
				}
	
				for (k = 1; k lte ArrayLen(tmpy); k = k+1) 
				{
					// get the item to format
					item[k] = mid(attributes.contentTeaser, (tmpy[k][1])+adjustLeft, tmpy[k][2]-adjustRight);
					// writeoutput("<p>"&item[k]&"</p><hr />");
					// format it
					formatted[k] = myUtils.codeTransformFromVar(item[k]);
					// writeoutput(formatted[k]&"<hr />");
				}
	
				for (l = 1; l lte ArrayLen(item); l = l+1) 
				{
			   		// no replace the occurence
					//writeoutput(attributes.contentTeaser);
					attributes.contentTeaser= Replace(attributes.contentTeaser,item[l], formatted[l]);
	
				}
	
	        }
	
			attributes.catName = Replace(lCase(attributes.results['name'][i]), " ", "_", "ALL");
	        
	        if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
	        {
	        	attributes.contentTitleLink = "/" & attributes.catName & "/" & Replace(attributes.contentTitle, " ", "_", "ALL") & ".cfm";
	        	attributes.catNameLink = "/" & attributes.catName & "/";
	        } else {
	        	attributes.contentTitleLink = "index.cfm?event=main.showArticle&articleTitle=" & Replace(attributes.contentTitle, " ", "_", "ALL");
	        	attributes.catNameLink = "index.cfm?event=main.showArticleIndex&indexTitle=" & attributes.catName;
	        }
			
			// set a var to indicate they are different (0 if identical)
			attributes.contentLonger = (len(attributes.content)) - (len(attributes.contentTeaser));
	
			// build up the to header
			if (attributes.displayDate neq attributes.results['date_published'][i]) 
			{
				// dates are different
				attributes.displayDate = attributes.results['date_published'][i];
				writeoutput("<div id=""header1"" class=""sechd"">" & DateFormat(attributes.displayDate,"dd mmmm yyyy") & "</div>
				<div id=""teaser1"" class=""teaser2"">");
			} else if (i neq 1) {
				// dates are the same display a simple separator
				writeoutput("<div id=""teaser3"" class=""teaser"">");
			}
	
			// main content
	
	        writeoutput("
	        <ul class=""horizontalList"">
		        <li class=""horizontalList""> &##187;&##187; <a href=""" & attributes.catNameLink & """ title=""" & attributes.results['name'][i] & """>" & attributes.results['name'][i] & "</a></li>
		        <li class=""horizontalList""> &##187;&##187; <a href=""" & attributes.contentTitleLink & """ title=""" & attributes.contentTitle & """>" & attributes.contentTitle & "</a></li>
	        </ul>
	        " & attributes.contentTeaser & "<p>");
	        
	        // is the teaser different to the main body
			if (attributes.contentLonger neq 0) 
			{
		 		//writeoutput("<a href=""?event=main.showArticle&amp;articleTitle="&attributes.contentTitleLink&""" title="""&attributes.contentTitle&""">There's more</a> | ");
		 		writeoutput(" &##187;&##187; <a href=""" & attributes.contentTitleLink & """ title="""&attributes.contentTitle&""">There's more</a> | ");
		 	}
			
			writeoutput(" &##187;&##187; <a href=""index.cfm?event=comment.postComment&contentID="&attributes.results['content_id'][i]&""" title=""View and post comments"" onclick=""window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;"">Comments</a>");
			writeOutput("</p>
		  </div>");
		}
	
	} else {
		writeoutput("<p>Sorry no result.</p>");
	}
	
	event.getArg('pageProperties').pageTitle = "";
	event.getArg('pageProperties').pageTitle = "gregs &##187;&##187; home ";
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
