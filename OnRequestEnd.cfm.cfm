<h3>Debug info</h3>
<cfparam name="form" default="#StructNew()#" type="struct" />
<cfparam name="url" default="#StructNew()#" type="struct" />

<cfdump var="#form#" />
<cfdump var="#url#">