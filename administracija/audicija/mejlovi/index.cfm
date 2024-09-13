<cfparam name="url.action" default="">
<cfset DATA = createObject('component','../auditionData')>
<cfset MNG_EMAIL = createObject('component','eMailData')>

<cfoutput>
    <p class="mt-3 text-center">
        <button class="btn btn-warning btn-lg" onclick="location.href='#request.scriptName#?action=uzi-krug'"> Obavesti kandidate o odlukama za uži krug. </button>
    
        <button class="btn btn-primary btn-lg" onclick="location.href='#request.scriptName#?action=satnica'"> Obavesti kandidate o satnici dolaska. </button>
    
        <button class="btn btn-success btn-lg" onclick="location.href='#request.scriptName#?action=rezultati'"> Obavesti kandidate o rezultatima audicije. </button>
    </p>
</cfoutput>

<cfif url.action eq "uzi-krug">
    <cfset shortlisted_unnotified_1 = DATA.getShortlistedUnnotified()>
    <cfdump var="#shortlisted_unnotified_1#">
    <cfset MNG_EMAIL.notifyShortlisted(shortlisted_unnotified_1)>
    <cfset shortlisted_unnotified_2 = DATA.getShortlistedUnnotified()>
    <cfdump var="#shortlisted_unnotified_2#">
</cfif>


