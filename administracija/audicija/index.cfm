<cfparam name="url.part" default="edt">
<cfparam name="url.auditionId" default="">
<cfparam name="form.isOpen" default="0">

<cfset auditionModel = createObject('component', '../model/audition')>
<cfset auditionController = createObject('component', '../controller/audition')>

<cfif url.part eq "del">
    <cfoutput>
        <cfset response = auditionController.deleteAudition()>

        <cfif response.error>
            <script>
                alert(`#response.message#`)
            </script>
            <cfabort>
        </cfif>

        <script>
            const parentURL = new URL(parent.location.href);
            parentURL.searchParams.set('part', 'lst');
            parent.location.href = parentURL.href;
        </script>
    </cfoutput>  
</cfif>

<cfif url.part eq "end">
    <cfoutput>
        <cfset response = auditionController.endAudition()>

        <cfif response.error>
            <script>
                alert(`#response.message#`)
            </script>
            <cfabort>
        </cfif>

        <script>
            const parentURL = new URL(parent.location.href);
            parentURL.searchParams.set('auditionId', '#url.auditionId#');
            parentURL.searchParams.set('part', 'edt');
            parent.location.href = parentURL.href;
        </script>
    </cfoutput>  
</cfif>

<cfif url.part eq "mng">
    <cfoutput>
        <cfset response = auditionController.mngAudition()>

        <cfif response.error>
            <script>
                alert(`#response.message#`);
            </script>
            <cfabort>
        </cfif>

        <script>
            alert(`#response.message#`);
            const parentURL = new URL(parent.location.href);
            parentURL.searchParams.set('auditionId', '#response.auditionId#');
            parentURL.searchParams.set('part', 'edt');
            parent.location.href = parentURL.href;
        </script>
    </cfoutput>  
</cfif>

<cfif url.part eq "edt">

    <cfset auditionTypes = createObject('component', '../model/auditionType').selectAuditionTypes()>
    <cfset presentationTypes = createObject('component', '../model/presentationType').selectPresentationTypes()>
    <cfset auditionDetails = auditionModel.selectAudition(url.auditionId)>

    <cfoutput>
        <div class="container">
            <p class="mt-3 mb-2">
                <cfif url.auditionId eq "">
                    <b>Nova audicija</b>
                <cfelse>
                    <b>Audicija br. #auditionDetails.uniqueKey#: </b>
                    <cfif auditionDetails.isOpen eq 0 and auditionDetails.finished eq "">
                        <span style="color:yellow">U pripremi</span>
                    </cfif>
                    <cfif auditionDetails.finished eq 1 and  auditionDetails.isOpen eq 0>
                        <span style="color:green">Završena</span>
                    </cfif>
                    <cfif auditionDetails.isOpen eq 1>
                        <span style="color:blue">Aktivna</span>
                    </cfif>
                </cfif>
            </p>
            <hr>
    
            <form method="POST" name="edtForm" id="edtForm">
                <input type="hidden" value="#url.auditionId#">

                <div class="row g-3 justify-content-center">
                    <div class="col-md-2">
                        <label for="uniqueKey" class="form-label">Šifra audicije</label>
                        <input id="uniqueKey" name="uniqueKey" value="#auditionDetails.uniqueKey#" disabled 
                        type="text" class="form-control form-control-sm form-control-dark">
                    </div>
                    <div class="col-md-2">
                        <label for="startDate" class="form-label">Datum početka</label>
                        <input id="startDate" name="startDate" value="#dateformat(auditionDetails.startDate, 'yyyy-mm-dd')#" 
                        min="#dateformat(now() + 1, 'yyyy-mm-dd')#" type="date" class="form-control form-control-sm form-control-dark"
                        <cfif auditionDetails.finished eq "1">disabled</cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="endDate" class="form-label">Datum završetka</label>
                        <input id="endDate" name="endDate" value="#dateformat(auditionDetails.endDate, 'yyyy-mm-dd')#" 
                        min="#dateformat(now() + 2, 'yyyy-mm-dd')#" type="date" class="form-control form-control-sm form-control-dark"
                        <cfif auditionDetails.finished eq "1">disabled</cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="auditionTime" class="form-label">Okvirno vreme</label>
                        <input id="auditionTime" name="auditionTime" value="#timeformat(auditionDetails.auditionTime, 'HH:mm:ss')#" 
                        type="time" class="form-control form-control-sm form-control-dark"
                        <cfif auditionDetails.finished eq "1">disabled</cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="auditionType" class="form-label">Tip audicije</label>
                        <select class="form-select form-select-sm form-select-dark text-dark" id="auditionType" name="auditionType" <cfif auditionDetails.finished eq "1">disabled</cfif>>
                            <cfloop query="#auditionTypes#">
                                <option value="#id#" <cfif id eq auditionDetails.auditionTypeId>selected</cfif> class="text-dark">#type#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label for="presentationType" class="form-label">Tip prezentacije</label>
                        <select class="form-select form-select-sm form-select-dark text-dark" id="presentationType" name="presentationType" <cfif auditionDetails.finished eq "1">disabled</cfif>>
                            <cfloop query="#presentationTypes#">
                                <option value="#id#" <cfif id eq auditionDetails.presentationTypeId>selected</cfif> class="text-dark">#type#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label for="enrollmentDateTime" class="form-label">Datum i vreme upisa</label>
                        <input id="enrollmentDateTime" name="enrollmentDateTime" value="#dateformat(auditionDetails.enrollmentDateTime, 'yyyy-mm-dd')#T#timeformat(auditionDetails.enrollmentDateTime, 'HH:mm:ss')#" 
                        type="datetime-local" class="form-control form-control-sm form-control-dark"
                        <cfif auditionDetails.finished eq "1">disabled</cfif>>
                    </div>
                    <div class="col-md-2">
                        <label for="membershipFee" class="form-label">Članarina</label>
                        <input id="membershipFee" name="membershipFee" value="#auditionDetails.membershipFee#" 
                        type="number" class="form-control form-control-sm form-control-dark"
                        <cfif auditionDetails.finished eq "1">disabled</cfif>>
                    </div>

                    <cfif auditionDetails.finished neq "1">
                        <hr>
                        <div class="col-md-2">
                            <div class="form-check">
                                <input id="isOpen" name="isOpen" class="form-check-input" type="checkbox" value="1"
                                <cfif auditionDetails.isOpen eq 1>checked  </cfif>> 
                                <label class="form-check-label" for="shortlisted">
                                    Objavljena na sajtu
                                </label>
                            </div>
                        </div>
                        <hr>
                        <div class="col-md-1">
                            <button type="button" onclick="takeAnAction(this.form, 'mng')" class="btn btn-sm btn-primary d-block">Sačuvaj</button>
                        </div>
                        <div class="col-md-1">
                            <button type="button" onclick="takeAnAction(this.form, 'end')" class="btn btn-sm btn-danger d-block" <cfif auditionDetails.isOpen eq "0">disabled</cfif>>Završi</button>
                        </div>
                        <div class="col-md-1">
                            <button type="button" onclick="takeAnAction(this.form, 'del')" class="btn btn-sm btn-danger d-block" <cfif auditionDetails.isOpen eq 1> disabled </cfif> >Obriši</button>
                        </div>
                    </cfif> 
                </div>
            </form>
        </div>

        <script>
            function takeAnAction(form, action) {

                if(action === 'end'){
                    const ok = confirm('Ukoliko audiciju označite kao završenom, više nećete biti u mogućnosti da je ponovo objavite');

                    if(!ok)
                        return;
                }

                const url = new URL(location.href);
                url.searchParams.set('part', action);
                url.searchParams.set('auditionId', '#url.auditionId#');
                form.action = url.href;
                form.target = "G2";
                form.submit();
            }
        </script>

        
    </cfoutput>
