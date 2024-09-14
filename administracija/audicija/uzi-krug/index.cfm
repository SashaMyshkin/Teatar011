


<cfparam name="url.q" default="">
<cfparam name="form.name" default="">
<cfparam name="form.surname" default="">
<cfparam name="form.sex" default="">
<cfparam name="form.confirmed" default="">

<cfset DATA = createObject('component','../auditionData')>

<cfoutput>
	
	<style>
		<cfinclude template="styles.css">
	</style>

	
	<div class="container">
		<cfif url.q eq "">
			<cfset candidates = DATA.getAllShortlisted()>
			<p class="mt-3 mb-2"><b>Odluka o užem krugu</b></p>
			<hr>
			<form method="POST" name="searchForm" id="searchForm">
			  	<div class="row g-3 justify-content-center">
					<div class="col-md-2">
						<label for="input1" class="form-label">Ime</label>
						<input value="#form.name#" type="text" class="form-control form-control-sm form-control-dark" id="name" name="name" placeholder="Unesite ime">
					</div>
		
					<div class="col-md-2">
						<label for="input2" class="form-label">Prezime</label>
						<input value="#form.surname#" type="text" class="form-control form-control-sm form-control-dark" id="surname" name="surname" placeholder="Unesite prezime">
					</div>
		
					<div class="col-md-2">
						<label for="select1" class="form-label">Pol</label>
						<select class="form-select form-select-sm form-select-dark" id="sex" name="sex">
							<option value="" <cfif form.sex eq ""> selected</cfif>></option>
							<option value="1" <cfif form.sex eq "1"> selected</cfif>>Muški</option>
							<option value="2" <cfif form.sex eq "2"> selected</cfif>>Ženski</option>
							<option value="3" <cfif form.sex eq "3"> selected</cfif>>Drugo</option>
						</select>
					</div>
					<div class="col-md-2">
						<label for="select1" class="form-label">Potvrdio dolazak</label>
						<select class="form-select form-select-sm form-select-dark" id="confirmed" name="confirmed">
							<option value="" <cfif form.confirmed eq ""> selected</cfif>></option>
							<option value="1" <cfif form.confirmed eq "1"> selected</cfif>>DA</option>
							<option value="0" <cfif form.confirmed eq "0"> selected</cfif>>NE</option>
						</select>
					</div>
					<div class="col-md-1">
						<label for="select1" class="form-label">&nbsp;</label>
						<button type="submit" class="btn btn-sm btn-primary d-block">Search</button>
					</div>
			  	</div>
			</form>
		</div>
		<div class="container mt-1">
			<table class="table table-sm table-dark table-striped table-hover caption-top">
				<caption class="text-light">Ukupno: #candidates.recordcount#<caption>
				<thead>
					<tr class="text-center">
						<th scope="col">##</th>
						<th scope="col">Ime</th>
						<th scope="col">Prezime</th>
						<th scope="col">Datum rođenja</th>
						<th scope="col">Pol</th>
					</tr>
				</thead>
				<tbody>
					<cfset count = 1>
					<cfloop query="#candidates#">
						<tr class="text-center" style="cursor:pointer" onclick="location.href='#request.scriptName#?q=#id#'">
							<td>#count#</td>
							<td>#name#</td>
							<td>#surname#</td>
							<td>#dateOfBirth#</td>
							<td>#sex#</td>
						</tr>
						<cfset count = count + 1>
					</cfloop>
				</tbody>
			</table>
		<cfelse>
			<cfset candidate = DATA.getCandidateById(url.q)>
			<p class="mt-3 mb-2"><b>Informacije o kandidatu</b></p>
			<hr>
				<div class="row">
					
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Osnovni podaci</h4>
							</div>
							<div class="card-body">
								<p><strong class="text-primary">Ime:</strong> #candidate.name#</p>
								<p><strong class="text-primary">Prezime:</strong> #candidate.surname#</p>
								<p><strong class="text-primary">Datum rođenja:</strong> #candidate.dateOfBirth#</p>
								<p><strong class="text-primary">Imejl:</strong> #candidate.email#</p>
								<p><strong class="text-primary">Broj telefona:</strong> #candidate.phone#</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Komunikacija</h4>
							</div>
							<div class="card-body">
								<p>
									<strong class="text-primary">Uži krug:</strong>
									<span <cfif candidate.shortlisted eq 1>style="color:green!important" <cfelse> style="color:red" </cfif>> &##9737;</span>
								</p>
								<p>
									<strong class="text-primary">Poslat mejl potvrde:</strong>
									<span <cfif candidate.confirmationEmail eq 1>style="color:green!important" <cfelse> style="color:red" </cfif>> &##9737;</span>
								</p>
								<p>
									<strong class="text-primary">Potvrdio dolazak:</strong> 
									<span <cfif candidate.confirmed eq 1>style="color:green!important" <cfelse> style="color:red" </cfif>> &##9737;</span>
								</p>
								<p>
									<strong class="text-primary">Obavešten o satnici:</strong> 
									<span style="color:red"> &##9737;</span>
								</p>
								<p>
									<strong class="text-primary">Primljen u teatar:</strong> 
									<span <cfif candidate.accepted eq 1>style="color:green!important" <cfelse> style="color:red" </cfif>> &##9737;</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Teatar i kandidat</h4>
							</div>
							<div class="card-body">
								<p><strong class="text-primary">Zna za nas preko:</strong> #candidate.howHeardAboutUs#</p>
								<p><strong class="text-primary">Odgledane predstave:</strong>
									<cfif candidate.haveYouWatched eq "1"> 
										#candidate.whatYouWatched#
									<cfelse>
										Nijedna
									</cfif>

								</p>
								
							</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-center">
					

					<div class="col-md-8">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Biografija</h4>
							</div>
							<div class="card-body">
								<p>#candidate.biography#</p>
								
							</div>
						</div>
					</div>
					
					
					
				</div>
		</cfif>
	</div>
		
	

	
</cfoutput>
