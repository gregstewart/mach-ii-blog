<cfcomponent name="utils" displayname="I hold a number of useful functions" hint="util collection">
    <cffunction name="init" access="public" output="false" returntype="void">
        <!--- do something --->
    </cffunction>

    <cffunction name="makexHTMLValid" displayname="Tidy parser" hint="Takes a string as an argument and returns parsed and valid xHTML" output="true">
		<cfargument name="strToParse" required="true" type="string" default="" />
		<cfscript>
			/**
			* This function reads in a string, checks and corrects any invalid HTML.
			* By Greg Stewart
			*
			* @param strToParse 	 		The string to parse (will be written to file).
			*													accessible from the web browser
			* @return returnPart
			* @author Greg Stewart (gregs(at)tcias.co.uk)
			* @version 1, August 22, 2004

			* @version 1.1, September 09, 2004
			* with the help of Mark Woods this UDF no longer requires temp files and only accepts
			* the string to parse
			*/

			var returnPart = ""; // return variable
			parseData = trim(arguments.strToParse);

			// jTidy part
			if (Server.ColdFusion.ProductVersion eq "BlueDragon") {
				// BD free version
				pathToTidy = "/usr/local/NewAtlanta/BlueDragon_Server_62/lib/ext/Tidy.jar";
				// Create an instance of java.net.URL for passing to the URLClassLoader
				URLObject = createObject('java','java.net.URL');
				// Initialize the object with the jar file
				URLObject.init("file:" & pathToTidy);
				// Create an Array and add our URLObject to it
				arr[1] = urlobject;
				// Create and the URLClassLoader and pass it the array containing our path
				loader = createObject('java','java.net.URLClassLoader');
				loader.init(arr);
				// Use our new class loader to load the DOMConfigurator class
				jTidy = loader.loadClass("org.w3c.tidy.Tidy").newInstance();
			} else {
				// CFMX
				jTidy = createObject("java","org.w3c.tidy.Tidy");
			}

			jTidy.setQuiet(false);
			jTidy.setIndentContent(true);
			jTidy.setSmartIndent(true);
			jTidy.setIndentAttributes(true);
			jTidy.setWraplen(1024);
			jTidy.setXHTML(true);

			// create the in and out streams for jTidy
			readBuffer = CreateObject("java","java.lang.String").init(parseData).getBytes();
			inP = createobject("java","java.io.ByteArrayInputStream").init(readBuffer);
			//ByteArrayOutputStream
			outx = createObject("java", "java.io.ByteArrayOutputStream").init();

			// do the parsing
			jTidy.parse(inP,outx);
			// close the stream
			// outx.close();
			outstr = outx.toString();
			writeOutput(jTidy.getParseErrors());
			// ok now strip all the header/body stuff
			startPos = REFind("<body>", outstr)+6;
			endPos = REFind("</body>", outstr);
			returnPart = toString(Mid(outstr, startPos, endPos-startPos));
		</cfscript>
		<cfreturn returnPart />
	</cffunction>

	<cffunction name="IsEmail" access="public" displayname="check Email" output="false" returntype="boolean" hint="Checks whether an email address is formatted.">
	    <cfargument name="str" default="" type="string" required="true" displayname="str to check" hint="the email address to check" />
			<cfif (REFindNoCase("^['_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.(([a-z]{2,3})|(aero|coop|info|museum|name))$",arguments.str))>
        		<cfreturn TRUE />
			<cfelse>
			    <cfreturn FALSE />
			</cfif>
	</cffunction>

	<cffunction name="codeTransformFromFile" access="public" displayname="" output="false" returntype="string" hint="">
	    <cfargument name="fName" type="string" required="true" displayname="String" hint="I am the string to be nicely formatted" />
	    <cfscript>
			/**
			* This function reads in a file with code and displays and formats the code nicely.
			* Modified/Adapted for ColdFusion by Greg Stewart
			* Rewritten based on original PHP function by Dunstan Orchard (http://www.1976design.com/).
			*
			* @param fName 	 			The file to parse.
			* @return output 			The formatted xHTML code view.
			* @author Greg Stewart (gregs(at)tcias.co.uk)
			* @version 1, August 5, 2004
			*/
			var output =  "<ol class=""code"">";
			var linecount = 0;
			var tabCount = "";
			var comnt = "";
			var class = "";
			var multiLineCmnt = 0;

			fileReader = createObject("java", "java.io.FileReader");
			fileReader = fileReader.init(arguments.fName);
			lineReader = createObject("java","java.io.LineNumberReader");
			lineReader = lineReader.init(fileReader);
			// Read first line, if any into variable line
			line = lineReader.readLine();

			while (isDefined("line")) {
				lineCount = lineCount + 1;
				// convert tags to safe entitiies for display
				line = HTMLEditFormat(line);
				// find out how many tabs (based on FindOccurences() by Ray Camden from cflib.org)
				tabCount = Len(line) - Len(Replace(line,"#chr(9)#","","ALL")) / len("#chr(9)#");
				// set the style for tabs
				if (tabCount gt 0) {
					tabCount = "tab"&tabCount;
				} else {
					tabCount = "";
				}
				// now remove the tabs
				line = Replace(line,"#chr(9)#","","ALL");

				// let's deal with comments
				slashSlashPos = REFind("^//",line, 1, "true");
				slashStarPos = REFind("/\*",line, 1, "true");
				starSlashPos = REFind("\*/",line, 1, "true");

				if (multiLineCmnt neq 1) {
					if (slashSlashPos.pos[1] neq 0) {
						comnt = "cmnt";
						multiLineCmnt = 0;
					} else {
						comnt = "";
						multiLineCmnt = 0;
					}

					if (slashStarPos.pos[1] neq 0) {
						comnt = "cmnt";
						if (starSlashPos.pos[1] neq 0) {
							multiLineCmnt = 0;
						} else {
							multiLineCmnt = 1;
						}
					}
				}

				if (starSlashPos.pos[1] neq 0) {
					comnt = 'cmnt';
					multiLineCmnt = 0;
				}
				// build up the class
				if ((tabCount neq "") AND (comnt neq "")) {
					// set the style for both tabs and comments
					class = " class="""&tabCount&" "&comnt&"""";
				} else if ((tabCount neq "") OR (comnt neq "")) {
					// or for just tabs or comments
					class = " class="""&tabCount&comnt&"""";
				}
				// Process the variable line
				if (line neq "") {
					output = output & "<li"&class&"><code>" & line & "</code></li>";
				} else {
					output = output & "<li"&class&">&nbsp;</li>";
				}
				// Read the next line, if any
				line = lineReader.readLine();
			}
			output = output & "</ol>";
			</cfscript>
		    <cfreturn output />
		</cffunction>

		<cffunction name="codeTransformFromVar" access="public" displayname="Code Format from variable" output="false" returntype="string" hint="I transform code to a list using css from a passed in variable">
		    <cfargument name="fName" type="string" required="true" displayname="String" hint="I am the string to be nicely formatted" />
		    <cfscript>
				/**
				* This function reads in a file with code and displays and formats the code nicely.
				* Modified/Adapted for ColdFusion by Greg Stewart
				* Rewritten based on original PHP function by Dunstan Orchard (http://www.1976design.com/).
				*
				* @param fName 	 			The file to parse.
				* @return output 			The formatted xHTML code view.
				* @author Greg Stewart (gregs(at)tcias.co.uk)
				* @version 1, August 5, 2004
				*/
				var output =  "<ol class=""code"">";
				var linecount = 0;
				var tabCount = "";
				var comnt = "";
				var class = "";
				var multiLineCmnt = 0;
				arguments.fName = HTMLEditFormat(arguments.fName,"-1");
			</cfscript>

            <cfloop list="#arguments.fName#" index="i" delimiters="#chr(10)#">
			    <cfscript>

					// convert tags to safe entitiies for display
					line = i;
					// bizarrely the last line appends a &lt;/code&gt; to output. Strip it out
					if (REfind("&lt;/code&gt;",line)){
						st = REfind("&lt;/code&gt;",line,1,"true");
						line = mid(line,1,len (line)-st.len[1]);
					}

					// find out how many tabs (based on FindOccurences() by Ray Camden from cflib.org)
					//tabCount = Len(line) - Len(Replace(line,"#chr(32)#","","ALL")) / len("#chr(32)#");
					tabCount = Len(line) - Len(Replace(line,"#chr(9)#","","ALL")) / len("#chr(9)#");
					// set the style for tabs
					if (tabCount gt 0) {
						tabCount = "tab"&tabCount;
					} else {
						tabCount = "";
					}

					// writeoutput(tabCount&"<br />");
					// now remove the tabs
					line = Replace(line,"#chr(9)#","","ALL");

					// let's deal with comments
					slashSlashPos = REFind("^//",line, 1, "true");
					slashStarPos = REFind("/\*",line, 1, "true");
					starSlashPos = REFind("\*/",line, 1, "true");
					startCFpos = REFind("<---",line, 1, "true");
					endCFPos = REFind("--->",line, 1, "true");

					if (multiLineCmnt neq 1) {
						if (slashSlashPos.pos[1] neq 0) {
							comnt = "cmnt";
							multiLineCmnt = 0;
						} else {
							comnt = "";
							multiLineCmnt = 0;
						}

						if ((starSlashPos.pos[1] neq 0) or (startCFpos.pos[1] neq 0)) {
							comnt = "cmnt";
							if ((starSlashPos.pos[1] neq 0) or (endCFPos.pos[1] neq 0)) {
								multiLineCmnt = 0;
							} else {
								multiLineCmnt = 1;
							}
						}
					}

					if ((starSlashPos.pos[1] neq 0) or (startCFpos.pos[1] neq 0)) {
						comnt = 'cmnt';
						multiLineCmnt = 0;
					}
					// build up the class
					if ((tabCount neq "") AND (comnt neq "")) {
						// set the style for both tabs and comments
						class = " class="""&tabCount&" "&comnt&"""";
					} else if ((tabCount neq "") OR (comnt neq "")) {
						// or for just tabs or comments
						class = " class="""&tabCount&comnt&"""";
					} else {
						class = "";
					}

					// Process the variable line
					if (line neq "") {
						output = output & "<li"&class&"><code>" & line & "</code></li>";

					} else {
						output = output & "<li"&class&">&nbsp;</li>";
					}

			    </cfscript>
			</cfloop>

			<cfset output = output & "<li class=""credit"">inspired by Dunstan Orchard's <a href=""http://www.1976design.com/blog/archive/2004/07/29/redesign-tag-transform/"" title=""Redesign explained: tag transformations"">code view</a></li></ol>" />
		    <cfreturn output />
		</cffunction>

		<cffunction name="reFindAll" output="true" returnType="struct">
		   <!---
			 Returns all the matches of a regular expression within a string.

			 @param regex 	 Regular expression. (Required)
			 @param text 	 String to search. (Required)
			 @return Returns an array.
			 @author Ben Forta (ben@forta.com)
			 @version 1, November 6, 2003
		   --->

		   <cfargument name="regex" type="string" required="yes">
		   <cfargument name="text" type="string" required="yes">

		   <!--- Define local variables --->
		   <cfset var results=structNew()>
		   <cfset var pos=1>
		   <cfset var subex="">
		   <cfset var done=false>

		   <!--- Initialize results structure --->
		   <cfset results.len=arraynew(1)>
		   <cfset results.pos=arraynew(1)>

		   <!--- Loop through text --->
		   <cfloop condition="not done">

		      <!--- Perform search --->
		      <cfset subex=reFind(arguments.regex, arguments.text, pos, true)>
		      <!--- Anything matched? --->
		      <cfif subex.len[1] is 0>
		         <!--- Nothing found, outta here --->
		         <cfset done=true>
		      <cfelse>
		         <!--- Got one, add to arrays --->
		         <cfset arrayappend(results.len, subex.len[1])>
		         <cfset arrayappend(results.pos, subex.pos[1])>
		         <!--- Reposition start point --->
		         <cfset pos=subex.pos[1]+subex.len[1]>
		      </cfif>
		   </cfloop>

		   <!--- If no matches, add 0 to both arrays --->
		   <cfif arraylen(results.len) is 0>
		      <cfset arrayappend(results.len, 0)>
		      <cfset arrayappend(results.pos, 0)>
		   </cfif>

		   <!--- and return results --->
		   <cfreturn results>
		</cffunction>

	</cfcomponent>
