<cfsilent>
<cfscript>
	if ( NOT REFind("127.0.0.1", cgi.HTTP_HOST) ) 
    {
    	attributes.root = "/";
    } else {
    	attributes.root = "";
    }
</cfscript>
</cfsilent>

<script language="javascript" type="text/javascript">
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
// - - - - - - ( event listener ) - - - - - - - -
// by Scott Andrew - http://scottandrew.com
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
function addEvent(obj, evType, fn) {
	if (obj.addEventListener) {
		obj.addEventListener(evType, fn, false); 
		return true;
	} else if (obj.attachEvent) {
		var r = obj.attachEvent('on'+evType, fn);
		return r;
	} else {
		return false;
	}
}
	
function showDiv(id) {
    document.getElementById(id).style.display = 'block';
}

function hideDiv (id) {
	document.getElementById(id).style.display = 'none';
}

// run all the onload scripts
function runScripts() {
	//alert("");
    hideDiv("cmsMenu");	
    showDiv("showCMSMenu");
    //showCMSMenu,cmsMenu
    
}	
window.onload = runScripts;
</script>

<style>
ul#navlist { font-family: sans-serif; }

ul#navlist a {
	font-weight: bold;
	text-decoration: none;
}

ul#navlist, ul#navlist ul, ul#navlist li {
	margin: 0px;
	padding: 0px;
	list-style-type: none;
}

ul#navlist li { float: left; }

ul#navlist li a {
	color: #000;
	background-color: #fff;
	padding: 3px;
	border: 1px #000 dotted;
}

ul#navlist li a:hover {
	color: #074348;
	background-color: #fff;
}

ul#navlist li a:active {
	color: #074348;
	background-color: #fff;
	border: 1px #000 dotted;
}

ul#subnavlist { display: none; }
ul#subnavlist2 { display: none; }
ul#subnavlist3 { display: none; }
ul#subnavlist li { float: none; }
ul#subnavlist2 li { float: none; }
ul#subnavlist3 li { float: none; }

ul#subnavlist li a {
	padding: 0px;
	margin: 0px;
}

ul#subnavlist2 li a {
	padding: 0px;
	margin: 0px;
}

ul#subnavlist3 li a {
	padding: 0px;
	margin: 0px;
}

ul#navlist li:hover ul#subnavlist {
	display: block;
	position: absolute;
	font-size: 8pt;
	padding-top: 5px;
}

ul#navlist li:hover ul#subnavlist2 {
	display: block;
	position: absolute;
	font-size: 8pt;
	padding-top: 5px;
}

ul#navlist li:hover ul#subnavlist3 {
	display: block;
	position: absolute;
	font-size: 8pt;
	padding-top: 5px;
}

ul#navlist li:hover ul#subnavlist li a {
	display: block;
	width: 10em;
	border: none;
	padding: 2px;
}

ul#navlist li:hover ul#subnavlist2 li a {
	display: block;
	width: 10em;
	border: none;
	padding: 2px;
}

ul#navlist li:hover ul#subnavlist3 li a {
	display: block;
	width: 10em;
	border: none;
	padding: 2px;
}

// ul#navlist li:hover ul#subnavlist li a:before { content: " &#187;&#187; "; }
</style>

<div id="cmsMenu" style="position: absolute; top: 0; width: 740px; text-align: left; background-color: #fff; border: 1px solid #666; display: block;">
	<!--- <div id="navcontainer"> --->
	<ul id="navlist">
	    <li><a href="#">Content</a>
	        <ul id="subnavlist">
	            <li id="subactive"><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.content.add" title="Add a new entry">Add</a></li>
	            <li><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.content.selectEdit" title="Edit an entry">Update</a></li>
	            <li><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.content.selectDelete" title="Delete an entry">Delete</a></li>
	        </ul>
	    </li>
	    <li><a href="#">Category</a>
	        <ul id="subnavlist2">
	            <li><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.category.add" title="Add a new category">Add</a></li>
	            <li><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.category.selectEdit" title="Edit a category">Update</a></li>
	            <li><a href="<cfoutput>#attributes.root#</cfoutput>?event=cms.category.selectDelete" title="Delete a category">Delete</a></li>
	        </ul></li>
	    <li><a href="#">Resource</a>
	        <ul id="subnavlist3">
	            <li><a href="" title="">Add</a></li>
	            <li><a href="" title="">Update</a></li>
	            <li><a href="" title="">Delete</a></li>
	        </ul></li>
	</ul>
	<!--- </div> --->
    <br clear="all" />
	<h3>CMS navigation</h3>
	<p>I am  going to be the drop down CMS menu</p>
	
	<p>Other ins and outs that I would like to see developed and displayed here:</p>
	<ul>
	    <li>Color code the entries displayed (using traffic light color coding) to show published, not published or being edited [read locked]</li>
	    <li>Options to change the views:<ol>
	        <li>Say for a different site</li>
	        <li>Only unpublished material (though that could be some kind of report)</li>
	    </ol>
	    </li>
	    <li>Also on login re-direct to the requested event</li>
	    <li>At the individual story level it would be nice to be able pull down a drop down with:<ol>
	        <li>Number of revisions</li>
	        <li>Author</li>
	        <li>Date information</li>
	    </ol>
	    </li>
	    <li>Bigger plans are:<ol>
	        <li>Integrate this with a campaign still manager for generating news letters and blasting them out</li>
	        <li>And merge the two into a CRM style application, initially just to track who has bough what or inquired about what. But later on the CRM system could tie in with the Campaign manager more closely.</li>
	    </ol></li>
	</ul>

	<div id="clickMe" style="float:right;">
	    <a href="#" title="Click to hide the CMS navigation" onclick="hideDiv('cmsMenu'); showDiv('showCMSMenu'); return false;">Hide me</a>
	</div>
</div>

<div id="showCMSMenu" style="position: absolute; top: 0; width: 740px; text-align: left; background-color: #fff; border: 1px solid #666; display: block;">
    <a href="#" title="Click to show the CMS navigation" onclick="hideDiv('showCMSMenu'); showDiv('cmsMenu'); return false;">Show me</a>
</div>
