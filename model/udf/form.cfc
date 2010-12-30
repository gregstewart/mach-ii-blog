<cfcomponent displayname="Form" hint="This CFC will be used to build up a form and it's elements" output="true">
	
	<cffunction name="init" access="public" output="false" hint="This is the constructor"> 
		<cfargument name="formName" type="string" required="true" default="frm_sample" />
		<cfargument name="formAction" type="string" required="true" default="index.cfm" />
		<cfargument name="formMethod" type="string" required="true" default="post" />
		<cfargument name="formEnctype" type="string" required="true" default="application/x-www-form-urlencoded" />
		<cfargument name="formEvent" type="string" required="false" default="" hint="This argument holds the event type as well as the event to execute" />
		<cfargument name="formTarget" type="string" required="false" default="" hint="This argument holds the target value if applicable" />
		
		<cfscript>
			variables.arFormElements = ArrayNew(1);
			variables.startForm = "<form action="""&arguments.formAction&""" method="""&arguments.formMethod&""" name="""&arguments.formName&""" id="""&arguments.formName&""" enctype="""&arguments.formEnctype&"""";
			// if there is a target add it now
			if (arguments.formTarget neq "") {
			 variables.startForm = variables.startForm & " target=""" & arguments.formTarget & """";
			}
			
			// if there is an event add it now
			if (arguments.formEvent neq "") {
			 variables.startForm = variables.startForm & arguments.formEvent;
			}
			variables.startForm = variables.startForm & ">";
			variables.endForm = "</form>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="openFieldSet" access="public" output="false" hint="Starts the fieldset wrapper for grouping form fields together">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementTitle" type="string" required="true" default="" hint="The title attribute for this form element" />
		<cfargument name="elementLegend" type="string" required="true" default="" hint="This will be value displayed for the fieldset, can be the same as elementTitle" />
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
			<fieldset title="""&arguments.elementTitle&""">
				<legend>"&arguments.elementLegend&"</legend>";
		</cfscript>
	</cffunction>
	
	<cffunction name="closeFieldSet" access="public" output="false" hint="Closing function call for field sets, only takes a pos argument">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
			</fieldset>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setLabel" access="private" output="false" hint="This method is used by almost all of the form fields to set the label for a given input field">
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementLabel" type="string" required="true" default="some Label" hint="form element lable used both for accessibility &lt;label&gt; and form attribute title" />
		
		<cfscript>
			var returnLabel = "<label for="""&arguments.elementName&""">"&arguments.elementLabel&"</label>";
		</cfscript>
		
		<cfreturn returnLabel />
	</cffunction>
	
	<cffunction name="setTextInput" access="public" output="false" hint="Set text/password input fields">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementSize" type="string" required="false" default="20" hint="form element size" />
		<cfargument name="elementValue" type="string" required="false" default="" hint="form element value" />
		<cfargument name="elementLabel" type="string" required="true" default="some Label" hint="form element lable used both for accessibility &lt;label&gt; and form attribute title" />
		<cfargument name="elementMaxLength" type="string" required="false" default="0" hint="form element max length" />
		<cfargument name="elementTabIndex" type="string" required="true" default="" hint="form tab index" />
		<cfargument name="elementEvent" type="string" required="false" default="" hint="This argument contains both the event type and the JS function to be executed, e.g. onClick='callThisMethod()';" />
		<cfargument name="elementType" type="string" required="true" default="text" hint="This argument determines whether it's a text or password field" />
		<cfargument name="elementDisabled" type="string" required="false" default="false" hint="This argument determines whether the element is enabled" />
		
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
<div class=""row"">
	<span class=""label"">"&setLabel(arguments.elementName, arguments.elementLabel)&"</span>
	<span class=""formw""><input type="""&arguments.elementType&""" name="""&arguments.elementName&""" id="""&arguments.elementID&""" size="""&arguments.elementSize&""" value="""&arguments.elementValue&"""";
			if (arguments.elementMaxLength neq 0) {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&" maxlength="""&arguments.elementMaxLength&"""";
			}
			if (trim(arguments.elementTabIndex) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&" tabindex="""&arguments.elementTabIndex&"""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " title=""text input for: "&arguments.elementLabel&"""";
			if (trim(arguments.elementEvent) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&arguments.elementEvent;
			}
			if (trim(arguments.elementDisabled) neq "false") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " disabled=""disabled""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& "	/></span>
