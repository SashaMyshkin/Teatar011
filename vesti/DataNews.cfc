<cfcomponent>


    <cfset QUERY = createObject('component', '../utilis/Query')>
    <cfset QUERY = createObject('component', '../utilis/Query')>

    <cffunction name="getAllNews" access="public" returntype="array">

        <cfquery name="q_allnews" datasource="#application.datasource#">
            SELECT nuid.identifier,
            n.summary,
            n.title,
            DATE_FORMAT(nuid.published_at, '%d. %m. %Y. %H:%i') published_at,
            nuid.img,
            nuid.alt
            FROM `news_uid` nuid
            inner join news n on n.news_uid = nuid.id
            where n.script_id = 2 and nuid.is_public = 1
            order by published_at desc
        </cfquery>

        <cfreturn QUERY.toArray(q_allnews)>
    </cffunction>

    <cffunction name="getSingleNews" access="public" returntype="struct">

        <cfset var data = structNew()>
        <cfset var data["title"] = "">
        <cfset var data["subtitle"] = "">
        <cfset var data["paragraphs"] = arrayNew()>
      

        <cfquery name="q_singlenews" datasource="#application.datasource#">
            SELECT 
            nuid.id,
            nuid.identifier,
            n.summary,
            n.title,
            DATE_FORMAT(nuid.published_at, '%d. %m. %Y. %H:%i') published_at,
            nuid.img,
            nuid.alt,
            n.subtitle
            FROM `news_uid` nuid
            inner join news n on n.news_uid = nuid.id
            where n.script_id = 2 and nuid.identifier = '#url.q#' and nuid.is_public = 1
        </cfquery>

        <cfset var data["title"] = q_singlenews.title>
        <cfset var data["subtitle"] = q_singlenews.subtitle>

        <cfquery name="q_news_about" datasource="#application.datasource#">
            select 
                paragraph,
                img,
                alt
            from news_paragraphs np
            inner join scripts s on s.id = np.script_id 
            where 1 = 1
            and np.news_uid = '#q_singlenews.id#'
            and s.script = '#session.lang#'
        </cfquery>

        <cfset data["paragraphs"] = QUERY.toArray(q_news_about)>


        <cfreturn data>
    </cffunction>
</cfcomponent>