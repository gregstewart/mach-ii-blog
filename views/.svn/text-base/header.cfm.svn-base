<cfscript>
    sessionUser = event.getArg("sessionUser");
    // increment the banner
    sessionUser.nextUserBannerID();
</cfscript>
<!-- gvs - banner -->
<div id="banner">
	<h3>Banner</h3>

	<h2 class="title">.:: <cfoutput>#event.getArg('pageProperties').pageTitle#</cfoutput> ::.</h2>
	<div class="bannerflash"><!--- <script src="views/_scripts/_slideshow.js" type="text/javascript" language="JavaScript1.2"></script> --->
	<img src="views/i/<cfoutput>#sessionUser.getUserBannerID()#</cfoutput>.jpg" alt="banner head" title="Mast head" />
	</div>
</div>
<!-- gvs - tag line -->
<div id="tagline"><h2>.::Helping me remember what I figure out::.</h2></div>
<!-- gvs - nav -->
<div id="nav" align="right">
	<h3>Navigation</h3>

	<ul class="navlist">
<cfscript>
	attributes.totalRecord = event.getArg('qry_categories').recordcount;
	
	if (attributes.totalRecord neq 0) 
	{ // check that a result was returned
   		// loop over the query
		for (i=1; i lte attributes.totalRecord; i=i+1) 
		{
		     // output the value for column: columnName
		     attributes.contentTitle = lCase(event.getArg('qry_categories')['name'][i]);
		     attributes.firstLetter = Left(attributes.contentTitle,1);
		     attributes.rdf = "";
		
			if (attributes.contentTitle eq "rdf") 
			{
				attributes.rdf = attributes.contentTitle;
			}
		
		    writeoutput("<li>");
			
			if (NOT event.isArgDefined("categoryObject") AND i neq 1) 
			{
			    // any sub category
			    if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
	        	{
			    	writeoutput("<a href=""/" & attributes.contentTitle & "/"" title=""" & attributes.contentTitle & " ["&attributes.firstLetter&"]"" accesskey="""&attributes.firstLetter&""">");
	        	} else {
					writeoutput("<a href=""?event=main.showArticleIndex&amp;indexTitle="&attributes.contentTitle&""" title="""&attributes.contentTitle&" ["&attributes.firstLetter&"]"" accesskey="""&attributes.firstLetter&""">");	        	
	        	}
	        	
			} else if (event.isArgDefined("categoryObject") AND event.getArg("categoryObject").getName() neq attributes.contentTitle) {
			    
			    if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
	        	{
			    	writeoutput("<a href=""/"&attributes.contentTitle&"/"" title="""&attributes.contentTitle&" ["&attributes.firstLetter&"]"" accesskey="""&attributes.firstLetter&""">");
	        	} else {
					writeoutput("<a href=""?event=main.showArticleIndex&amp;indexTitle="&attributes.contentTitle&""" title="""&attributes.contentTitle&" ["&attributes.firstLetter&"]"" accesskey="""&attributes.firstLetter&""">");	        	
	        	}
			}
			/* else if (StructKeyExists(request.pageContent, "results") AND attributes.contentTitle neq request.pageContent.results.getCatName()) {
			    writeoutput("<a href=""?event=main.showArticleIndex&amp;indexTitle="&attributes.contentTitle&""" title="""&attributes.contentTitle&" ["&attributes.firstLetter&"]"" accesskey="""&attributes.firstLetter&""">");
			}*/
			
			writeoutput(attributes.contentTitle);
			
			if (NOT event.isArgDefined("categoryObject") AND i neq 1) 
			{
			    writeoutput("</a>");
			} else if (event.isArgDefined("categoryObject") AND event.getArg("categoryObject").getName() neq attributes.contentTitle) {
			    writeoutput("</a>");
			}
			
			writeoutput("</li>");
		}
   } else {
      writeoutput("<p>Sorry no result.</p>");
   }
</cfscript>
	</ul>
</div>
<cfsavecontent variable="rssInfo">
<link rel="alternate" type="application/rss+xml" title="<cfoutput>#event.getArg('pageProperties').pageTitle#</cfoutput>" href="<cfoutput>#attributes.rdf#</cfoutput>/" />
</cfsavecontent>
<cfhtmlhead text="#rssInfo#">