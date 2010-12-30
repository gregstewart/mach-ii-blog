<cfset catName = Replace(lCase(request.pageContent.results.getCatName()), " ", "_", "ALL") />
<!-- Start breadcrumb -->
<div id="breadcrumb" class="sechd">
	<h3>Breacrumb</h3>
	<ul class="horizontalList">
	  <li class="horizontalList"> &#187;&#187; <a href="/" title="gregs">home</a></li>
	  <!---  <li class="horizontalList"> &#187;&#187; <a href="?event=main.showArticleIndex&amp;indexTitle=<cfoutput>#Replace(lCase(request.pageContent.results.getCatName()), " ", "_", "ALL")#</cfoutput>" title="<cfoutput>#request.pageContent.results.getCatName()#</cfoutput>"><cfoutput>#request.pageContent.results.getCatName()#</cfoutput></a></li>
	  <li class="horizontalList"> &#187;&#187; <a href="?event=main.showArticle&amp;articleTitle=<cfoutput>#lcase(Replace(request.pageContent.results.getTitle()," ","_","ALL"))#</cfoutput>" title="<cfoutput>#request.pageContent.results.getTitle()#</cfoutput>"><cfoutput>#request.pageContent.results.getTitle()#</cfoutput></a></li> --->
	  <li class="horizontalList"> &#187;&#187; <a href="/<cfoutput>#catName#</cfoutput>/" title="<cfoutput>#request.pageContent.results.getCatName()#</cfoutput>"><cfoutput>#request.pageContent.results.getCatName()#</cfoutput></a></li>
	  <li class="horizontalList"> &#187;&#187; <a href="/<cfoutput>#catName#</cfoutput>/<cfoutput>#lcase(Replace(request.pageContent.results.getTitle()," ","_","ALL"))#</cfoutput>.cfm" title="<cfoutput>#request.pageContent.results.getTitle()#</cfoutput>"><cfoutput>#request.pageContent.results.getTitle()#</cfoutput></a></li>	
	  </ul>
</div>
<!-- End breadcrumb -->	
<hr />
<cfoutput>#Replace(Replace(Replace(request.pageContent.results.getArticleContent(), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL")#</cfoutput>

<p>&#187;&#187; <a href="/?event=comment.postComment&contentID=<cfoutput>#request.pageContent.results.getContentID()#</cfoutput>" title="View and post comments" onclick="window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;">Comments</a></p>

<cfscript>
    attributes.totalRecord = request.pageContent.photos.recordcount;
   	if (attributes.totalRecord neq 0) { // check that a result was returned
	     // loop over the query
	    for (i=1; i lte attributes.totalRecord; i=i+1) {
	    	writeOutput("<span class=""photos""><img src="""&request.pageProperties.photoPath&REReplace(event.getArg("galleryName"), "( HTTP\/)+[0-9].[0-9]", "")&"/"&request.pageContent.photos['name'][i]&""" alt=""file name: "&request.pageContent.photos['name'][i]&" and file size: "&request.pageContent.photos['size'][i]&""" border=""0"" align=""left"" /></span>");
	    }
   	} else {
   	    writeOutput("<p>Sorry no images were found</p>");	
   	}
</cfscript>
<hr />


<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; " & request.pageContent.results.getCatName() & " &##187;&##187; " & request.pageContent.results.getTitle() />
