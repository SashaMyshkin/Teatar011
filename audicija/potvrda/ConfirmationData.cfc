<cfcomponent>
    <cffunction name="checkCandidate" access="public" returntype="query">
        <cfargument name="uq" type="string" required="true">

        <cfquery name="q_check" datasource="#application.datasource#">
            select id, confirmed, name, surname
            from candidates 
            where uniqueKey = <cfqueryparam value="#arguments.uq#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfreturn q_check>
    </cffunction>

    <cffunction name="confirm" access="public" returntype="void">
        <cfargument name="uq" type="string" required="true">
        <cfargument name="theWay" type="string" required="true">

        <cfquery name="q_confirm" datasource="#application.datasource#">
            update candidates 
            set confirmed = 1,
            theWay = <cfqueryparam value="#arguments.theWay#" cfsqltype="cf_sql_varchar">
            where uniqueKey = <cfqueryparam value="#arguments.uq#" cfsqltype="cf_sql_varchar">
            and id >= 0
        </cfquery>

    </cffunction>

    <cffunction name="notifyMe" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="surname" type="string" required="true">
        <cfargument name="theWay" type="string" required="true">

        <cfquery name="q_rpt_count" datasource="#application.datasource#">
            select 
                case
                    when confirmed = 1 then 'potvrdili_dolazak'
                    else 'preostalo'
                end _status_,
                count(confirmed) broj
            from candidates
            group by confirmed
        </cfquery>

        <cfquery name="q_rpt_the_way" datasource="#application.datasource#">
            select 
                case
                    when theWay = 'ja' then 'svoj_program'
                    else 'nase_improvizacije'
                end _status_,
                count(theWay) broj
            from candidates
            where confirmed = 1
            group by theWay
        </cfquery>

        <cfsavecontent variable="emailcontent">
            <cfoutput>
                <!DOCTYPE html>
                <html lang="sr-Latn">
    
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Potvrda</title>
                    </head>
                    <body>
                        Kandidat #name# #surname# potrdio dolazak.
                        <cfif arguments.theWay eq "ja">
                            i želi da se predstavi svojim programom.
                        <cfelse>
                            i želi da bude sproveden kroz naš program improvizacija.
                        </cfif>
                        <hr>
                        <cfdump var="#q_rpt_count#">
                        <hr>
                        <cfdump var="#q_rpt_the_way#">
                    </body>
                </html>
            </cfoutput>
        </cfsavecontent>

        <cfmail to="uprava@teatar011.com" 
                    from="info@teatar011.com" 
                    subject="Potvrda dolaska - #name# #surname#" type="text/html">
           #emailcontent#
        </cfmail>

        <cfmail to="n.pakljanac@gmail.com" 
                    from="info@teatar011.com" 
                    subject="Potvrda dolaska - #name# #surname#" type="text/html">
            #emailcontent#
        </cfmail>
    </cffunction>
</cfcomponent>