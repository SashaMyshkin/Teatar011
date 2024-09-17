


<cfparam name="url.q" default="">
<cfparam name="form.name" default="">
<cfparam name="form.surname" default="">
<cfparam name="form.action" default="false">

<cfif not structKeyExists(session, 'time')>
    <cfset session.time = "">
</cfif>

<cfif structKeyExists(form, "time")>
    <cfset session.time = form.time>
</cfif>

    

<cfset DATA = createObject('component','../auditionData')>

<cfoutput>
	
	<style>
		<cfinclude template="styles.css">
	</style>

	
	<div class="container">
		<cfif url.q eq "">
			<cfset candidates = DATA.getConfirmedCandidates()>
			<p class="mt-3 mb-2"><b>Lista kandidata</b></p>
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
						<label for="input2" class="form-label">Vreme audicije</label>
						<input value="#session.time#" type="text" class="form-control form-control-sm form-control-dark" id="time" name="time" placeholder="Unesite vreme audicije">
					</div>

					<div class="col-md-1">
						<label for="select1" class="form-label">&nbsp;</label>
						<button type="submit" class="btn btn-sm btn-primary d-block">Pretraži</button>
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
						</tr>
						<cfset count = count + 1>
					</cfloop>
				</tbody>
			</table>
		<cfelse>
            
			<cfif form.action eq "true">
                <cfset DATA.leaveTheComment()>
            </cfif>
            <cfset commentObject = DATA.getComment()>
			<cfset candidate = DATA.getCandidateById(url.q)>
            <cfset comments = DATA.getComments()>
            
			<p class="mt-3 mb-2"> <button type="button" class="btn btn-sm btn-secondary" onclick="location.href='#application.root#audicija/komentari/'"> Nazad </button> &nbsp; <b>Informacije o kandidatu</b></p>
			<hr>
			<form method="POST" name="submitForm" id="submitForm">
				<input type="hidden" name="action" value="true">
				<div class="row">
                    <div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title">Komentar</h4>
							</div>
							<div class="card-body">
								<form id="commentForm" name="commentForm" method="POST">
									<textarea rows="6" id="comment" name="comment" style="color:black;width:100%;font-size:0.9rem">#commentObject.comment#</textarea>
									<button class="btn btn-secondary btn-sm" type="submit">Ostavi komentar</button>
								</form>
							</div>
						</div>
					</div>

                    <div class="col-md-12">
                        <cfloop query="#comments#">
                            <p><b>#userFullname#</b>: #comment#</p>
                        </cfloop>
                        
                    </div>
					
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
									<span <cfif candidate.timeEmail eq 1>style="color:green!important"<cfelse>style="color:red"</cfif> > &##9737;</span>
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
								<hr>
								<p>
									<div class="form-check">
										<input id="shortlisted" name="shortlisted" class="form-check-input" type="checkbox" 
										onchange="this.form.submit()" 
										<cfif candidate.shortlisted eq 1>checked</cfif> 
										<cfif candidate.confirmationEmail eq 1> disabled</cfif>
										>
										<label class="form-check-label" for="shortlisted">
											Uži krug
										</label>
										
									</div>
									
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
			</form>
				
		</cfif>
	</div>
		
	

	
</cfoutput>
