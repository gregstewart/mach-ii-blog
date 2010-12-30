<!---<cfdump var="#event.getArg('comments').getCommentObject()#"><cfabort> --->
<cfscript>
	// default values
	attributes.r_name = event.getArg("name");
	attributes.r_email = event.getArg("email");
	attributes.o_website = event.getArg("website");
	attributes.r_comment = event.getArg("comment");
	attributes.error = event.getArg("error");
	attributes.errMsg = event.getArg("errMsg");
	attributes.contentID = event.getArg("contentID");

	// regular display comments and form
	if (attributes.error neq "") {
		if (attributes.error eq 1) {
			attributes.errMsg = "<p>You must complete all the required fields</p>";
			attributes.class = "alert";
		} else if (attributes.error eq 2) {
			attributes.errMsg = "<p>Please provide a valid e-mail address. Don't worry I'll keep it safe.</p>";
			attributes.class = "alert";
		} else if (attributes.error eq 0) {
			attributes.errMsg = "<p>Your comment was submitted.</p>";
			attributes.class = "success";
		}
		writeOutput('<div class="' & attributes.class & '">' & attributes.errMsg & '</div>');
	}

    if (event.getArg('comments').getCommentCount() eq 0) {
        writeOutput('<div id="comments" class="alert"><p>No comments posted... Yet!!</p></div>');
    } else {
        // define the xslt
		commentsXsl = "<xsl:stylesheet xmlns:xsl=""http://www.w3.org/1999/XSL/Transform""
 version=""1.0"">
	<xsl:output method=""html"" />
  <xsl:template match=""/comments"">
		<div class=""comments"">
		<h3>Comments</h3>
		<xsl:for-each select=""comment"">
			<div>
				<h4><xsl:value-of select=""id"" /></h4>
				<p><strong>Name: </strong> <xsl:value-of select=""name"" /></p>
				<p><strong>Date posted: </strong> <xsl:value-of select=""formatteddate"" /></p>
				<p><strong>Website: </strong> <xsl:value-of select=""link"" /></p>
				<div class=""displayComment""><strong>Comment: </strong><br /><xsl:value-of select=""yourcomment"" /></div>
			</div>
		</xsl:for-each>
		</div>
  </xsl:template>
</xsl:stylesheet>";

        // read in the comments
        //writeOutput(isXmlDoc(request.pageContent.comments.getCommentObject()));
		myXMLDocument = XmlTransform(event.getArg('comments').getCommentObject(),commentsXsl);
		writeOutput(myXMLDocument);
	}

    writeOutput("<a name=""commentSubmission""></a>");
    // now the form
	myForm = getProperty('formUdf');
	myForm.init("frmComment","index.cfm?event=comment.doPostComment","post","application/x-www-form-urlencoded","onsubmit=""return verify(this);""");
	myForm.openFieldSet(elementPos=1,elementTitle="your details",elementLegend="your details");
	myForm.setTextInput(elementPos=2,elementName="name",elementID="r_name",elementSize=20,elementLabel="Your name",elementTabIndex=1, elementType="text", elementValue=attributes.r_name);
	myForm.setTextInput(elementPos=3,elementName="email",elementID="r_email",elementSize=35,elementLabel="Your e-mail",elementTabIndex=2, elementType="text", elementValue=attributes.r_email);
	myForm.setTextInput(elementPos=4,elementName="website",elementID="o_website",elementSize=35,elementLabel="Your website",elementTabIndex=2, elementType="text", elementValue=attributes.o_website);
	myForm.closeFieldSet(elementPos=5);
	myForm.openFieldSet(elementPos=6,elementTitle="your comment",elementLegend="your comment");
	myForm.setTextArea(elementPos=7,elementName="comment",elementID="r_comment",elementLabel="Your comment",elementTabIndex=3,elementEvent="",elementRows="5",elementCols="25", elementValue=attributes.r_comment);
	myForm.closeFieldSet(elementPos=8);
	myForm.setSubmitButton(elementPos=9,elementName="btn_submit",elementID="btn_submit",elementValue="Submit",elementTabIndex=4, elementType="submit");
	myForm.setHiddenInput(elementPos=10,elementName="contentId",elementID="contentId",elementValue=attributes.contentID);
	writeOutput(myForm.getCompletedForm());
</cfscript>





