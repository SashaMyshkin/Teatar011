<cfset DATA = createObject('component','../auditionData')>
<cfset candidates = DATA.getAllCandidates()>


<cfparam name="url.q" default="">



<cfoutput>
	<h1 class="display-6 mt-3 mb-2 text-center">Lista kandidata</h1>

	<cfif url.q eq "">
		<table class="table table-sm table-dark table-striped table-hover caption-top">
			<caption class="text-light">Ukupno: #candidates.recordcount#<caption>
			<thead>
				<tr>
					<th scope="col">##</th>
					<th scope="col">Ime</th>
					<th scope="col">Prezime</th>
					<th scope="col">Datum rođenja</th>
					<th scope="col">Imejl</th>
					<th scope="col">Čuo za nas putem</th>
					<th scope="col">Odgledana predstave</th>
				</tr>
			</thead>
			<tbody>
				<cfset count = 1>
				<cfloop query="#candidates#">
					<tr style="cursor:pointer" onclick="location.href='#session.scriptName#?q=#id#'">
						<td>#count#</td>
						<td>#name#</td>
						<td>#surname#</td>
						<td>#dateOfBirth#</td>
						<td>#email#</td>
						<td>#heardAboutUs#</td>
						<td>#playsWatched#</td>
					</tr>
					<cfset count = count + 1>
				</cfloop>
			</tbody>
		</table>
	</cfif>

	
</cfoutput>
