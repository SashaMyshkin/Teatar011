<cfcomponent>

    <cffunction name="notifyShortlisted" access="public" returntype="void">
        <cfargument name="candidates" type="query" required="true">

        <cfloop query="#arguments.candidates#">
            <cfsavecontent variable="emailContent">
                <cfoutput>
                    <!DOCTYPE html>
                    <html lang="sr-Cyrl">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Uži krug - septembarska audicija</title>
                        </head>

                        <body style="font-family: Arial, sans-serif; background-color: ##000000; color: ##ffffff; margin: 0; padding: 0;">
                            <div style="width: 90%; padding: 20px;">
                                <div style="text-align: center; padding: 10px; border-bottom: 1px solid ##333333;">
                                    <h1 style="color: ##ffffff;text-align: center;"><img src="https://teatar011.com/assets/img/logo.png"
                                            style="width: 70px; border-radius:50%">
                                        <br> Obaveštenje
                                    </h1>
                                </div>
                                <div style="margin: 20px 0; text-align: center;">
                                    <p style="color: ##cccccc;">Poštovani,</p>
                                    <p style="color: ##cccccc;">Obaveštavamo vas da ste ušli u uži izbor kandidata. </p>
                                    <p style="color: ##cccccc;">
                                        Dan Vašeg izlaska na audiciju je 17. septembar 2024. na adresi <i>Vojvode Micka Krstića 1J/3</i>.
                                        Audicija će se održati u periodu od 19.00 do 22.30č. 
                                        Međutim, kako još uvek obrađujemo pristigle prijave,
                                        javićemo Vam se sa tačnom satnicom najkasnije do ponedeljka u 20.00 časova.
                                    </p>
                                    <p style="color: ##cccccc;"> 
                                        Za sada Vas molimo da klikom na ovo dugme potvrdite svoj dolazak. <br><br>
                                        <a href="https://www.teatar011.com/audicija/potvrda/?uq=#uniqueKey#" 
                                           style="background-color: ##4CAF50; color: white; padding: 10px 20px; text-align: center; text-decoration: none; display: inline-block; border-radius: 5px; font-weight: bold;">
                                           POTVRDA DOLASKA
                                        </a>
                                    </p>
                                    <p style="color: ##cccccc;"> Ukoliko imate bilo kakvih dodatnih pitanja, 
                                        možete nam pisati na Instagram stranici
                                        <a href="https://www.instagram.com/_teatar_011/">@_teatar_011</a>, 
                                        Fejsbuk stranici <a href="https://www.facebook.com/Teatar011/"> Teatar011</a>, 
                                        ili nam se obratiti mejlom na <a href="mailto:info@teatar011.com">info@teatar011.com</a>.
                                    </p> 
                                    <p style="color: ##cccccc;">
                                    Radujući se skorašnjem susretu, srdačno Vas pozdravlja <br><i>Teatar 011</i>
                                    </p>
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; 2024 Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Teatar 011 - uži krug septembarske audicije" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_check" datasource="#application.datasource#">
                update candidates set confirmationEmail = 1 where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
    </cffunction>

    <cffunction name="notifyCandidatesAboutTime" access="public" returntype="void">
        <cfargument name="candidates" type="query" required="true">

        <cfloop query="#arguments.candidates#">
            <cfsavecontent variable="emailContent">
                <cfoutput>
                    <!DOCTYPE html>
                    <html lang="sr-Cyrl">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Satnica audicije - Teatar 011</title>
                        </head>

                        <body style="font-family: Arial, sans-serif; background-color: ##000000; color: ##ffffff; margin: 0; padding: 0;">
                            <div style="width: 90%; padding: 20px;">
                                <div style="text-align: center; padding: 10px; border-bottom: 1px solid ##333333;">
                                    <h1 style="color: ##ffffff;text-align: center;"><img src="https://teatar011.com/assets/img/logo.png"
                                            style="width: 70px; border-radius:50%">
                                        <br> Obaveštenje
                                    </h1>
                                </div>
                                <div style="margin: 20px 0; text-align: center;">
                                    <p style="color: ##cccccc;">Poštovani,</p>
                              
                                    <p style="color: ##cccccc;">
                                        Vaša audicija će se održati 17. septembra 2024. godine u <b>#auditionTime#</b> časova.
                                    </p>
                                    
                                    <p style="color: ##cccccc;">
                                        Radujući se skorašnjem susretu, srdačno Vas pozdravlja <br><i>Teatar 011</i>
                                    </p>
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; 2024 Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Satnica audicije - Teatar 011" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_check" datasource="#application.datasource#">
                update candidates set timeEmail = 1 where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
    </cffunction>
 
</cfcomponent>