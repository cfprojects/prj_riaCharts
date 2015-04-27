<cfcomponent output="false" hint="DIPs and more">

<cffunction name="init" returntype="riaforge" access="public" hint="als Konstruktor der Klasse die Vorgabewerte setzen" output="false">
	<cfargument name="autorID" type="string" required="true" hint="Name des Autors" />

	<cfloop collection="#arguments#" item="myArg">	<!--- alle Argumente als Objektvariablen setzen --->
		<cfset variables.instance[myArg] = arguments[myArg] />
	</cfloop>
	<cfset variables.instance['url'] = "http://www.riaforge.org/index.cfm?event=xml.userprojects" />

	<cfreturn this />
</cffunction>


<cffunction name="getProjects" returntype="xml" access="public" output="false" hint="holt alle DIPs zur PIE-Anzeige">

	<cfset var myProjects = "" />
	<cfhttp url="#variables.instance.url#&uid=#variables.instance.autorID#" method="get" result="myProjects" timeout="30" proxyserver="www-gw.csintra.net" proxyport="8080" />

	<cfreturn xmlparse(myProjects.filecontent).projects />
</cffunction>


<!--- CFC-Basis --->
<cffunction name="getInstanceData" returntype="struct" access="public" hint="zur Anzeige der akt. Objekt-Variablen">
  <cfreturn variables.instance />
</cffunction>

</cfcomponent>