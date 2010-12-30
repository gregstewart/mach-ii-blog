<cfscript>
	if (event.isArgDefined('content')) {
		// empty bean if it's defined - Add action only
		request.pageContent.content = event.getArg('content');    	
	}
	
	myForm = getProperty('formUdf');
	myForm.init("frm_editContent","?event="&event.getArg('submitEvent'),"post","application/x-www-form-urlencoded");
	myForm.openFieldSet(elementPos=1,elementTitle="Select a title",elementLegend="Selection time");
	myForm.setSelectGroup(elementPos=2,elementName="contentId",elementID="r_content_id",elementSize=15,elementValue=request.pageContent.content,elementColumnList="content_id,content_title",elementLabel="Select content",elementTabIndex=1);
	myForm.closeFieldSet(elementPos=3);
	// sample submit button
	myForm.setSubmitButton(elementPos=4,elementName="btn_submit",elementID="btn_submit",elementValue="Select",elementTabIndex=3, elementType="submit");
	writeOutput(myForm.getCompletedForm());
</cfscript>

<cfset request.pageProperties.pageTitle = "" />
<cfset request.pageProperties.pageTitle = " gregs &##187;&##187; select content &##187;&##187; " />