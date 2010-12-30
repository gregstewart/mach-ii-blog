<cfscript>
	request.pageContent = structNew();
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
	
	if (event.isArgDefined('content')) {
		// empty bean if it's defined - Add action only
		request.pageContent.content = event.getArg('content');    	
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
	myForm.openFieldSet(elementPos=1,elementTitle="Select a title",elementLegend="Selection time");
	myForm.setSelectGroup(elementPos=2,elementName="categoryId",elementID="r_category_id",elementSize=15,elementValue=attributes.categories,elementColumnList=attributes.categoryColumnList,elementLabel="Select category",elementTabIndex=1);
	myForm.closeFieldSet(elementPos=3);
	// sample submit button
	myForm.setSubmitButton(elementPos=4,elementName="btn_submit",elementID="btn_submit",elementValue=attributes.buttonLabel,elementTabIndex=3, elementType="submit");
	writeOutput(myForm.getCompletedForm());
</cfscript>

<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; select content " />