<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset QUERY = createObject('component', '../utilis/Query')>
    <cfset VALIDATION = createObject('component', 'DataValidationAudition')>
    <cfset RESPONSE = createObject('component', '../utilis/Response')>

    <cffunction name="getAuditionId" access="public" returntype="number">
        <cfquery name="q_audition" datasource="#application.datasource#">
            SELECT `id`
            FROM `audition` 
            WHERE 1=1
            AND isOpen = 1
            LIMIT 1
        </cfquery>

        <cfreturn q_audition.id>
    </cffunction>

    <cffunction name="howHeardAboutUs" access="public" returntype="array">
        <cfquery name="q_howHeardAboutUs" datasource="#application.datasource#">
            select 
                id,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then wayCyr
                    when 'sr-Latn' = '#session.defaultScript#' then way
                    else wayEn
                end as way
            from howHeardAboutUs
            where active = 1;
        </cfquery>

        <cfreturn QUERY.toArray(q_howHeardAboutUs)>
    </cffunction>

    <cffunction name="getSex" access="public" returntype="array">
        <cfquery name="q_sex" datasource="#application.datasource#">
            select 
                id,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then sexCyr
                    when 'sr-Latn' = '#session.defaultScript#' then sex
                    else sexEn
                end as sex
            from sex
            where active = 1;
        </cfquery>

        <cfreturn QUERY.toArray(q_sex)>
    </cffunction>

    <cffunction name="insertApplication" access="public" returntype="struct">
        <cfargument name="data" type="struct" required="true">

        <cfset var res = RESPONSE.ResponseNew()>

        <cftransaction action="BEGIN">
            <cftry>
                <cfquery name="q_insert_candidates" result="r_insert_candidates" datasource="#application.datasource#">
                    INSERT INTO `candidates` (
                        `auditionId`, 
                        `name`, 
                        `surname`, 
                        `dateOfBirth`, 
                        `email`, 
                        `howHeardAboutUsId`, 
                        `haveYouWatched`, 
                        `whatYouWatched`, 
                        `sexId`, 
                        `biography`
                    ) 
                    VALUES (
                        '#trim(data.auditionId)#',
                        '#trim(data.name)#',
                        '#trim(data.surname)#',
                        '#trim(data.dateOfBirth)#',
                        '#trim(data.email)#',
                        '#trim(data.howHeardAboutUsId)#',
                        '#trim(data.haveYouWatched)#',
                        '#trim(data.whatYouWatched)#',
                        '#trim(data.sexId)#',
                        '#trim(data.biography)#' 
                    );
                </cfquery>
    
                <cfset var res["generatedKey"] = r_insert_candidates.generatedKey>
    
                <cfcatch>
                    <cftransaction action="ROLLBACK"/>
                    <cfset var res["error"] = true>
                    <cfset var res["clientMessage"] = "#txtError#">
                    <cfset var res["consoleMessage"] = "#cfcatch.message# #cfcatch.detail#">
                    <cfset var res["cfcatch"] = cfcatch>
                    <cfset var res["data"] = data>
                </cfcatch>
            </cftry>
        </cftransaction>

        <cfreturn res>

    </cffunction>

    <cffunction name="manageApplication" access="public" returntype="struct">
        <cfargument name="data" type="struct" required="true">

        <cfset var res = RESPONSE.ResponseNew()>
        <cfset var res["clientMessage"] = "#txtSuccess#">

        <cfset val = VALIDATION.validateData(data)>

        <cfif val["error"]>
            <cfreturn val>
        </cfif>

        <cfset mng = this.insertApplication(data)>

        <cfif mng["error"]>
            <cfreturn mng>
        </cfif>

        <cfset this.sendAnEmail(data.email)>

        <cfreturn res>

    </cffunction>

    <cffunction name="sendAnEmail" access="public">
        <cfargument name="email" type="string" required="true">
        

        <cfmail to="#email#"
        from="info@teatar011.com"
        subject="Аудиција - Театар 011"
        type="text/html">

        <!DOCTYPE html>
            <html lang="sr-Cyrl">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Пријава за аудицију</title>
            </head>

            <body style="font-family: Arial, sans-serif; background-color: ##000000; color: ##ffffff; margin: 0; padding: 0;">
                <div style="width: 90%; padding: 20px;">
                    <div style="text-align: center; padding: 10px; border-bottom: 1px solid ##333333;">
                        <h1 style="color: ##ffffff;text-align: center;"><img src="https://teatar011.com/assets/img/logo.png"
                                style="width: 70px; border-radius:50%">
                            <br>Аудиција за #this.GetSerbianCyrillicMonthName(month(now()))# #DateFormat(now(), "yyyy")#.
                        </h1>
                    </div>
                    <div style="margin: 20px 0; text-align: center;">
                        <p style="color: ##cccccc;">Поштовани,</p>
                        <p style="color: ##cccccc;">Ваша пријава је успешно забележена.</p>
                        <p style="color: ##cccccc;">Наш тим је тренутно у процесу селекције кандидата и ускоро ћемо Вам се јавити са
                            више детаља и даљим корацима.</p>
                        <p style="color: ##cccccc;">Срдачан поздрав, <br><i>Театар 011</i></p>
                    </div>
                    <div style="text-align: center; padding: 10px; border-top: 1px solid ##333333; font-size: 12px;">
                        <p style="color: ##cccccc;">&copy; 2024 Театар 011. All rights reserved.</p>
                    </div>
                </div>
            </body>

            </html>

        
        
        </cfmail>

    </cffunction>

    <cffunction name="GetSerbianCyrillicMonthName" returntype="string">
        <cfargument name="inputMonth" type="date" required="true">
    
        <!--- Extract the month number from the input date --->
        <cfset var monthName = "">
    
        <!--- Determine the month name based on the month number --->
        <cfswitch expression="#inputMonth#">
            <cfcase value="1"> <cfset monthName = "јануар"> </cfcase>
            <cfcase value="2"> <cfset monthName = "фебруар"> </cfcase>
            <cfcase value="3"> <cfset monthName = "март"> </cfcase>
            <cfcase value="4"> <cfset monthName = "април"> </cfcase>
            <cfcase value="5"> <cfset monthName = "мај"> </cfcase>
            <cfcase value="6"> <cfset monthName = "јун"> </cfcase>
            <cfcase value="7"> <cfset monthName = "јул"> </cfcase>
            <cfcase value="8"> <cfset monthName = "август"> </cfcase>
            <cfcase value="9"> <cfset monthName = "септембар"> </cfcase>
            <cfcase value="10"> <cfset monthName = "октобар"> </cfcase>
            <cfcase value="11"> <cfset monthName = "новембар"> </cfcase>
            <cfcase value="12"> <cfset monthName = "децембар"> </cfcase>
            <cfdefaultcase> <cfset monthName = ""> </cfdefaultcase>
        </cfswitch>
    
        <cfreturn monthName>
    </cffunction>
    
</cfcomponent>