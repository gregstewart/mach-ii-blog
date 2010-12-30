<cfscript>
    // create the object with the function for formatting
    myUtils = getProperty('utils');
   
    attributes.contentObject = event.getArg('content');
   
	attributes.displayDate = attributes.contentObject.getPublicationDate();
	// format the content
	attributes.contentTitle = lCase(attributes.contentObject.getTitle());
	attributes.content = Replace(Replace(Replace(attributes.contentObject.getArticleContent(), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
	attributes.contentTeaser = Replace(Replace(Replace(attributes.contentObject.getTeaser(), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
	attributes.contentID = attributes.contentObject.getContentID();
	
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
    // finished formatting the code
    attributes.contentTitleLink = Replace(attributes.contentTitle, " ", "_", "ALL");
	attributes.catName = Replace(lCase("Some category"), " ", "_", "ALL");
	// set a var to indicate they are different (0 if identical)
	attributes.contentLonger = (len(attributes.content)) - (len(attributes.contentTeaser));

	// build up the to header
	writeoutput("<div id=""header1"" class=""sechd"">"&attributes.displayDate&"</div>
	<div id=""teaser1"" class=""teaser2"">");

	// main content

       writeoutput("
       <ul class=""horizontalList"">
        <li class=""horizontalList""> &##187;&##187; <a href=""/"&attributes.catName&"/"" title=""some category"">some category</a></li>
        <li class=""horizontalList""> &##187;&##187; <a href=""/"&attributes.catName&"/"&attributes.contentTitleLink&".cfm"" title="""&attributes.contentTitle&""">"&attributes.contentTitle&"</a></li>
       </ul>
       "&attributes.contentTeaser&"<p>");
       // is the teaser different to the main body
	if (attributes.contentLonger neq 0) {
 		//writeoutput("<a href=""?event=main.showArticle&amp;articleTitle="&attributes.contentTitleLink&""" title="""&attributes.contentTitle&""">There's more</a> | ");
 		writeoutput(" &##187;&##187; <a href=""/"&attributes.catName&"/"&attributes.contentTitleLink&".cfm"" title="""&attributes.contentTitle&""">There's more</a> | ");
 	}
	writeoutput(" &##187;&##187; <a href=""/?event=comment.postComment&contentID="&attributes.contentID&""" title=""View and post comments"" onclick=""window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;"">Comments</a>
	</p>
  </div>");
  
  // now do the same again just for content
  // try to find the <code> tag
	if (Refind("<code>", attributes.content)) {
		// found so let's create the nice list code view
		// get all occurences (the positions)
		st = myUtils.reFindAll("(<code>)([\s\S]*?)(</code>)",attributes.content);
        //REFind("(<code>)([\s\S]*?)(</code>)",attributes.content,1,"TRUE");
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
			item[k] = mid(attributes.content, (tmpy[k][1])+adjustLeft, tmpy[k][2]-adjustRight);
			// writeoutput("<p>"&item[k]&"</p><hr />");
			// format it
			formatted[k] = myUtils.codeTransformFromVar(item[k]);
			// writeoutput(formatted[k]&"<hr />");
		}

		for (l = 1; l lte ArrayLen(item); l = l+1) {
	   		// no replace the occurence
			//writeoutput(attributes.contentTeaser);
			attributes.content= Replace(attributes.content,item[l], formatted[l]);
		}

	}
    // finished formatting the code
    attributes.contentTitleLink = Replace(attributes.contentTitle, " ", "_", "ALL");
	attributes.catName = Replace(lCase("Some category"), " ", "_", "ALL");

	// build up the to header
	writeoutput("<div id=""header1"" class=""sechd"">"&attributes.displayDate&"</div>
	<div id=""teaser1"" class=""teaser2"">");

	// main content

       writeoutput("
       <ul class=""horizontalList"">
        <li class=""horizontalList""> &##187;&##187; <a href=""/"&attributes.catName&"/"" title=""some category"">some category</a></li>
        <li class=""horizontalList""> &##187;&##187; <a href=""/"&attributes.catName&"/"&attributes.contentTitleLink&".cfm"" title="""&attributes.contentTitle&""">"&attributes.contentTitle&"</a></li>
       </ul>
       "&attributes.content&"<p> &##187;&##187; <a href=""/?event=comment.postComment&contentID="&attributes.contentID&""" title=""View and post comments"" onclick=""window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;"">Comments</a>
	</p>
  </div>");
</cfscript>
<!--- <cfdump var="#event.getArg('content')#" /> --->