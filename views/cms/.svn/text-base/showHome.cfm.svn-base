<cfscript>
   	// create the object with the function for formatting
    myUtils = getProperty('utils');
	
	// get the user session object and store it here
	attributes.sessionUser = event.getArg("sessionUser");
	
   	attributes.contentTitle = "";
	attributes.displayDate = "";
	
	attributes.totalRecord = event.getArg('results').recordcount;
   	if (attributes.totalRecord neq 0) { // check that a result was returned
     // loop over the query
     for (i=1; i lte attributes.totalRecord; i=i+1) {
	    // output the value for column: columnName

		// format the content
		attributes.contentTitle = lCase(event.getArg('results')['content_title'][i]);
		attributes.content = Replace(Replace(Replace(event.getArg('results')['content'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
		attributes.contentTeaser = Replace(Replace(Replace(event.getArg('results')['content_teaser'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
		// try to find the <code> tag
		if (Refind("<code>", attributes.contentTeaser)) {
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

            for (j in st) {
				//writeoutput(len&"<br />");
				for (h=1; h lte len; h=h+1) {
				    if (j eq "pos") {
				        tmpy[h][1] = st.pos[h];
				        //writeoutput(st.pos[h]&"<br />");
				    } else {
				        tmpy[h][2] = st.len[h];
				        //writeoutput(st.len[h]&"<br />");
				    }
				}
			}

			for (k = 1; k lte ArrayLen(tmpy); k = k+1) {
				// get the item to format
				item[k] = mid(attributes.contentTeaser, (tmpy[k][1])+adjustLeft, tmpy[k][2]-adjustRight);
				// writeoutput("<p>"&item[k]&"</p><hr />");
				// format it
				formatted[k] = myUtils.codeTransformFromVar(item[k]);
				// writeoutput(formatted[k]&"<hr />");
			}

			for (l = 1; l lte ArrayLen(item); l = l+1) {
		   		// no replace the occurence
				//writeoutput(attributes.contentTeaser);
				attributes.contentTeaser= Replace(attributes.contentTeaser,item[l], formatted[l]);

			}

        }
        
        attributes.catName = Replace(lCase(event.getArg('results')['name'][i]), " ", "_", "ALL");
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
		if (attributes.displayDate neq event.getArg('results')['date_published'][i]) 
		{
			// dates are different
			attributes.displayDate = event.getArg('results')['date_published'][i];
			writeoutput("<div id=""header1"" class=""sechd"">" & DateFormat(attributes.displayDate,"dd mmmm yyyy") & "</div>
			<div id=""teaser1"" class=""teaser2"">");
		} else if (i neq 1) {
			// dates are the same display a simple separator
			writeoutput("<div id=""teaser3"" class=""teaser"">");
		}

		// main content

        writeoutput("
        <ul class=""horizontalList"">
	        <li class=""horizontalList""> &##187;&##187; <a href=""" & attributes.catNameLink & """ title=""" & event.getArg('results')['name'][i] & """>" & event.getArg('results')['name'][i] & "</a></li>
	        <li class=""horizontalList""> &##187;&##187; <a href=""" & attributes.contentTitleLink & """ title=""" & attributes.contentTitle & """>" & attributes.contentTitle & "</a></li>
        </ul>
        "&attributes.contentTeaser&"<p>");
        // is the teaser different to the main body
		if (attributes.contentLonger neq 0) {
	 		
	 		//writeoutput("<a href=""?event=main.showArticle&amp;articleTitle="&attributes.contentTitleLink&""" title="""&attributes.contentTitle&""">There's more</a> | ");
	 		writeoutput(" &##187;&##187; <a href=""/"&attributes.catName&"/"&attributes.contentTitleLink&".cfm"" title="""&attributes.contentTitle&""">There's more</a> | ");
	 	}
		writeoutput(" &##187;&##187; <a href=""?event=comment.postComment&contentID="&event.getArg('results')['content_id'][i]&""" title=""View and post comments"" onclick=""window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;"">Comments</a>");
		if (attributes.sessionUser.getIsLoggedIn() eq true) {
			writeOutput(" | &##187;&##187; <a href=""?event=cms.content.edit&amp;contentID="&event.getArg('results')['content_id'][i]&""" title=""Click here to edit this entry"">Edit</a>");
			writeOutput(" | &##187;&##187; <a href=""?event=cms.content.delete&amp;contentID="&event.getArg('results')['content_id'][i]&""" title=""Click here to delete this entry"">Delete</a>");
		}
		writeOutput("</p>
	  </div>");
    }
   } else {
      writeoutput("<p>Sorry no result.</p>");
   }
   request.pageProperties.pageTitle = "";
   request.pageProperties.pageTitle = "gregs &##187;&##187; cms home ";
</cfscript>
