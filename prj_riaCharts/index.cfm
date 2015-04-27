<cfset objRIAforge = createObject('component','riaforge').init(837) />


<script type="text/javascript" src="ampie/swfobject.js"></script>
	<div id="riaChart"><strong>Error in Data or Settings</strong>
</div>

<cfset myProjects = objRIAforge.getProjects() />
<cfsavecontent variable="mySettingsXML">
	<cfinclude template="mySettings.cfm">
</cfsavecontent>

<cfsavecontent variable="myDatasXML">
	<cfinclude template="myDatas.cfm">
</cfsavecontent>

<script type="text/javascript">
	<cfoutput>
	// <![CDATA[		
		var so = new SWFObject("ampie/ampie.swf","ampie","200","200","8","");
		so.addVariable("path","");
		so.addVariable('chart_settings',encodeURIComponent("#replace(mySettingsXML,chr(13)&chr(10),"","all")#"));
		so.addVariable('chart_data',encodeURIComponent("#replace(myDatasXML,chr(13)&chr(10),"","all")#"));
		so.write("riaChart");
	// ]]>
	</cfoutput>
</script>