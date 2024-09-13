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
    <cfset shortlisted_unnotified = DATA.getShortlistedUnnotified()>
    <cfset MNG_EMAIL.notifyShortlisted(shortlisted_unnotified)>
    <p class="mt-3 text-center">
        Uspešno su poslati mejlovi o potvrdi dolaska kandidatima koji u ušli u uži krug, kao i utešni mejlovi kandidatima koji nisu odabrani za audiciju.
    </p>
</cfif>


