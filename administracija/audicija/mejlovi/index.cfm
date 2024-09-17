<cfparam name="url.action" default="">
<cfset DATA = createObject('component','../auditionData')>
<cfset MNG_EMAIL = createObject('component','eMailData')>

<cfoutput>
    <p class="mt-3 text-center">
        <button class="btn btn-warning btn-lg" onclick="location.href='#request.scriptName#?action=uzi-krug'"> Obavesti kandidate o odlukama za uži krug. </button>
    
        <button class="btn btn-primary btn-lg" onclick="location.href='#request.scriptName#?action=satnica'"> Obavesti kandidate o satnici dolaska. </button>
    
        <button class="btn btn-success btn-lg" onclick="location.href='#request.scriptName#?action=rezultati'"> Obavesti kandidate o rezultatima audicije. </button>
    </p>


    <cfif url.action eq "uzi-krug">
        <cfset shortlisted_unnotified = DATA.getShortlistedUnnotified()>
        <cfset MNG_EMAIL.notifyShortlisted(shortlisted_unnotified)>
        <p class="mt-3 text-center">
            Ukupno obaveštenih kandidata: #shortlisted_unnotified.recordcount#;
        </p>
    </cfif>

    <cfif url.action eq "satnica">
        <cfset confirmed = DATA.getConfirmedUnnotifiedCandidates()>
        <cfset MNG_EMAIL.notifyCandidatesAboutTime(confirmed)>
        <p class="mt-3 text-center">
            Ukupno obaveštenih kandidata: #confirmed.recordcount#;
        </p>
    </cfif>

    <cfif url.action eq "rezultati">
        <cfset rejected = DATA.getRejected()>
        <cfset accepted = DATA.getAccepted()>
        <cfset MNG_EMAIL.rejecionEmail(rejected)>
        <cfset MNG_EMAIL.acceptanceEmail(accepted)>

        <cfdump var="#rejected#">
        <cfdump var="#accepted#">
        <p class="mt-3 text-center">
            Ukupno obaveštenih kandidata: #rejected.recordcount + accepted.recordcount#;
        </p>
    </cfif>

</cfoutput>


