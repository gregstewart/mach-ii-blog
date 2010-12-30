<cfsavecontent variable="attributes.previewJS">
<script language="JavaScript" type="text/javascript">
	<!--
		function openWin(wName, wWidth, wHeight, wResize) {
			features = 'scrollbars=1,status=1,resizable=' + ((wResize) ? 1 : 0) + ((wWidth) ? ',width=' + wWidth : '') + ((wHeight) ? ',height=' + wHeight : '');
		  	popWin = window.open('', wName, features);
       		if(popWin.focus) { popWin.focus(); }
       		return true;
		}
		
		function fakeSubmitMe(obj) {
			// first grab the values from the real form and place them into the hidden fields
			document.frm_editContent2.title.value = document.frm_editContent.title.value;
			document.frm_editContent2.categoryID.value = document.frm_editContent.categoryID.value;
			document.frm_editContent2.teaser.value = document.frm_editContent.teaser.value;
			document.frm_editContent2.articleContent.value = document.frm_editContent.articleContent.value;
            document.frm_editContent2.contentMetaData.value = document.frm_editContent.contentMetaData.value;
            document.frm_editContent2.publicationDate.value = document.frm_editContent.publicationDate.value;
  			document.frm_editContent2.submit(openWin("newWin", 400, 300, true));
		}
	// -->
