<pie>
<cfoutput>
	<cfset mySmallest = replace(createUUID(),'-','','all') />	<!--- get the smallest Value --->
	<cfloop from="1" to="#arrayLen(myProjects['xmlChildren'])#" index="myProject">
		<cfif mySmallest GT myProjects['xmlChildren'][myProject].xmlChildren[12].xmlText>
			<cfset mySmallest = myProjects['xmlChildren'][myProject].xmlChildren[12].xmlText />
		</cfif>
	</cfloop>
	
	<cfloop from="1" to="#arrayLen(myProjects['xmlChildren'])#" index="myProject">
		<slice title='#myProjects['xmlChildren'][myProject].xmlChildren[10].xmlText#' <cfif mySmallest EQ myProjects['xmlChildren'][myProject].xmlChildren[12].xmlText>pull_out='true'</cfif>>#myProjects['xmlChildren'][myProject].xmlChildren[12].xmlText#</slice>
	</cfloop>
</cfoutput>
</pie>