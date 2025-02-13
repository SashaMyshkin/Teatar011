<cfset auditionModel = createObject('component','../../model/audition')>

<cfif not structKeyExists(session, 'auditionId')>
    <cfset session.auditionId = "">
</cfif>

<cfif structKeyExists(form, 'auditionId')>
    <cfset session.auditionId = form.auditionId>
</cfif>

<style>
    <cfinclude template="styles.css">
</style>

<cfoutput>
    <div class="container">
        <div class="mt-3 mb-2">
            <b>Kontrolna tabla</b> &nbsp;
            <form method="POST" name="frm" id="frm" method="POST" class="d-inline-block">
                <select class="form-select form-select-sm form-select-dark" id="auditionId" name="auditionId" onchange="this.form.submit()">
                    <option value="">Audicije</option>
                    <cfloop query="#auditionModel.getAll()#">
                        <option value="#id#" <cfif session.auditionId eq id>selected</cfif>>#dateFormat(startDate, 'dd. MM. yyyy.')#</option>
                    </cfloop>
                </select>
            </form>
        </div>
        <hr>
        <cfif session.auditionId eq "">
            <p class="text-danger">Odaberite audiciju</p>
            <cfabort />
        </cfif>

        <cfset candidateModel = createObject('component','../../model/candidate')>
        <cfset candidatesQuery = candidateModel.getCandidatesByAuditionId()>

        <cfset candidatesSex = structNew()>

        <cfset candidatesConfirmed = structNew()>
        <cfset candidatesConfirmed["yes"] = 0>
        <cfset candidatesConfirmed["no"] = 0>
        <cfset candidatesAccepted = structNew()>
        <cfset candidatesAccepted["yes"] = 0>
        <cfset candidatesAccepted["no"] = 0>

        <cfloop query="#candidatesQuery#">
            <cfif not structKeyExists(candidatesSex, '#sex#')><cfset candidatesSex[sex] = 0><cfelse><cfset candidatesSex[sex] = candidatesSex[sex] + 1></cfif>
            <cfif confirmed eq 1>
                <cfset candidatesConfirmed["yes"] = candidatesConfirmed["yes"] + 1>
            <cfelse> 
                <cfset candidatesConfirmed["no"] = candidatesConfirmed["no"] + 1>
            </cfif>
            <cfif accepted eq 1>
                <cfset candidatesAccepted["yes"] = candidatesAccepted["yes"] + 1>
            <cfelse> 
                <cfset candidatesAccepted["no"] = candidatesAccepted["no"] + 1>
            </cfif>
        </cfloop>

        <p> <span class="text-primary">Ukupno kandidata:</span> <span style="color:gold">#candidatesQuery.recordcount#</span></p>

        <cfchart format="gif" title="Pol kandidata" backgroundcolor="gray" showborder="true">
            <cfchartseries type="pie">
            <cfloop collection="#candidatesSex#" item="sex" >   
                <cfchartdata item="#sex#" value="#candidatesSex[sex]#">
            </cfloop>
            </cfchartseries>
        </cfchart>

        <cfchart format="gif" title="Potvrđeni dolasci" backgroundcolor="gray" showborder="true">
            <cfchartseries type="pie">
                <cfchartdata item="Potvrđen" value="#candidatesConfirmed["yes"]#">
                <cfchartdata item="Bez odgovora" value="#candidatesConfirmed["no"]#">
            </cfchartseries>
        </cfchart>

        <cfchart format="gif" title="Primljeni/Odbijeni" backgroundcolor="gray" showborder="true">
            <cfchartseries type="pie">
                <cfchartdata item="Primljeni" value="#candidatesAccepted["yes"]#">
                <cfchartdata item="Odbijeni" value="#candidatesAccepted["no"]#">
            </cfchartseries>
        </cfchart>
    </div>
</cfoutput>
