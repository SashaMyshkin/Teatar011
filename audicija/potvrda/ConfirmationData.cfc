<cfcomponent>
    <cffunction name="checkCandidate" access="public" returntype="query">
        <cfargument name="uq" type="string" required="true">

        <cfquery name="q_check" datasource="#application.datasource#">
            select c.id, confirmed, name, surname
            from candidates c
            inner join audition a on a.id = c.auditionId and isOpen = 1
            where c.uniqueKey = <cfqueryparam value="#arguments.uq#" cfsqltype="cf_sql_varchar">
        </cfquery>

        <cfreturn q_check>
    </cffunction>

    <cffunction name="confirm" access="public" returntype="void">
        <cfargument name="uq" type="string" required="true">
        <cfargument name="theWay" type="string" required="true">

        <cfquery name="q_confirm" datasource="#application.datasource#">
            update candidates c 
            inner join audition a on a.id = c.auditionId and isOpen = 1
            set c.confirmed = 1,
            c.theWay = <cfqueryparam value="#arguments.theWay#" cfsqltype="cf_sql_varchar">
            where c.uniqueKey = <cfqueryparam value="#arguments.uq#" cfsqltype="cf_sql_varchar">
            and c.id >= 0
        </cfquery>

    </cffunction>

    <cffunction name="notifyMe" access="public" returntype="void">
        <cfargument name="name" type="string" required="true">
        <cfargument name="surname" type="string" required="true">
        <cfargument name="theWay" type="string" required="true">

        <cfquery name="q_rpt_count" datasource="#application.datasource#">
            select 
                case
                    when confirmed = 1 then 'podvrdili dolazak'
                    else 'preostali'
                end _status_,
                count(confirmed) broj
            from candidates c 
            inner join audition a on a.id = c.auditionId and isOpen = 1
            where shortlisted = 1
            group by confirmed;
        </cfquery>

        <cfquery name="q_rpt_the_way" datasource="#application.datasource#">
            select 
                case
                    when theWay = 'ja' then 'svoj program imaju'
                    else 'naše improvizacije'
                end _status_,
                count(theWay) broj
            from candidates c 
            inner join audition a on a.id = c.auditionId and isOpen = 1
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
                        Kandidat #name# #surname# potrdio dolazak
                        <cfif arguments.theWay eq "ja">
                            i želi da se predstavi svojim programom.
                        <cfelse>
                            i želi da bude sproveden kroz naš program improvizacija.
                        </cfif>

                        <hr>

                        <table style="width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; color: ##333; border: 1px solid ##dddddd;">
                            <caption style="font-size: 1.2em; font-weight: bold; padding: 10px; color: ##555;">
                              Odnos potvrđenih / nepotvrđenih dolazaka
                            </caption>
                            <tr style="background-color: ##f4f4f4;">
                                <td style="border: 1px solid ##dddddd; padding: 8px; font-weight: bold;">
                                    Status
                                </td>
                                <td style="border: 1px solid ##dddddd; padding: 8px; font-weight: bold;">
                                    Broj kandidata
                                </td>
                            </tr>

                            <cfloop query="q_rpt_count">
                                <tr>
                                    <td style="border: 1px solid ##dddddd; padding: 8px;">
                                        #_status_#
                                    </td>
                                    <td style="border: 1px solid ##dddddd; padding: 8px;">
                                        #broj#
                                    </td>
                                </tr>
                            </cfloop>
                            
                        </table>
                          
                        <hr>

                        <table style="width: 100%; border-collapse: collapse; font-family: Arial, sans-serif; color: ##333; border: 1px solid ##dddddd;">
                            <caption style="font-size: 1.2em; font-weight: bold; padding: 10px; color: ##555;">
                                Svoj program / naši zadaci
                            </caption>
                            <tr style="background-color: ##f4f4f4;">
                                <td style="border: 1px solid ##dddddd; padding: 8px; font-weight: bold;">
                                    Status
                                </td>
                                <td style="border: 1px solid ##dddddd; padding: 8px; font-weight: bold;">
                                    Broj kandidata
                                </td>
                            </tr>

                            <cfloop query="q_rpt_the_way">
                                <tr>
                                    <td style="border: 1px solid ##dddddd; padding: 8px;">
                                        #_status_#
                                    </td>
                                    <td style="border: 1px solid ##dddddd; padding: 8px;">
                                        #broj#
                                    </td>
                                </tr>
                            </cfloop>
                            
                        </table>
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