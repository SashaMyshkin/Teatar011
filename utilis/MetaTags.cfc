<cfcomponent>
    <cffunction name="getMetaTags" access="public" returntype="query">

        <cfset qss = parseQueryString(CGI.QUERY_STRING)>


        <cfquery name="q_metaTags" datasource="#application.datasource#">
            SELECT `id`
            , `pathname`
            , `title`
            , `description`
            , `keywords`
            , `og_type`
            , `og_title`
            , `og_description`
            , `og_url`
            , `og_image`
            , `og_image_alt`
            , `https` 
            FROM `metaTags`

            where pathname = '#getCannonical()#'

        </cfquery>

        <cfreturn q_metaTags>
    </cffunction>

    <cffunction name="generateMetaTags" access="public" returntype="void">

        <cfset scriptArray = listToArray(CGI.SCRIPT_NAME, '/')>
        <cfset qss = parseQueryString(CGI.QUERY_STRING)>
      
        <cfquery name="q_metaExists" datasource="#application.datasource#">
            select id from metaTags where pathname = '#getCannonical()#';
        </cfquery>

        <cfif q_metaExists.id eq "">
            <cfquery name="q_metaTags" datasource="#application.datasource#">

                SET @title = 'Teatar 011';
                SET @alt = '';
                SET @descriptions = '';
                SET @img = '';
                SET @id = NULL;
    
                <cfif scriptArray.contains('predstave') neq 0>
                    <cfif not structKeyExists(qss, 'q') >
                        SET @title = 'Predstave - Teatar 011';
                        SET @alt = '';
                        SET @descriptions = '';
                        SET @id = NULL;
                    <cfelse>
                        select @title := `name`, @id := id, @img := img, @alt := alt from performances where pathname = '#qss.q#';
                        select @descriptions := replace(replace(SUBSTRING(`paragraph`, 1, 150), '<i>', ''), '</i>', '') from aboutPerformances where performanceId = @id and scriptId = 2 limit 1;
                    </cfif>
                </cfif>

                <cfif scriptArray.contains('ansambl') neq 0>
                    <cfif not structKeyExists(qss, 'q') >
                        SET @title = 'Ansambl - Teatar 011';
                        SET @alt = '';
                        SET @descriptions = 'Ansambl Teatra 011 čine i profesionalni glumci i talentovani amateri.';
                        SET @id = NULL;
                    <cfelse>
                        select @title := concat(`name`, ' ', `surname`), @id := id, @img := img, @alt := alt from members where identifier = '#qss.q#';
                        select @descriptions := replace(replace(SUBSTRING(`paragraph`, 1, 150), '<i>', ''), '</i>', '') from biographies where memberId = @id and scriptId = 2 limit 1;
                    </cfif>
                </cfif>
                    
    
                INSERT INTO `metaTags`( 
                    `pathname`, 
                    `title`, 
                    `description`, 
                    `keywords`, 
                    `og_type`, 
                    `og_title`, 
                    `og_description`, 
                    `og_url`, 
                    `og_image`, 
                    `og_image_alt`,
                    `https`) 
                VALUES (
                    '#getCannonical()#',
                    @title,
                    @descriptions,
                    concat(@title, ',', 'Teatar 011'),
                    'website',
                    @title,
                    @descriptions,
                    '#getCannonical()#',
                    concat('https://teatar011.com', @img),
                    @alt,
                    '#cgi.HTTPS#'
                );
                    
            </cfquery>
        </cfif>
        

    </cffunction>

    <cffunction name="getCannonical" access="public" returntype="string" output="no">


        <cfset canonical = ''>
        <cfset qss = parseQueryString(CGI.QUERY_STRING)>

        <cfif cgi.https eq 'on'>
            <cfset canonical = canonical & 'https://' >
            <cfset canonical = canonical & '#cgi.SERVER_NAME#'>
        <cfelse>
            <cfset canonical = canonical & 'http://' >
            <cfset canonical = canonical & '#cgi.SERVER_NAME#:#cgi.SERVER_PORT#'>
        </cfif>

        <cfset canonical = canonical & '#replace(cgi.SCRIPT_NAME, 'index.cfm', '')#'>

        <cfif structKeyExists(qss, 'q')>
            <cfset canonical = canonical & '?q=#qss.q#'>
        </cfif>

        <cfreturn canonical>

    </cffunction>

    <cffunction name="parseQueryString" access="public" returntype="struct">
        <cfargument name="queryString" type="string" required="true">

        <cfset var queryStruct = StructNew()>
        <cfset var keyValuePairs = ListToArray(arguments.queryString, "&")>
    
        <cfloop array="#keyValuePairs#" index="pair">
            <cfset var keyValue = ListToArray(pair, "=")>
            <cfset var key = keyValue[1]>
            <cfset var value = keyValue[2]>
            <cfset queryStruct[key] = value>
        </cfloop>
    
        <cfreturn queryStruct>
    </cffunction>
</cfcomponent>