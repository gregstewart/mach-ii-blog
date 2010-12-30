<cfsilent>
	<cfif NOT REFind("127.0.0.1", cgi.HTTP_HOST)>
		<cfset attributes.searchLink = "/?event=search.doSearch" />
	<cfelse>
		<cfset attributes.searchLink = "index.cfm?event=search.doSearch" />
	</cfif>
</cfsilent>
<div id="headerTools" class="sechd">Tools</div>

		<p><strong>font size</strong><a href="javascript:void(0);" onclick="ndeSetTextSize('decr'); return false;" title="Shrink text" class="font_control">&#8211;</a><a href="javascript:void(0);" onclick="ndeSetTextSize('incr'); return false;" title="Enlarge text" class="font_control">+</a><a href="javascript:void(0);" onclick="ndeSetTextSize('reset'); return false;" title="Reset text" class="font_control">R</a></p>
		<div id="headerSearch" class="sechd">Search the site</div>
		<form method="post" id="frm_search" name="frm_search" action="<cfoutput>#attributes.searchLink#</cfoutput>" enctype="application/x-www-form-urlencoded">
			<fieldset>
			<legend>keyword search</legend>
			<div class="row">

			<span class="label"><label for="r_search"><input type="text" name="r_search" id="r_search" title="text input: keywords" value="" size="10" /></label></span>
			<span class="formw"><input type="submit" name="btn_submit" id="btn_submit" value="search" /></span>
			</div>
			</fieldset>
		</form>
<cfscript>
  attributes.totalRecord = event.getArg('favourites').recordcount;
  writeoutput("<div id=""headerFavs"" class=""sechd"">Favourites</div><ul>");
  
  if (attributes.totalRecord neq 0) 
  { // check that a result was returned
    
    // loop over the query
    for (i=1; i lte attributes.totalRecord; i=i+1) 
    {
      writeoutput("<li> &##187;&##187; <a href=""" & event.getArg('favourites')['value'][i] & """ title=""" & event.getArg('favourites')['description'][i] & """>" & event.getArg('favourites')['display_name'][i] & "</a></li>");
    }
    
    writeoutput("</ul><hr />");
  } else {
    writeoutput("<p>Sorry none found</p>");
  }
  
  attributes.totalRecord = event.getArg('friends').recordcount;
  writeoutput("<div id=""headerFavs"" class=""sechd"">Friends</div><ul>");
  
  if (attributes.totalRecord neq 0) 
  { // check that a result was returned
    
    // loop over the query
    for (i=1; i lte attributes.totalRecord; i=i+1) 
    {
      writeoutput("<li> &##187;&##187; <a href=""" & event.getArg('friends')['value'][i] & """ title=""" & event.getArg('friends')['description'][i] & """>" & event.getArg('friends')['display_name'][i] & "</a></li>");
    
    }
    writeoutput("</ul><hr />");
  } else {
    writeoutput("<p>Sorry none found</p>");
  }
</cfscript>		
	<div id="headerAmp" class="sechd">Powered by</div>
	<p class="ampLogo"><a href="http://www.teacupinastorm.co.uk/v2/products/amp.php" title="find out more about &amp;amp; (Author Manage Publish)"><img src="/views/i/amp_logo.gif" alt="&amp;amp; (Author Manage Publish) logo" width="100" height="58" border="0" /></a></p>
	<!--- TODO this really should be determined based on a plugin since it runs on each page --->
	<cfif (listFindNoCase("localhost,127.0.0.1,61.69.225.67",CGI.REMOTE_HOST ) GT 0)>
	<div id="headerLogin" class="sechd"><a name="login">Login</a></div>
<cfscript>
sessionUser = event.getArg("sessionUser");
if (sessionUser.getIsLoggedIn() eq false) {
	myForm = getProperty('formUdf');
	myForm.init("frm_login","?event=doLogin","post","application/x-www-form-urlencoded");
	myForm.openFieldSet(elementPos=1,elementTitle="User details",elementLegend="Your details");
	myForm.setTextInput(elementPos=2,elementName="username",elementID="r_username",elementSize=15,elementValue="",elementLabel="Username",elementTabIndex=1, elementType="text");
	myForm.setTextInput(elementPos=3,elementName="password",elementID="r_password",elementSize=15,elementValue="",elementLabel="Password",elementTabIndex=2, elementType="password");
	myForm.closeFieldSet(elementPos=4);
	// sample submit button
	myForm.setSubmitButton(elementPos=5,elementName="btn_submit",elementID="btn_submit",elementValue="Login",elementTabIndex=3, elementType="submit");
	writeOutput(myForm.getCompletedForm());
} else {
	WriteOutput("<p>You are logged in: " & sessionUser.getUsername() & "</p>");
	WriteOutput("<p><a href=""?event=doLogout"" title=""Click here to log out"">Logout</a></p>");
}
</cfscript>
	</cfif>
