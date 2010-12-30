
<cfscript>
	
	if (event.isArgDefined('submitEvent')) {
	    attributes.nextEvent = event.getArg('submitEvent');
	} else {
	    attributes.nextEvent = "cms.category.doAction";
	}
	
	if (event.isArgDefined('submitButtonLabel')) {
	    attributes.buttonLabel = event.getArg('submitButtonLabel');
	} else {
	    attributes.buttonLabel = "submit";
	}
	
	if (event.isArgDefined('category')) {
		attributes.category = event.getArg('category');
	} else {
		attributes.category = request.pageContent.category;
	}
	
	attributes.priority = "1,2,3,4,5,6";
	
	myForm = getProperty('formUdf');
	myForm.init("frm_editContent","?event="&attributes.nextEvent,"post","application/x-www-form-urlencoded");
	myForm.openFieldSet(elementPos=1,elementTitle="Category details",elementLegend="Edit this category");
	myForm.setTextInput(elementPos=2,elementName="name",elementID="r_name",elementSize=25,elementValue=attributes.category.getName(),elementLabel="Name",elementTabIndex=1, elementType="text");
	myForm.setSelectGroup(elementPos=3,elementName="priority",elementID="r_priority",elementSize=15,elementValue=attributes.priority,elementColumnList="priority",elementLabel="Select the priority",elementTabIndex=2);
	myForm.closeFieldSet(elementPos=4);
	// sample submit button
	myForm.setHiddenInput(elementPos=5,elementName="categoryId",elementID="r_category_id",elementType="hidden",elementValue=attributes.category.getCategoryID());
	myForm.setSubmitButton(elementPos=6,elementName="btn_submit",elementID="btn_submit",elementValue=attributes.buttonLabel,elementTabIndex=3, elementType="submit");
	writeOutput(myForm.getCompletedForm());
</cfscript>

<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; edit category " />