</script>
<!--- <script language="javascript" type="text/javascript" src="views/_scripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
tinyMCE.init({
	mode : "textareas",
	theme : "advanced",
	plugins : "table,save,advhr,advimage,advlink,emotions,iespell,insertdatetime,preview,zoom,flash,searchreplace,print,contextmenu",
	theme_advanced_buttons1_add_before : "save,separator",
	theme_advanced_buttons1_add : "fontselect,fontsizeselect",
	theme_advanced_buttons2_add : "separator,insertdate,inserttime,preview,zoom,separator,forecolor,backcolor",
	theme_advanced_buttons2_add_before: "cut,copy,paste,separator,search,replace,separator",
	theme_advanced_buttons3_add_before : "tablecontrols,separator",
	theme_advanced_buttons3_add : "emotions,iespell,flash,advhr,separator,print",
	theme_advanced_toolbar_location : "top",
	theme_advanced_toolbar_align : "left",
	theme_advanced_path_location : "bottom",
	plugin_insertdate_dateFormat : "%Y-%m-%d",
	plugin_insertdate_timeFormat : "%H:%M:%S",
	extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name],hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]",
	external_link_list_url : "example_data/example_link_list.js",
	external_image_list_url : "example_data/example_image_list.js",
	flash_external_list_url : "example_data/example_flash_list.js"
});
</script> --->
</cfsavecontent>
<cfhtmlhead text="#attributes.previewJS#" />
<cfscript>
	
	if (event.isArgDefined('content')) {
		// empty bean if it's defined - Add action only
		request.pageContent.content = event.getArg('content');    	
	}
	if (event.isArgDefined('contentBean')) {
		// this only really exists if validation failed!
		request.pageContent.content = event.getArg('contentBean');
	}
	
	if (event.isArgDefined('submitEvent')) {
	    attributes.nextEvent = event.getArg('submitEvent');
	} else {
	    attributes.nextEvent = "cms.content.doAction";
	}
	
	if (event.isArgDefined('submitButtonLabel')) {
	    attributes.buttonLabel = event.getArg('submitButtonLabel');
	} else {
	    attributes.buttonLabel = "submit";
	}
	
	if (event.isArgDefined('categoryArray')) {
		attributes.categories = event.getArg('categoryArray');
		attributes.categoryColumnList = "category_id,name,related_name";
	} else if (StructKeyExists(request.pageContent,"categories")) {
		attributes.categories = request.pageContent.categories;
		attributes.categoryColumnList = "category_id,name,related_name";
	} else {
		attributes.categories = arguments.event.getArg("categoryQuery"); 
	    attributes.categoryColumnList = "category_id,name";
	}
	
	myForm = getProperty('formUdf');
	myForm.init("frm_editContent","?event="&attributes.nextEvent,"post","application/x-www-form-urlencoded");
	myForm.openFieldSet(elementPos=1,elementTitle="Content details",elementLegend="Content details");
	myForm.setTextInput(elementPos=2,elementName="title",elementID="r_title",elementSize=25,elementValue=request.pageContent.content.getTitle(),elementLabel="Title",elementTabIndex=1, elementType="text");
	myForm.setSelectGroup(elementPos=3,elementName="categoryID",elementID="r_select_category",elementValue=attributes.categories,elementLabel="Category",elementTabIndex=2,elementColumnList=attributes.categoryColumnList,elementMultiple=5,elementSelectedIndex=request.pageContent.content.getCategoryID());
	myForm.setTextArea(elementPos=4,elementName="teaser",elementID="r_teaser",elementValue=request.pageContent.content.getTeaser(),elementLabel="Teaser",elementTabIndex=3,elementEvent="",elementRows="4",elementCols="53");
	myForm.setTextArea(elementPos=5,elementName="articleContent",elementID="r_body",elementValue=request.pageContent.content.getArticleContent(),elementLabel="Body",elementTabIndex=4,elementEvent="",elementRows="20",elementCols="53");
	myForm.setTextArea(elementPos=6,elementName="contentMetaData",elementID="o_meta_data",elementValue=request.pageContent.content.getContentMetaData(),elementLabel="Meta data",elementTabIndex=4,elementEvent="",elementRows="3",elementCols="53");
	myForm.closeFieldSet(elementPos=7);
	myForm.openFieldSet(elementPos=8,elementTitle="Publication details",elementLegend="Publication details");
	myForm.setTextInput(elementPos=9,elementName="publicationDate",elementID="r_publish_date",elementSize=25,elementValue=request.pageContent.content.getPublicationDate(),elementLabel="Publish date",elementTabIndex=5, elementType="text");
	myForm.setTextInput(elementPos=10,elementName="expiryDate",elementID="r_expiry_date",elementSize=25,elementValue=request.pageContent.content.getExpiryDate(),elementLabel="Expiry date",elementTabIndex=6, elementType="text");
	myForm.setCheckBox(elementPos=11,elementName="isPublished",elementID="o_publish",elementValue="true",elementLabel="Publish?",elementTabIndex=7,elementChecked=request.pageContent.content.getIsPublished(),elementType="checkbox");
	myForm.closeFieldSet(elementPos=12);
	myForm.setSubmitButton(elementPos=13,elementName="btn_submit",elementID="btn_submit",elementValue=attributes.buttonLabel,elementTabIndex=8, elementType="submit");
	myForm.setHiddenInput(elementPos=14,elementName="contentID",elementID="hdn_content_id",elementType="hidden",elementValue=request.pageContent.content.getContentId());
	myForm.setHiddenInput(elementPos=15,elementName="author",elementID="hdn_author",elementType="hidden",elementValue=request.pageContent.content.getAuthor());
	myForm.setHiddenInput(elementPos=16,elementName="contentType",elementID="hdn_content_type",elementType="hidden",elementValue=request.pageContent.content.getContentType());
	writeOutput(myForm.getCompletedForm());
	
	attributes.mySubmitEvent = " onSubmit=""return openWin(this.target, 400, 300, true)""";
	myForm.init("frm_editContent2","?event=cms.showPreview","post","application/x-www-form-urlencoded", attributes.mySubmitEvent, "newWin");
	myForm.setHiddenInput(elementPos=1,elementName="contentID",elementID="hdn_content_id",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=2,elementName="title",elementID="hdn_title",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=3,elementName="categoryID",elementID="hdn_category_id",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=4,elementName="teaser",elementID="hdn_teaser",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=5,elementName="articleContent",elementID="hdn_body",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=6,elementName="contentMetaData",elementID="hdn_content_meta_data",elementType="hidden",elementValue="");
	myForm.setHiddenInput(elementPos=7,elementName="publicationDate",elementID="hdn_publication_date",elementType="hidden",elementValue="");
	writeOutput(myForm.getCompletedForm());
</cfscript>
<div>
    <a href="?event=cms.showPreview" title="Preview me" onClick="fakeSubmitMe(this); return false;">Click here to view a preview of your content</a>.
</div>
<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; edit content &##187;&##187; " & request.pageContent.content.getTitle() />
