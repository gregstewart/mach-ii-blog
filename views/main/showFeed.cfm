<cfcontent reset="true" type="text/xml" />
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
  xmlns:admin="http://webns.net/mvcb/"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns="http://purl.org/rss/1.0/">
 <channel rdf:about="http://gregs.teacupinastorm.com/">
  <title><cfoutput>#event.getArg('pageProperties').pageTitle#</cfoutput> &#187;&#187; RDF</title>
  <link><cfoutput>#cgi.HTTP_HOST##event.getArg('pageProperties').applicationRoot#</cfoutput></link>
  <description>Helping me remember what I figure out.</description>
   <dc:language>en-us</dc:language>
   <dc:creator>greg stewart</dc:creator>
   <cfoutput><dc:date>#dateformat(now(), "yyyy-mm-dd")#T#timeFormat(now(), "HH:mm:ss")#+10:00</dc:date></cfoutput>
   <admin:generatorAgent rdf:resource="<cfoutput>#cgi.HTTP_HOST##event.getArg('pageProperties').applicationRoot#</cfoutput>" />
   <admin:errorReportsTo rdf:resource="mailto:gregs@tcias.co.uk"/>
   <sy:updateBase>2000-01-01T12:00+00:00</sy:updateBase>
   <items>
   <rdf:Seq>
<cfscript> 
    attributes.contentTitle = "";
	attributes.content = "";
	attributes.displayDate = "";
	attributes.topList = "";
	attributes.item = "";
	
	attributes.totalRecord = event.getArg('results').recordcount;
   	
   	if (attributes.totalRecord neq 0) 
   	{ // check that a result was returned
	
	    // loop over the query
	    for (i=1; i lte attributes.totalRecord; i=i+1) 
	    {
		    // output the value for column: columnName
		      
			// format the content
			attributes.contentTitle = lCase(event.getArg('results')['content_title'][i]);
			// attributes.content = Replace(Replace(Replace(request.pageContent.results['content'][i], "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			// ok now get me the first paragraph
			attributes.contentTeaser = Replace(Replace(Replace(reReplaceNoCase(event.getArg('results')['content_teaser'][i],"(<p>(.*)</p>)","\0", "ONE"), "\'", "'", "ALL"), "\\", "\", "ALL"), "\""", """", "ALL");
			startPos = REFind("<p>", attributes.contentTeaser);
			endPos = REFind("</p>", attributes.contentTeaser)+4;
			attributes.contentTeaser = toString(Mid(attributes.contentTeaser, startPos, endPos-startPos));
			attributes.contentTitleLink = Replace(attributes.contentTitle, " ", "_", "ALL");
			attributes.catName = Replace(lCase(event.getArg('results')['name'][i]), " ", "_", "ALL");
			attributes.dcDate = DateFormat(event.getArg('results')['date_published'][i],"yyyy-mm-dd") & "T" & event.getArg('results')['dcTime'][i];
			// set a var to indicate they are different (0 if identical)
			attributes.contentLonger = (len(attributes.content)) - (len(attributes.contentTeaser));
			attributes.topList = attributes.topList & "<rdf:li rdf:resource=""" & cgi.HTTP_HOST & event.getArg('pageProperties').applicationRoot & attributes.contentTitleLink & ".cfm""/>";
			attributes.item = attributes.item & "<item rdf:about=""" & cgi.HTTP_HOST & event.getArg('pageProperties').applicationRoot & attributes.contentTitleLink & ".cfm""><title>" & attributes.contentTitle & "</title><link>" & cgi.HTTP_HOST & event.getArg('pageProperties').applicationRoot & attributes.contentTitleLink & ".cfm</link><description><![CDATA[" & attributes.contentTeaser & "]]></description><dc:date>" & attributes.dcDate & "</dc:date></item>";
		}
		
	    writeoutput(attributes.topList);
   	} else {
      writeoutput("<rdf:li rdf:resource=""" & cgi.HTTP_HOST & event.getArg('pageProperties').applicationRoot & """/><p>Sorry no result.</p>");
	}
	
</cfscript> 
	 </rdf:Seq>
	</items>
</channel>
<cfscript>
writeoutput(attributes.item);
</cfscript>
</rdf:RDF>