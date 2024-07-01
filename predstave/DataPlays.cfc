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
            where active = 1;
        </cfquery>

        <cfreturn QUERY.toArray(q_performances)>
    </cffunction>

    <cffunction name="getPlay" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset var data = structNew()>
        <cfset var data["performanceName"] = "">
        <cfset var data["slogan"] = "">
        <cfset data["paragraphs"] = arrayNew()>

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
</cfcomponent>