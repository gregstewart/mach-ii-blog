<cfcomponent displayname="XML commentDAO" extends="uk.co.tcias.gregs.model.comment.commentDAO">
    <cffunction name="init" access="public" returntype="uk.co.tcias.gregs.model.comment.commentDAO">		
		<cfargument name="dsn" type="string" required="true" />		
		<cfscript>			
			variables.dsn = arguments.dsn;
		</cfscript>		
		<cfreturn this />
	</cffunction>
	
    <cffunction name="nodeCount" access="private" returntype="numeric" displayname="Node Count" hint="Function that counts the number of elements in a node" output="false">
	    <cfargument name="xmlElement" type="string" required="true" default="" displayname="XML ELement" hint="Current element to evaluate" />
	    <cfargument name="nodeName" type="string" required="true" default="" displayname="Node Name" hint="Node to evaluate" />
        <cfscript>
			var nodesFound = 0;
			var i = 0;
			for ( i = 1; i LTE ArrayLen(arguments.xmlElement.XmlChildren); i = i+1)
			{
				if (arguments.xmlElement.XmlChildren[i].XmlName IS arguments.nodeName)
					 nodesFound = nodesFound + 1;
			}            
        </cfscript>

        <cfreturn nodesFound />
    </cffunction> 
    
	<cffunction name="create" returntype="void" output="true" hint="CRUD method">
		<cfargument name="commentID" type="string" default="" required="true" displayname="content id" hint="content id to look up the right xml file" />
		<cfargument name="name" default="" type="string" required="true" displayname="poster name" hint="I store the name of the person who posted">
		<cfargument name="email" default="" type="string" required="true" displayname="poster email" hint="I store the email of the person who posted">
		<cfargument name="website" default="" type="string" required="false" displayname="poster website" hint="I store the website of the person who posted">
		<cfargument name="comment" default="" type="string" required="true" displayname="poster comment" hint="I store the comment of the person who posted">
		<cfargument name="pathToFile" type="string" default="" required="true" displayname="path to XML file" hint="I store the physical path to the XML file" />
		
		<cfscript>
		    var filename = arguments.pathToFile&arguments.commentID&".xml";
			var writeData = "";
			var fileReader = "";
			var lineCount = 0;
			var lineReader = "";
			var fileReadIn = "";
			var myXMLDocument = "";
			var commentTotal = 0;
			var writeFile = "";
			var jStream = "";
			var jWriter = "";
			
			// create the file stream
			var jFile = createobject("java", "java.io.File");
			jFile.init(toString(filename));
			
			// Test for file
			if (fileExists(filename)) {
				fileReader = createObject("java", "java.io.FileReader");
				fileReader = fileReader.init(filename);
		
				if (isObject(fileReader)) {
					lineReader = createObject("java","java.io.LineNumberReader");
					lineReader = lineReader.init(fileReader);
					line = lineReader.readLine(); //Read first line, if any into variable line
					while (isDefined("line")) {
						lineCount = lineCount + 1;
					
						//Process the variable line
						fileReadIn = fileReadIn & line;
						line = lineReader.readLine(); //Read the next line, if any
					}
				}
				// close the connection
				fileReader.close();
		
				myXMLDocument=XmlParse(fileReadIn);
				//mydoc.employee.name[1].first.XmlComment = "This is a comment";
				commentTotal = NodeCount(myXMLDocument.comments,"comment");
				
				ArrayAppend(myXMLDocument.comments.XmlChildren, XmlElemNew(myXMLDocument,"comment"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"id"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"name"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"email"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"website"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"yourcomment"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"date"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"formatteddate"));
				ArrayAppend(myXMLDocument.comments.comment[commentTotal+1].XmlChildren, XmlElemNew(myXMLDocument,"publish"));
				
				myXMLDocument.comments.comment[commentTotal+1].id.XmlText = commentTotal+1;
				myXMLDocument.comments.comment[commentTotal+1].name.XmlText = arguments.name;
				myXMLDocument.comments.comment[commentTotal+1].email.XmlText = arguments.email;
				myXMLDocument.comments.comment[commentTotal+1].website.XmlText = arguments.website;
				myXMLDocument.comments.comment[commentTotal+1].yourcomment.XmlText = arguments.comment;
				myXMLDocument.comments.comment[commentTotal+1].date.XmlText = now();
				myXMLDocument.comments.comment[commentTotal+1].formatteddate.XmlText = DateFormat(now(),"dd, mmmm yyyy");
				myXMLDocument.comments.comment[commentTotal+1].publish.XmlText = 1;				
			} else {
				myXMLDocument = XmlNew();
				myXMLDocument = "<?xml version=""1.0"" encoding=""utf-8""?>
<comments>
	<comment>
		<id>1</id>
		<name>"&arguments.name&"</name>
		<email>"&arguments.email&"</email>
		<website>"&arguments.website&"</website>
		<link><a href="""&arguments.website&""" title=""go to: "&arguments.website&""">"&arguments.website&"</a></link>
		<yourcomment>"&arguments.comment&"</yourcomment>
		<date>"&now()&"</date>
		<formatteddate>"&DateFormat(now(),"dd, mmmm yyyy")&"</formatteddate>
		<publish>1</publish>
	</comment>
</comments>";
				// the file doesn't exist so use the file stream to create it
				jFile.createNewFile();
			}
			
			writeFile = filename;
			writeData = toString(myXMLDocument);
			
			jStream = createobject("java","java.io.FileOutputStream").init(jFile);
			// create the UTF-8 file writer and write the file contents
			jWriter = createobject("java", "java.io.OutputStreamWriter");
			jWriter.init(jStream);
			jWriter.write(trim(writeData));
			// flush the output, clean up and close
			jWriter.flush();
			jWriter.close();
			jStream.close();
		</cfscript>
		
		<cfreturn />
	</cffunction>
	
	<cffunction name="read" returntype="void" output="true" hint="CRUD method">
	    <cfargument name="comment" type="uk.co.tcias.gregs.model.comment.comment" required="yes" displayname="read" hint="I am the comment in which to store an XML Query" />
		<cfargument name="commentID" type="string" default="" required="true" displayname="content id" hint="content id to look up the right xml file" />
		<cfargument name="pathToFile" type="string" default="" required="true" displayname="path to XML file" hint="I store the physical path to the XML file" />
		
		<cfscript>
		    var fileReadIn = "";
		    var lineCount = 0;
		    var filename = arguments.pathToFile&arguments.commentID&".xml";
		    var fileReader = "";
		    var lineReader = "";
		    var line = "";
		    
		    if (fileExists(filename)) {
				fileReader = createObject("java", "java.io.FileReader");
				fileReader = fileReader.init(filename);
		
				if (isObject(fileReader)) {
					lineReader = createObject("java","java.io.LineNumberReader");
					lineReader = lineReader.init(fileReader);
					line = lineReader.readLine(); //Read first line, if any into variable line
					while (isDefined("line")) {
						lineCount = lineCount + 1;
					
						//Process the variable line (never use "," just read it in wasted a while on this)
						fileReadIn =fileReadIn & line;
						line = lineReader.readLine(); //Read the next line, if any
					}
				}
				// close the connection
				fileReader.close();
			} else {
			   fileReadIn = ""; 
			}
            arguments.comment.setCommentID(arguments.commentID);
            arguments.comment.setCommentObject(fileReadIn);
            arguments.comment.setCommentCount(lineCount);
		</cfscript>
	</cffunction>	
</cfcomponent>
