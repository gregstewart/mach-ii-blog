<cfcomponent displayname="UrlRewriterPlugin" extends="MachII.framework.Plugin" hint="I re-write the URL to fit into a Mach-ii event invocation.">

	<cffunction name="configure" access="public" returntype="void" output="true">
		<!--- do something --->
	</cffunction>

	<!--- PUBLIC FUNCTIONS --->
	<cffunction name="preProcess" access="public" returntype="void" output="true">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />

		<cfscript>
            var lastItem = "";
            var name = "";
            var len = 0;
            var firstEvent = arguments.eventContext.getNextEvent();
            var urlToParse = firstEvent.getArg("file");
            var queryString = "";
            var qSlen = 0;
            var tmpy = "";
            var i = 0;
            // writeOutput(urlToParse&"<br />");
            urlToParse = REReplace(REReplace(urlToParse, "(GET|POST )", ""), "( HTTP\/)+[0-9].[0-9]", "");
            lastItem = urlToParse;
            if (urlToParse neq "") {
		        lastItem = urlToParse;

	            // is there a query string
	            if (REFind("\?",urlToParse)) {
					
	                queryString = REReplace(urlToParse,"\/\?|\/index.cfm\?", "");
	                qSLen = listLen(queryString,"&");
	                if (qSLen gt 0) {
						
	                    for (i=1; i lte qSLen; i=i+1) {

	                        if (ListLen(queryString,"=") gt 1) {
	                        	tmpy = trim(listGetAt(queryString,1));
	                        	firstEvent.setArg(ListGetAt(tmpy,1,"="),ListGetAt(tmpy,2,"="),"string");
	                        }
	                    }
	                    if (firstEvent.isArgDefined("event")) {
							arguments.eventContext.clearEventQueue();
			                arguments.eventContext.announceEvent(firstEvent.getArg("event"),firstEvent.getArgs());
	                    }
	                }
	            }

	            // we have just announced an event so just let it be handled next else continue below
		        if (NOT firstEvent.isArgDefined("event")) {
		            if (Refind("(\.cfm|\.php)",lastItem) neq 0) {
		                lastItem = ListLast(lastItem, "/");
		                // is file
		                name = REReplace(lastItem, "(\.cfm|\.php)", "");
		                // arguments.eventContext.clearEventQueue();
	                    arguments.eventContext.clearEventQueue();
		                firstEvent.setArg("articleTitle",name,"string");
		                arguments.eventContext.announceEvent("main.showArticle",firstEvent.getArgs());
		            } else if (Refind("(\.xml)",lastItem) neq 0) {
		            	arguments.eventContext.clearEventQueue();
		            	arguments.eventContext.announceEvent("main.showFeed");

		            } else {
	                	// is directory

		                if (REFind("(\/rdf\/)",lastItem) neq 0) {
		                	//alternative rss feed call
		                	arguments.eventContext.clearEventQueue();
			            	arguments.eventContext.announceEvent("main.showFeed");
			            } else {

			                len = ListLen(lastItem);
			                if (len gt 0){
			                    if (len eq 1) {
			                    	name = trim(ListLast(lastItem,"/"));
				                } else {
				                	name = trim(ListGetAt(lastItem,ListLen(len)-1));
				                }

			                    if (name neq "") {
				                    arguments.eventContext.clearEventQueue();
					                firstEvent.setArg("indexTitle",name,"string");
					                arguments.eventContext.announceEvent("main.showArticleIndex",firstEvent.getArgs());
			                    }
				            }
		                }
		            }
	            } else {
                    //writeOutput("event was passed in: "&firstEvent.getArg("event"));
	            }
	        }
        </cfscript>
    </cffunction>

	<cffunction name="preEvent" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preEvent()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postEvent" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postEvent()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="preView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.preView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postView" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postView()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="postProcess" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<!--- <cfoutput>&nbsp;SimplePlugin.postProcess()<br /></cfoutput> --->
	</cffunction>

	<cffunction name="handleException" access="public" returntype="void" output="false">
		<cfargument name="eventContext" type="MachII.framework.EventContext" required="true" />
		<cfargument name="exception" type="MachII.util.Exception" required="true" />
		<cfoutput>&nbsp;InitializationPlugin.handleException()<br /></cfoutput>
		<cfoutput>#arguments.exception.getMessage()#</cfoutput>
	</cffunction>

</cfcomponent>