<cfscript>
	// get the user session object and store it here
	attributes.sessionUser = event.getArg("sessionUser");
	catName = Replace(lCase(event.getArg('results').getCatName()), " ", "_", "ALL");
</cfscript>
<!-- Start breadcrumb -->
<div id="breadcrumb" class="sechd">
	<h3>Breacrumb</h3>
	<ul class="horizontalList">
		<li class="horizontalList"> &#187;&#187; <a href="/" title="gregs">home</a></li>
	<cfif NOT REFind("127.0.0.1", cgi.HTTP_HOST)>
		<li class="horizontalList"> &#187;&#187; <a href="/<cfoutput>#catName#</cfoutput>/" title="<cfoutput>#event.getArg('results').getCatName()#</cfoutput>"><cfoutput>#event.getArg('results').getCatName()#</cfoutput></a></li>
		<li class="horizontalList"> &#187;&#187; <a href="/<cfoutput>#catName#</cfoutput>/<cfoutput>#lcase(Replace(event.getArg('results').getTitle()," ","_","ALL"))#</cfoutput>.cfm" title="<cfoutput>#event.getArg('results').getTitle()#</cfoutput>"><cfoutput>#event.getArg('results').getTitle()#</cfoutput></a></li>	
	<cfelse>
		<li class="horizontalList"> &#187;&#187; <a href="?event=main.showArticleIndex&amp;indexTitle=<cfoutput>#Replace(lCase(event.getArg('results').getCatName()), " ", "_", "ALL")#</cfoutput>" title="<cfoutput>#event.getArg('results').getCatName()#</cfoutput>"><cfoutput>#event.getArg('results').getCatName()#</cfoutput></a></li>
		<li class="horizontalList"> &#187;&#187; <a href="?event=main.showArticle&amp;articleTitle=<cfoutput>#lcase(Replace(event.getArg('results').getTitle()," ","_","ALL"))#</cfoutput>" title="<cfoutput>#event.getArg('results').getTitle()#</cfoutput>"><cfoutput>#event.getArg('results').getTitle()#</cfoutput></a></li>
	</cfif>
	</ul>
</div>
<!-- End breadcrumb -->	
<hr />
<cfscript>
attributes.contentTeaser = Replace(Replace(Replace(event.getArg('results').getArticleContent(), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
if (Refind("<code>", attributes.contentTeaser)) {
	// create the object with the function for formatting
    myUtils = getProperty('utils');
	// found so let's create the nice list code view
	// get all occurences (the positions)
	st = myUtils.reFindAll("(<code>)([\s\S]*?)(</code>)",attributes.contentTeaser);
    // how many?
	len = arrayLen(st.pos);
	tmpy = arrayNew(2);
	item = arrayNew(1);
	formatted = arrayNew(1);
	// tag length to not include in display
	adjustRight = len("<code>")-1;
	adjustLeft = len("</code>")-1;
	// loop over the result
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
		//writeoutput(formatted[k]&"<hr />");
	}
	
	for (l = 1; l lte ArrayLen(item); l = l+1) {
	  		// no replace the occurence
		attributes.contentTeaser= Replace(attributes.contentTeaser,item[l], formatted[l]);
	}
}
</cfscript>
<cfoutput>#attributes.contentTeaser#</cfoutput>
<p>&#187;&#187; <a href="?event=comment.postComment&contentID=<cfoutput>#event.getArg('results').getContentID()#</cfoutput>" title="View and post comments" onclick="window.open(this.href, 'popupwindow', 'width=400,height=300,scrollbars,resizable'); return false;">Comments</a>

<cfscript>
if (attributes.sessionUser.getIsLoggedIn() eq true) {
	writeOutput(" | &##187;&##187; <a href=""?event=cms.content.edit&amp;contentID="&event.getArg('results').getContentID()&""" title=""Click here to edit this entry"">Edit</a>");
}
</cfscript>
</p>

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
<cfsilent>
	<cfset event.getArg('pageProperties').pageTitle = "" />
	<cfset event.getArg('pageProperties').pageTitle = " gregs &##187;&##187; " & event.getArg('results').getCatName() & " &##187;&##187; " & event.getArg('results').getTitle() />
</cfsilent>