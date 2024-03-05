<cfcomponent>

    <cfset RESPONSE = createObject('component', "../../utilis/Response")>
    <cfset STRINGS = createObject('component', "../../utilis/StringFunctions")>

    <cffunction name="daLiSuKredencijaliIspravni" access="remote" returntype="struct">
        <cfargument name="username" type="string">
        <cfargument name="password" type="string">
        
        <cfset var res = RESPONSE.create()>

        <cftry>

            <cfquery name="checkUser"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                select id, aktivan
                from korisnici 
                where korisnickoIme = '#username#'
                and lozinka  = '#password#'
            </cfquery>

            <cfif checkUser.recordCount eq 0>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Neispravni kredencijali.">
                <cfreturn res>
            </cfif>

            <cfif checkUser.aktivan eq 0>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Neaktivan korisnik.">
                <cfreturn res>
            </cfif>

            <cfset res["korisnikId"] = checkUser.id>

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom provere ispravnosti kredencijala. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>

    <cffunction name="ulogujKorisnika" access="remote" returntype="struct">
        <cfargument name="korisnikId" type="string">
        
        <cfset var res = RESPONSE.create()>

        <cftry>
            <cfquery name="updSession" datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                update sesije set datumZavrsetka = now() 
                where 1 = 1
                and id > 0
                and korisnikId = '#korisnikId#' 
                and datumZavrsetka is null
            </cfquery>

            <cfset var sigurnosniKljuc = STRINGS.generateRandomString(40)>

            <cfquery name="newSession"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                INSERT INTO `sesije`
                    (
                    `korisnikId`,
                    `datumPocetka`,
                    `datumOsvezenja`,
                    `datumZavrsetka`,
                    `sigurnosniKljuc`)
                VALUES
                    (
                    '#korisnikId#',
                    now(),
                    now(),
                    null,
                    '#sigurnosniKljuc#');
            </cfquery>

            <cfset session.korisnikId = korisnikId>
            <cfset session.sigurnosniKljuc = sigurnosniKljuc>

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom kreiranja sesije. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>

    <cffunction name="daLiJeSesijaValidna" access="remote" returntype="struct">
        
        <cfset var res = RESPONSE.create()>

        <cftry>
            
            <cfif not (structKeyExists(session, "sigurnosniKljuc") and structKeyExists(session, "korisnikId")) >
                <cfset session.isLoggedin = false>
            <cfelse>
                <cfquery name="loginCheck"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                    select sigurnosniKljuc, datumPocetka from sesije 
                    where korisnikId = '#session.korisnikId#'
                    and sigurnosniKljuc  = '#session.sigurnosniKljuc#'
                    and datumZavrsetka is null
                    and time_to_sec(timediff(now(), datumOsvezenja)) < #application.trajanjeSesije#
                </cfquery>
            
                <cfif loginCheck.recordCount eq 0>
                    <cfset session.isLoggedin = false>
                <cfelse>
                    <cfset session.isLoggedin = true>

                    <cfquery name="loginCheck"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                        update sesije 
                        set datumOsvezenja = now()
                        where korisnikId = '#session.korisnikId#'
                        and sigurnosniKljuc  = '#session.sigurnosniKljuc#'
                        and datumZavrsetka is null
                    </cfquery>
                </cfif>
            </cfif>
            
            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom kreiranja sesije. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>

    <cffunction name="izlogujKorisnika" access="remote" returntype="struct">
        
        <cfset var res = RESPONSE.create()>

        <cftry>
            <cfquery name="loginCheck"  datasource="#Application.datasource#" username="#Application.username#" password="#Application.password#">
                update sesije 
                set datumZavrsetka = now()
                where 1 = 1
                and korisnikId = '#session.korisnikId#'
                and sigurnosniKljuc  = '#session.sigurnosniKljuc#'
                and id > 0
            </cfquery>

            <cfset session.isLoggedin = false>
            <cfset session.korisnikId = ''>
            <cfset session.sigurnosniKljuc = ''>
            
            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["clientMessage"] = "Greška prilikom prijavljivanja. Kontaktirajte sa administratorom sistema.">
                <cfset var res["consoleMessage"] = "Greška prilikom kreiranja sesije. " & cfcatch.message & ' ' & cfcatch.detail>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

        <cfreturn res>
    </cffunction>
    
</cfcomponent>