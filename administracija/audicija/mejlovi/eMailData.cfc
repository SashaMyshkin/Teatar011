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
                            <title>Uži krug</title>
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
                                        Dan Vašeg izlaska na audiciju je 1. mart 2025. na adresi <i>Vojvode Micka Krstića 1J/3</i>.
                                        Audicija će se održati u periodu od 18.00 do 22.30č. 
                                        Međutim, kako još uvek obrađujemo pristigle prijave,
                                        javićemo Vam se sa tačnom satnicom najkasnije 24 časova pre dana audicije.
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
                                    <p style="color: ##cccccc;">&copy; #year(now())# Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Teatar 011 - uži krug audicije" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_check" datasource="#application.datasource#">
                update candidates c
                inner join audition a on a.id = c.auditionId and isOpen = 1
                set confirmationEmail = 1 where c.id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
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
                                        Vaša audicija će se održati 1. marta 2025. godine u <b>#auditionTime#</b> časova.
                                    </p>
                                    
                                    <p style="color: ##cccccc;">
                                        Radujući se skorašnjem susretu, srdačno Vas pozdravlja <br><i>Teatar 011</i>
                                    </p>
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; #year(now())# Teatar 011. All rights reserved.</p>
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

    <cffunction name="notifyAboutPerformance" access="public" returntype="void">
        <cfargument name="candidates" type="query" required="true">

        <cfloop query="#arguments.candidates#">
            <cfsavecontent variable="emailContent">
                <cfoutput>
                    <!DOCTYPE html>
                    <html lang="sr-Cyrl">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Predstava - Teatar 011</title>
                        </head>

                        <body style="font-family: Arial, sans-serif; background-color: ##000000; color: ##ffffff; margin: 0; padding: 0;">
                            <div style="width: 90%; padding: 20px;">
                                <div style="text-align: center; padding: 10px; border-bottom: 1px solid ##333333;">
                                    <h1 style="color: ##ffffff;text-align: center;"><img src="https://teatar011.com/assets/img/logo.png"
                                            style="width: 70px; border-radius:50%">
                                        <br> Poziv na predstavu
                                    </h1>
                                </div>
                                <div style="margin: 20px 0; text-align: center;">
                                    <p style="color: ##cccccc;">Poštovani,</p>
                              
                                    <p style="color: ##cccccc;">
                                        Teatar 011 želi da Vas pozove na predstavu 
                                        <a href="https://teatar011.com/predstave/?q=jednostavno-idioti" target="_blank">Jednostavno idioti</a> 
                                        koja će se održati 26. februara 2025. u 20.00 časova u Akademiji 28 u Beogradu.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        Smatramo da je ovo najbolji načan da se mi Vama predstavimo, pre nego što se Vi predstavite nama na audiciji koja će potom uslediti.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        S obzirom na to da ste prošli u uži krug kandidata i da ste potvrdili svoj dolazak na audiciju, Teatar 011 Vam odobrava popust na kartu u iznosu od 40%.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        Ukoliko dolazite, potrebno je odgovoriti na ovaj imejl sa imenom na koje biste želeli da Vam ostavimo 2 karte.
                                    </p>
                                    
                                    <p style="color: ##cccccc;">
                                        Radujući se skorašnjem susretu, srdačno Vas pozdravlja <br><i>Teatar 011</i>
                                    </p>
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; 2025 Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Poziv na predstavu" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_upd_res" datasource="#application.datasource#">
                update candidates set performanceEmail = 1 where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
    </cffunction>
 
    <cffunction name="rejecionEmail" access="public" returntype="void">
        <cfargument name="candidates" type="query" required="true">

        <cfloop query="#arguments.candidates#">
            <cfsavecontent variable="emailContent">
                <cfoutput>
                    <!DOCTYPE html>
                    <html lang="sr-Cyrl">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Rezultati audicije - Teatar 011</title>
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
                                       Iako ste pokazali spremnost, želju za radom i glumački potencijal, moramo Vas obavestiti da, nažalost, niste primljeni u Teatar 011.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        Ovo je bila jedna sjajna audicija, sa puno kvalitetnih kandidata i dugo smo razmatrali ko bi mogao da postane naš član. No, kako je broj mesta ograničen, nismo mogli da primimo sve one koje smo hteli.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        Nikako se nemojte obeshrabriti zbog ovoga! Pratite našu Instagram stranicu gde će biti informacija o narednim audicijama i slobodno nam dođite ponovo. Bilo je situacija kada su pojedini kandidati i po nekoliko puta izlazili na audiciju, dok na kraju nisu postali naši članovi, a zatim, pokazali vanredne uspehe na sceni.
                                    </p>
                                    
                                    <p style="color: ##cccccc;">
                                       Gonite svoje glumačke snove, <br>Vaš <i>Teatar 011</i>
                                    </p>
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; #year(now())# Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Rezultati audicije - Teatar 011" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_upd_res" datasource="#application.datasource#">
                update candidates set resultsEmail = 1 where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
    </cffunction>

    <cffunction name="acceptanceEmail" access="public" returntype="void">
        <cfargument name="candidates" type="query" required="true">

        <cfloop query="#arguments.candidates#">
            <cfsavecontent variable="emailContent">
                <cfoutput>
                    <!DOCTYPE html>
                    <html lang="sr-Cyrl">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Rezultati audicije - Teatar 011</title>
                        </head>

                        <body style="font-family: Arial, sans-serif; background-color: ##000000; color: ##ffffff; margin: 0; padding: 0;">
                            <div style="width: 90%; padding: 20px;">
                                <div style="text-align: center; padding: 10px; border-bottom: 1px solid ##333333;">
                                    <h1 style="color: ##ffffff;text-align: center;"><img src="https://teatar011.com/assets/img/logo.png"
                                            style="width: 70px; border-radius:50%">
                                        <br> Čestitamo!
                                    </h1>
                                </div>
                                <div style="margin: 20px 0; text-align: center;">
                                    <p style="color: ##cccccc;">Poštovani,</p>
                              
                                    <p style="color: ##cccccc;">
                                       Sa radošću Vas obaveštavamo da ste primljeni u Teatar 011. Prepoznali smo u Vama talenat koji bi obogatio našu zajednicu i potencijal da zaigrate sa nama na daskama koje život znače.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        U sredu 5. marta u 19.00 časova biće organizovan upis u teatar. Tom prilikom je potrebno doneti članarinu u iznosu od 3.500,00 dinara, a mi ćemo Vam dati pristupnicu kojom i formalno postajete naš član. Takođe, biće reči o planu za predstojeći period i programu rada.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        U nastavku će biti održane vežbe. Molimo Vas samo da ponesete svoju obuću za prostorije teatra koje ćete koristiti dok ste u prostorijama. Obuću možete nositi sa sobom svaki put kada dolazite u teatar, mada većina naših članova preferira da je ostavi u prostorijama.
                                    </p>

                                    <p style="color: ##cccccc;">
                                        Molimo Vas da svoj dolazak potvrdite odgovorom na ovaj imejl ili nam blagovremeno javite ukoliko ste sprečeni da dođete na upis.
                                    </p>
                                    
                                    <p style="color: ##cccccc;">
                                       S nestrpljenjem očekujući da se bliže upoznamo, <br>Vaš <i>Teatar 011</i>
                                    </p>
    
                                </div>
                                <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                                    <p style="color: ##cccccc;">&copy; #year(now())# Teatar 011. All rights reserved.</p>
                                </div>
                            </div>
                        </body>
                    </html>
                </cfoutput>
                
            </cfsavecontent>

            <cfmail to="#email#" 
                    from="info@teatar011.com" 
                    subject="Rezultati audicije - Teatar 011" type="text/html">
                #emailcontent#
            </cfmail>

            <cfquery name="q_upd_accepted" datasource="#application.datasource#">
                update candidates set resultsEmail = 1 where id = <cfqueryparam value="#id#" cfsqltype="cf_sql_varchar">
            </cfquery>
        </cfloop>
    </cffunction>
</cfcomponent>