</cfif>

<cfif url.part eq "lst">
    <cfoutput>
        

        <cfset auditions = auditionModel.getAll()>

        

        <div class="container">
            <p class="mt-3 mb-2"><b>Spisak audicija</b></p>
            <hr>
            <table class="table table-sm table-dark table-striped table-hover caption-top">
                <caption class="text-light">Ukupno: #auditions.recordcount#<caption>
                <thead>
                    <tr class="text-center">
                        <th scope="col">##</th>
                        <th scope="col">Šifra</th>
                        <th scope="col">Datum</th>
                        <th scope="col">Tip audicije</th>
                        <th scope="col">Tip prezentacije</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <cfset count = 1>
                    <cfloop query="#auditions#">
                        <cfset styles = "">
                        <cfif isOpen eq 1>
                            <cfset styles = "color: green;">
                        <cfelseif isOpen eq 0 and finished eq "">
                            <cfset styles = "color: red;">
                        </cfif>
                        <tr class="text-center" style="cursor:pointer;" onclick="location.href='#request.scriptName#?part=edt&auditionId=#id#'">
                            <td>#count#.</td>
                            <td>#uniqueKey#</td>
                            <td>#dateFormat(startDate, 'dd. mm. yyyy')#<cfif endDate neq ""> - #dateFormat(endDate, 'dd. mm. yyyy')#</cfif></td>
                            <td>#auditionType#</td>
                            <td>#presentationType#</td>
                            <td>
                                <cfif isOpen eq 0 and finished eq "">
                                    <span style="color:yellow">U pripremi</span>
                                </cfif>
                                <cfif finished eq 1 and  isOpen eq 0>
                                    <span style="color:green">Završena</span>
                                </cfif>
                                <cfif isOpen eq 1>
                                    <span style="color:blue">Aktivna</span>
                                </cfif>
                            </td>
                        </tr>
                        <cfset count = count + 1>
                    </cfloop>
                </tbody>
            </table>
        </div>
    </cfoutput> 
</cfif>
        
<iframe name="G2" id="G2" src="" height="0" width="0"></iframe>   
