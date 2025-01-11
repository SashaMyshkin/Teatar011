<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset QUERY = createObject('component', '../utilis/Query')>

    <cffunction name="getPlays" access="public" returntype="array">
        <cfquery name="q_performances" datasource="#application.datasource#">
            select 
                case
                    when 'sr-Cyrl' = '#session.lang#' then nameCyr
                    when 'sr-Latn' = '#session.lang#' then name
                    else nameEn
                end as performanceName,
                pathname,
                img,
                case
                    when 'sr-Cyrl' = '#session.lang#' then sloganCyr
                    when 'sr-Latn' = '#session.lang#' then slogan
                    else sloganEn
                end as slogan,
                alt
            from performances
            where active = 1
            order by premiereDate desc;
        </cfquery>

        <cfreturn QUERY.toArray(q_performances)>
    </cffunction>

    <cffunction name="getPlay" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset var data = structNew()>
        <cfset var data["performanceName"] = "">
        <cfset var data["slogan"] = "">
        <cfset var data["paragraphs"] = arrayNew()>
      

        <cfquery name="q_performance" datasource="#application.datasource#">
            select 
                id,
                case
                    when 'sr-Cyrl' = '#session.lang#' then nameCyr
                    when 'sr-Latn' = '#session.lang#' then name
                    else nameEn
                end as performanceName,
                case
                    when 'sr-Cyrl' = '#session.lang#' then sloganCyr
                    when 'sr-Latn' = '#session.lang#' then slogan
                    else sloganEn
                end as slogan
            from performances
            where pathname = '#identifier#'
            and active = 1;
        </cfquery>

        <cfset var data["performanceName"] = q_performance.performanceName>
        <cfset var data["slogan"] = q_performance.slogan>

        <cfquery name="q_about" datasource="#application.datasource#">
            select 
                paragraph,
                img,
                alt
            from aboutPerformances p
            inner join scripts s on s.id = p.scriptId 
            where 1 = 1
            and p.performanceId = '#q_performance.id#'
            and s.script = '#session.lang#'
        </cfquery>

        <cfset data["paragraphs"] = QUERY.toArray(q_about)>


        <cfreturn data>
    </cffunction>

    <cffunction name="getScheduledPerformance" access="public" returntype="query">
        <cfquery name="q_scheduledPerformance" datasource="#application.datasource#">
            SELECT 
                sp.id,
                `performanceId`, 
                `dateAndTime`, 
                `city`, 
                `hall`,
                cancelled
            FROM `scheduledPerformances` sp
            INNER JOIN performances p on p.id = sp.performanceId
            WHERE 1=1
                AND dateAndTime >= now()
                AND pathname = '#url.q#'
            LIMIT 1
        </cfquery>

        <cfreturn q_scheduledPerformance>
    </cffunction>

    <cffunction name="generateICSFile" access="public" returntype="void">
       

        <cfquery name="q_scheduledPerformance" datasource="#application.datasource#">
            SELECT 
                sp.id,
                p.id as performanceId,
                `performanceId`, 
                `dateAndTime`,
                DATE_ADD(DATE_ADD(dateAndTime, INTERVAL 1 HOUR), INTERVAL 35 MINUTE) as endDateTime, 
                `city`, 
                `hall`,
                cancelled,
                p.name
            FROM `scheduledPerformances` sp
            INNER JOIN performances p on p.id = sp.performanceId
            WHERE 1=1
                AND dateAndTime >= now()
                AND pathname = '#url.q#'
                AND cancelled != 1
            LIMIT 1
        </cfquery>

        <cfif q_scheduledPerformance.id neq "">
<cfoutput>
<cfsavecontent variable="icsFile">BEGIN:VCALENDAR
VERSION:2.0
PRODID:teatar011.com
CALSCALE:GREGORIAN
BEGIN:VTIMEZONE
TZID:Europe/Berlin
LAST-MODIFIED:#dateFormat(now(), "yyyyMMdd")#T#timeFormat(now(), "HHmmss")#
TZURL:https://www.tzurl.org/zoneinfo-outlook/Europe/Berlin
X-LIC-LOCATION:Europe/Berlin
BEGIN:DAYLIGHT
TZNAME:CEST
TZOFFSETFROM:+0100
TZOFFSETTO:+0200
DTSTART:19700329T020000
RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=-1SU
END:DAYLIGHT
BEGIN:STANDARD
TZNAME:CET
TZOFFSETFROM:+0200
TZOFFSETTO:+0100
DTSTART:19701025T030000
RRULE:FREQ=YEARLY;BYMONTH=10;BYDAY=-1SU
END:STANDARD
END:VTIMEZONE
BEGIN:VEVENT
DTSTAMP:#dateFormat(now(), "yyyyMMdd")#T#timeFormat(now(), "HHmmss")#
UID:#q_scheduledPerformance.id#-#url.q#-#q_scheduledPerformance.performanceId#-@teatar011.com
DTSTART;TZID=Europe/Berlin:#dateFormat(q_scheduledPerformance.dateAndTime, "yyyyMMdd")#T#timeFormat(q_scheduledPerformance.dateAndTime, "HHmmss")#
DTEND;TZID=Europe/Berlin:#dateFormat(q_scheduledPerformance.endDateTime, "yyyyMMdd")#T#timeFormat(q_scheduledPerformance.endDateTime, "HHmmss")#
SUMMARY:#q_scheduledPerformance.name# - Teatar 011
DESCRIPTION:Kartu možete kupiti preko instargam stranice https://www.instagram.com/_teatar_011/ a za više informacija o predstavi posetite https://teatar011.com/predstave/?q=#url.q#
LOCATION:#q_scheduledPerformance.hall# - #q_scheduledPerformance.city#
BEGIN:VALARM
ACTION:DISPLAY
DESCRIPTION:#q_scheduledPerformance.name# - Teatar 011
TRIGGER:-P2D
END:VALARM
END:VEVENT
END:VCALENDAR
</cfsavecontent>    

</cfoutput>
<cffile 
            action = "write" 
            file = "#ExpandPath('./ics/#url.q#.#q_scheduledPerformance.id#.ics')#" 
            output = "#icsFile#"
            charset = "UTF-8" 
            mode="644">
        </cfif>

        
    </cffunction>
</cfcomponent>