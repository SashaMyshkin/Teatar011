<cfcomponent>

    <cfset QUERY = createObject('component', 'utilis/Query')>

    <cffunction name="getMetaTags" access="public" returntype="struct">
        <cfargument name="identifier" type="string" required="true">

        <cfset var data = structNew()>
        <cfset var data["title"] = "">
        <cfset var data["description"] = "">
        <cfset var data["keywords"] = "">

        <cfquery name="q_metaTags" datasource="#application.datasource#">
            select 
                title, description, keywords
            from metaTags
            where pathname = '#identifier#'
        </cfquery>

        <cfset var data["title"] = q_metaTags.title>
        <cfset var data["description"] = q_metaTags.description>
        <cfset var data["keywords"] = q_metaTags.keywords>

        <cfreturn data>

    </cffunction>

    <cffunction name="getAnnouncements" access="public" returntype="array">
        <cfquery name="q_announcements" datasource="#application.datasource#">
            select 
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then p.nameCyr
                    when 'sr-Latn' = '#session.defaultScript#' then p.name
                    else p.nameEn
                end as performanceName,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then p.sloganCyr
                    when 'sr-Latn' = '#session.defaultScript#' then p.slogan
                    else p.sloganEn
                end as slogan,
                DATE_FORMAT(a.dateAndTime, '%d.%m.%Y.') eventDate,
                DATE_FORMAT(a.dateAndTime, '%H.%i') eventTime,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then a.noteCyr
                    when 'sr-Latn' = '#session.defaultScript#' then a.note
                    else a.noteEn
                end as note,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then pl.hallCyr
                    when 'sr-Latn' = '#session.defaultScript#' then pl.hall
                    else pl.hallEn
                end as hall,
                case
                    when 'sr-Cyrl' = '#session.defaultScript#' then pl.cityCyr
                    when 'sr-Latn' = '#session.defaultScript#' then pl.city
                    else pl.cityEn
                end as hall,
                p.img,
                p.pathname
            from announcements a 
            inner join performances p on a.performanceId = p.id
            inner join places pl on a.placeId = pl.id
            where 
            cancelled = 0
            and a.dateAndTime >= CURDATE();
        </cfquery>

        <cfreturn QUERY.toArray(q_announcements)>
    </cffunction>
</cfcomponent>