</div>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setCheckBox" access="public" output="true" hint="This function specialises in setting checkboxes">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementSize" type="string" required="false" default="20" hint="form element size" />
		<cfargument name="elementValue" type="string" required="false" default="" hint="form element value" />
		<cfargument name="elementLabel" type="string" required="true" default="some Label" hint="form element lable used both for accessibility &lt;label&gt; and form attribute title" />
		<cfargument name="elementTabIndex" type="string" required="true" default="" hint="form tab index" />
		<cfargument name="elementEvent" type="string" required="false" default="" hint="This argument contains both the event type and the JS function to be executed, e.g. onClick='callThisMethod()';" />
		<cfargument name="elementDisabled" type="string" required="false" default="false" hint="This argument determines whether the element is enabled" />
		<cfargument name="elementChecked" type="boolean" required="false" default="false" hint="This argument determines whether the checkbox has been selected by default" />
		<cfargument name="elementType" type="string" required="true" default="checkbox" hint="This argument determines whether it's a radio or checkbox field" />
		<cfscript>	
variables.arFormElements[arguments.elementPos] = "
<div class=""row"">
	<span class=""label"">"&setLabel(arguments.elementName, arguments.elementLabel)&"</span>
	<span class=""formw""><input type="""&arguments.elementType&""" name="""&arguments.elementName&""" id="""&arguments.elementID&""" value="""&arguments.elementValue&""" tabindex="""&arguments.elementTabIndex&""" title=""checbox: "&arguments.elementLabel&"""";
			if (trim(arguments.elementEvent) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&arguments.elementEvent;
			}
			if (trim(arguments.elementDisabled) neq "false") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " disabled=""disabled""";
			}
			if (arguments.elementChecked eq arguments.elementValue) {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " checked=""checked""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& "	/></span>
</div>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setSelectGroup" access="public" output="true" hint="This function creates a nice drop down box">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementValue" type="any" required="false" default="" hint="form element value, this is set to any as you can pass in a query or an array of values." />
		<cfargument name="elementLabel" type="string" required="true" default="some Label" hint="form element lable used both for accessibility &lt;label&gt; and form attribute title" />
		<cfargument name="elementTabIndex" type="string" required="true" default="" hint="form tab index" />
		<cfargument name="elementEvent" type="string" required="false" default="" hint="This argument contains both the event type and the JS function to be executed, e.g. onClick='callThisMethod()';" />
		<cfargument name="elementDisabled" type="string" required="false" default="false" hint="This argument determines whether the element is enabled" />
		<cfargument name="elementColumnList" type="string" required="false" default="0" hint="This argument can accept two or three column names. The first two should represent the submit and display value respectively. The third is optional and if presents is used to create optgroup's" />
		<cfargument name="elementMultiple" type="numeric" required="false" default="0" hint="This item switches multiple selects. If greater than 0 then mulitple selects are enabled and the value passed in will represent the number of rows to display." />
		<cfargument name="elementSelectedIndex" type="string" required="false" default="" hint="This attribute allows you to pass in a selected option. Has to be a string." />
		<cfscript>
			var optionType = 1; // query
			var optionLen = 0;
			var columnList = "";
			var groupByItemTracker = "";
			var GroupByThisColumn = "";
			var tmpy = ""; 
			var i = 0;
			
			// what type of value list do we have?
			if (isArray(arguments.elementValue)) { // an Array
				optionType = 0;
				optionLen = ArrayLen(arguments.elementValue);
			} else if (isQuery(arguments.elementValue)) { 
				optionType = 1;
				optionLen = arguments.elementValue.recordcount;
			} else { // a list
				optionType = 2;
				optionLen = ListLen(arguments.elementValue);
			}
			
			variables.arFormElements[arguments.elementPos] = "
<div class=""row"">
	<span class=""label"">"&setLabel(arguments.elementName, arguments.elementLabel)&"</span>
	<span class=""formw""><select name="""&arguments.elementName&""" id="""&arguments.elementID&""" tabindex="""&arguments.elementTabIndex&""" title=""select option for: "&arguments.elementLabel&"""";
			if (arguments.elementMultiple gt 0) {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & " multiple=""true"" size="""&arguments.elementMultiple&"""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & ">";
			for (i=1; i lte optionLen; i=i+1) {
				if (optionType eq 1) {
					if ((listLen(arguments.elementColumnList) gt 2) and (groupByItemTracker neq arguments.elementValue[ListGetAt(arguments.elementColumnList, 3)][i])) {
						GroupByThisColumn = ListGetAt(arguments.elementColumnList, 3);
						if (i neq 1) { // it's not the first item so close the optgroup
							variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			</optgroup>";
						}
						groupByItemTracker = arguments.elementValue[GroupByThisColumn][i]; // set the groupg by for tracking and then create the optgroup
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			<optgroup label="""&arguments.elementValue[GroupByThisColumn][i]&""">";				
					} 
					variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			<option value="""&arguments.elementValue[ListGetAt(arguments.elementColumnList, 1)][i]&"""";
					
					if (arguments.elementSelectedIndex neq "" AND arguments.elementSelectedIndex eq arguments.elementValue[ListGetAt(arguments.elementColumnList, 1)][i]) {
						// there is a selected index being passed in, so set the index to selected
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & " selected=""selected""";
					}
					
					variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & ">"&arguments.elementValue[ListGetAt(arguments.elementColumnList, 2)][i]&"</option>";
					if ((listLen(arguments.elementColumnList) gt 2) and (i eq optionLen)) { // now close the optgroup as we have reached the end
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			</optgroup>";
					}	
				} else if (optionType eq 0) {
					// array processing goes here
					if ((listLen(arguments.elementColumnList) gt 2) and (groupByItemTracker neq arguments.elementValue[i][3])) {
						GroupByThisColumn = ListGetAt(arguments.elementColumnList, 3);
						if (i neq 1) { // it's not the first item so close the optgroup
							variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			</optgroup>";
						}
						groupByItemTracker = arguments.elementValue[i][3]; // set the groupg by for tracking and then create the optgroup
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			<optgroup label="""&arguments.elementValue[i][3]&""">";				
					}
					variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			<option value="""&arguments.elementValue[i][1]&"""";
			        if (arguments.elementSelectedIndex neq "" AND arguments.elementSelectedIndex eq arguments.elementValue[i][1]) {
						// there is a selected index being passed in, so set the index to selected
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & " selected=""selected""";
					}
					
					variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & ">"&arguments.elementValue[i][2]&"</option>";
				} else {
				    // list processing goes here
				    variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			<option value="""&ListGetAt(arguments.elementValue,i)&"""";
			        if (arguments.elementSelectedIndex neq "" AND arguments.elementSelectedIndex eq ListGetAt(arguments.elementValue,i)) {
						// there is a selected index being passed in, so set the index to selected
						variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & " selected=""selected""";
					}
					
					variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & ">"&ListGetAt(arguments.elementValue,i)&"</option>";
				}
			}
			if (listLen(arguments.elementColumnList) gt 2) {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
			</optgroup>";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos] & "
		</select>
	</span>
</div>";		
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setTextArea" access="public" output="false" hint="This function sets the text area input">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementValue" type="string" required="false" default="" hint="form element value" />
		<cfargument name="elementTabIndex" type="string" required="true" default="" hint="form tab index" />
		<cfargument name="elementEvent" type="string" required="false" default="" hint="This argument contains both the event type and the JS function to be executed, e.g. onClick='callThisMethod()';" />
		<cfargument name="elementDisabled" type="string" required="false" default="false" hint="This argument determines whether the element is enabled" />
		<cfargument name="elementRows" type="numeric" required="false" default="5" hint="this controls the number of rows for the text area field" />
		<cfargument name="elementCols" type="numeric" required="false" default="25" hint="this controls the number of columns for the text area field" />
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
<div class=""row"">
	<span class=""label"">"&setLabel(arguments.elementName, arguments.elementLabel)&"</span>
	<span class=""formw""><textarea name="""&arguments.elementName&""" id="""&arguments.elementID&""" rows="""&arguments.elementRows&""" cols="""&arguments.elementCols&"""";
			if (trim(arguments.elementTabIndex) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&" tabindex="""&arguments.elementTabIndex&"""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " title=""text input for: "&arguments.elementLabel&"""";
			if (trim(arguments.elementEvent) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&arguments.elementEvent;
			}
			if (trim(arguments.elementDisabled) neq "false") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& " disabled=""disabled""";
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& ">"&arguments.elementValue&"</textarea></span>
</div>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setSubmitButton" access="public" output="false" hint="This function sets the submit button">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementValue" type="string" required="false" default="" hint="form element value" />
		<cfargument name="elementTabIndex" type="string" required="true" default="" hint="form tab index" />
		<cfargument name="elementEvent" type="string" required="false" default="" hint="This argument contains both the event type and the JS function to be executed, e.g. onClick='callThisMethod()';" />
		<cfargument name="elementType" type="string" required="true" default="submit" hint="This argument determines whether it's a submit, reset or button field" />
		<cfargument name="elementDisabled" type="string" required="false" default="false" hint="This argument determines whether the element is enabled" />
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
<div class=""row"" align=""center"">
		<span class=""button""><input type="""&arguments.elementType&""" name="""&arguments.elementName&""" id="""&arguments.elementID&""" value="""&arguments.elementValue&"""";
			if (trim(arguments.elementEvent) neq "") {
				variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]&arguments.elementEvent;
			}
			variables.arFormElements[arguments.elementPos] = variables.arFormElements[arguments.elementPos]& "	/></span>
</div>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setValidateRow" access="public" output="false" hint="This function sets the row that will hold a validation message (on error). Use this in conjunction with http://gregs.tcias.co.uk/javascript/generic_form_validation_%E2%80%93_part_ii.php">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementClass" type="string" required="true" default="alert" hint="class to format the error message" />
		<cfargument name="elementID" type="string" required="true" default="alert" hint="This is used by the JavaScript to locate the proper place on the form to inform of the error. Should be the same as the elementPos for the field in question" />
		
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
<div class=""row"" align=""center"">
		<span id=""elField"&arguments.elementID&""" class="""&arguments.elementClass&"""></span>
</div>";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="setHiddenInput" access="public" output="false" hint="Set hidden input fields">
		<cfargument name="elementPos" type="numeric" required="true" default="" hint="this controls the position in the array" />
		<cfargument name="elementName" type="string" required="true" default="formField" hint="form element name" />
		<cfargument name="elementID" type="string" required="true" default="formField" hint="form element id" />
		<cfargument name="elementType" type="string" required="false" default="hidden" hint="This argument is optional and defaults to hidden as this is the only possible value" />
		
		<cfscript>
			variables.arFormElements[arguments.elementPos] = "
<input type="""&arguments.elementType&""" name="""&arguments.elementName&""" id="""&arguments.elementID&""" value="""&arguments.elementValue&""" />";
		</cfscript>
	</cffunction>
	
	
	<cffunction name="getFormElement" access="private" returntype="string" output="false" hint="This function accesses the formElement array and returns the requested position's content, i.e the xHTML">
		<cfargument name="pos" type="numeric" required="true" default="" hint="array position to access" />
		
		<cfset var tmpy = "" />
		<cftry>
			<cfset tmpy = variables.arFormElements[arguments.pos] />
			<cfcatch type="any">
				<cfset tmpy = "<p>The application was unable to perform a required operation (usually a missing array index, check your form items and element positions).<br />Please try again later.<br />If this problem persists, contact Customer Service and include the following information:<br /><strong>#cfcatch.message#</strong></p>" />
			</cfcatch>
		</cftry>
		<!--- <cfscript>
			var tmpy = "";
			BlueDragon does not support try/catch within cfscript
			try {
				tmpy = variables.arFormElements[arguments.pos];
			} catch (Any excpt) { 
				// try and catch any errors usually a missing array index
				tmpy = "<p>The application was unable to perform a required operation (usually a missing array index, check your form items and element positions).<br />Please try again later.<br />If this problem persists, contact Customer Service and include the following information:<br /><strong>#excpt.Message#</strong></p>";
			}
		</cfscript> --->
		
		<cfreturn tmpy />
	</cffunction>
	
	
	<cffunction name="getCompletedForm" access="public" returntype="string" output="false" hint="This function builds up the form and returns it to the calling page">
		<cfscript>
			var completedForm = "";
			var arLen = 0;
			completedForm = variables.startForm;
			arLen = ArrayLen(variables.arFormElements);
			for(i=1; i lte arLen; i=i+1) {
				completedForm = completedForm & getFormElement(i);
			}
			completedForm = completedForm & variables.endForm;
		</cfscript>
		
		<cfreturn completedForm />
	</cffunction>
	
</cfcomponent>