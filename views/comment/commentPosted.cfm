<cfscript>
    writeOutput("<div class=""allGood""><p>Thank you for your comment.</p><p><a href=""?event=comment.postComment&amp;contentID="&event.getArg('comment').getContentId()&""" title=""Back to comment listing"">Click here to return to the list of comments</a></p></div>");
</cfscript>