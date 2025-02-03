<cfcomponent>
    <cfset variables.auditionId = -1>
    <cfset variables.auditionTypeId = 0>
    <cfset variables.presentationTypeId = 0>
    <cfset variables.startDate = "">
    <cfset variables.endDate = "">
    <cfset variables.deadLine = "">
    <cfset variables.auditionTime = "">
    <cfset variables.enrollmentDateTime = "">
    <cfset variables.membershipFee = 0>
    <cfset variables.uniqueKey = "">
    <cfset variables.isOpen = 0>
    <cfset variables.selectResult = structNew()>

    <cffunction name="init" returntype="void">
        <cfargument name="id" required="false" default="">
        <cfreturn this>
    </cffunction>

    <cffunction name="initFromForm" >
        <cfset variables.auditionId = url.auditionId>
        <cfset variables.auditionTypeId = form.auditionType>
        <cfset variables.presentationTypeId = form.presentationType>
        <cfset variables.startDate = form.startDate>
        <cfset variables.endDate = form.endDate>
        <cfset variables.deadLine = "">
        <cfset variables.auditionTime = form.auditionTime>
        <cfset variables.enrollmentDateTime = form.enrollmentDateTime>
        <cfset variables.membershipFee = form.membershipFee>
        <cfset variables.uniqueKey = "">
        <cfset variables.isOpen = form.isOpen>

       <cfreturn this> 
    </cffunction>

    <!--- Getters and Setters --->
    <cffunction name="getAuditionId" ><cfreturn auditionId></cffunction>
    <cffunction name="setAuditionId"><cfargument name="value" type="numeric"><cfset variables.auditionId = arguments.value></cffunction>
    
    <cffunction name="getAuditionTypeId" returntype="numeric"><cfreturn auditionTypeId></cffunction>
    <cffunction name="setAuditionTypeId"><cfargument name="value" type="numeric"><cfset variables.auditionTypeId = arguments.value></cffunction>
    
    <cffunction name="getPresentationTypeId" returntype="numeric"><cfreturn presentationTypeId></cffunction>
    <cffunction name="setPresentationTypeId"><cfargument name="value" type="numeric"><cfset variables.presentationTypeId = arguments.value></cffunction>
    
    <cffunction name="getStartDate" returntype="date"><cfreturn startDate></cffunction>
    <cffunction name="setStartDate"><cfargument name="value" type="date"><cfset variables.startDate = arguments.value></cffunction>
    
    <cffunction name="getEndDate" returntype="date"><cfreturn endDate></cffunction>
    <cffunction name="setEndDate"><cfargument name="value" type="date"><cfset variables.endDate = arguments.value></cffunction>
    
    <cffunction name="getDeadLine" returntype="date"><cfreturn deadLine></cffunction>
    <cffunction name="setDeadLine"><cfargument name="value" type="date"><cfset variables.deadLine = arguments.value></cffunction>
    
    <cffunction name="getAuditionTime" returntype="string"><cfreturn auditionTime></cffunction>
    <cffunction name="setAuditionTime"><cfargument name="value" type="string"><cfset variables.auditionTime = arguments.value></cffunction>
    
    <cffunction name="getEnrollmentDateTime" returntype="date"><cfreturn enrollmentDateTime></cffunction>
    <cffunction name="setEnrollmentDateTime"><cfargument name="value" type="date"><cfset variables.enrollmentDateTime = arguments.value></cffunction>
    
    <cffunction name="getMembershipFee" returntype="numeric"><cfreturn membershipFee></cffunction>
    <cffunction name="setMembershipFee"><cfargument name="value" type="numeric"><cfset variables.membershipFee = arguments.value></cffunction>
    
    <cffunction name="getUniqueKey" returntype="string"><cfreturn uniqueKey></cffunction>
    <cffunction name="setUniqueKey"><cfargument name="value" type="string"><cfset variables.uniqueKey = arguments.value></cffunction>
    
    <cffunction name="getIsOpen" returntype="boolean"><cfreturn isOpen></cffunction>
    <cffunction name="setIsOpen"><cfargument name="value" type="boolean"><cfset variables.isOpen = arguments.value></cffunction>
    
    <cffunction name="getSelectResult" returntype="struct"><cfreturn selectResult></cffunction>
    <cffunction name="setSelectResult"><cfargument name="value" type="struct"><cfset variables.selectResult = arguments.value></cffunction>

     <!--- Update function --->
     <cffunction name="updateAudition" returntype="void">
        
        <cfquery name="q_update_audition" datasource="#application.datasource#">
            UPDATE `audition`
            SET auditionTypeId = <cfqueryparam value="#variables.auditionTypeId#" cfsqltype="cf_sql_integer">,
                presentationTypeId = <cfqueryparam value="#variables.presentationTypeId#" cfsqltype="cf_sql_integer">,
                startDate = <cfqueryparam value="#variables.startDate#" cfsqltype="cf_sql_date">,
                <cfif variables.endDate neq "">
                    endDate = <cfqueryparam value="#variables.endDate#" cfsqltype="cf_sql_varchar">,
                <cfelse>
                    endDate = <cfqueryparam cfsqltype="cf_sql_varchar" null="yes">,
                </cfif>
                auditionTime = <cfqueryparam value="#variables.auditionTime#" cfsqltype="cf_sql_varchar">,
                <cfif variables.enrollmentDateTime neq "">
                    enrollmentDateTime = <cfqueryparam value="#variables.enrollmentDateTime#" cfsqltype="cf_sql_varchar">,
                <cfelse>
                    enrollmentDateTime = <cfqueryparam cfsqltype="cf_sql_varchar" null="yes">,
                </cfif>
                <cfif variables.membershipFee neq "">
                    membershipFee = <cfqueryparam value="#variables.membershipFee#" cfsqltype="cf_sql_integer">,
                <cfelse>
                    membershipFee = <cfqueryparam cfsqltype="cf_sql_integer" null="yes">,
                </cfif>
                uniqueKey = <cfqueryparam value="#variables.uniqueKey#" cfsqltype="cf_sql_varchar">,
                isOpen = <cfqueryparam value="#variables.isOpen#" cfsqltype="cf_sql_bit">
            WHERE id = <cfqueryparam value="#variables.auditionId#" cfsqltype="cf_sql_integer">;
        </cfquery>
    </cffunction>

     <!--- Insert function --->
     <cffunction name="insertAudition">

        <cfquery name="q_insert_audition" result="res_insert_audition" datasource="#application.datasource#">
            INSERT INTO `audition` (auditionTypeId, presentationTypeId, startDate, endDate, auditionTime, enrollmentDateTime, membershipFee, uniqueKey, isOpen)
            VALUES (<cfqueryparam value="#variables.auditionTypeId#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#variables.presentationTypeId#" cfsqltype="cf_sql_integer">,
                    <cfqueryparam value="#variables.startDate#" cfsqltype="cf_sql_varchar">,
                    <cfif variables.endDate neq "">
                        <cfqueryparam value="#variables.endDate#" cfsqltype="cf_sql_varchar">,
                    <cfelse>
                        <cfqueryparam cfsqltype="cf_sql_varchar" null="yes">,
                    </cfif>
                    <cfqueryparam value="#variables.auditionTime#" cfsqltype="cf_sql_varchar">,
                    <cfif variables.enrollmentDateTime neq "">
                        <cfqueryparam value="#variables.enrollmentDateTime#" cfsqltype="cf_sql_varchar">,
                    <cfelse>
                        <cfqueryparam cfsqltype="cf_sql_varchar" null="yes">,
                    </cfif>
                    <cfif variables.membershipFee neq "">
                        <cfqueryparam value="#variables.membershipFee#" cfsqltype="cf_sql_integer">,
                    <cfelse>
                        <cfqueryparam cfsqltype="cf_sql_integer" null="yes">,
                    </cfif>
                    <cfqueryparam value="#variables.uniqueKey#" cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#variables.isOpen#" cfsqltype="cf_sql_integer">);
        </cfquery>

        <cfset variables.auditionId = res_insert_audition.generatedKey>

        <cfreturn variables.auditionId>
    </cffunction>

    <!--- Select function --->
    <cffunction name="selectAudition" returntype="query">
        <cfargument name="id" required="true">

        <cfquery name="q_audition_data" datasource="#application.datasource#">
            SELECT `id`, 
            `auditionTypeId`, 
            `presentationTypeId`, 
            `startDate`, 
            `endDate`, 
            `deadLine`, 
            `auditionTime`, 
            `enrollmentDateTime`, 
            `membershipFee`, 
            `uniqueKey`, 
            `isOpen`,
            `finished` 
            FROM `audition` 
            WHERE id = "#arguments.id#"
        </cfquery>

        <cfreturn q_audition_data>
    </cffunction>

    <!--- delete function --->
    <cffunction name="deleteAudition" returntype="void">
        <cfargument name="id" required="true">

        <cfquery name="q_audition_data" datasource="#application.datasource#">
            DELETE FROM `audition` 
            WHERE id = '#arguments.id#'
        </cfquery>

    </cffunction>

    <cffunction name="getOpenAuditionId" >

        <cfquery name="q_check_open" datasource="#application.datasource#">
            select id from audition where isOpen = 1 limit 1;
        </cfquery>

        <cfreturn q_check_open.id> 

    </cffunction>

    <cffunction name="setFinished">
        <cfargument name="auditionId">
        <cfargument name="finished">


        <cfquery name="q_check_open" datasource="#application.datasource#">
            update audition set finished = '#arguments.finished#' where id = '#arguments.auditionId#';
        </cfquery>

    </cffunction>

    <cffunction name="setIsOpen">
        <cfargument name="auditionId">
        <cfargument name="isOpen">


        <cfquery name="q_check_open" datasource="#application.datasource#">
            update audition set isOpen = '#arguments.isOpen#' where id = '#arguments.auditionId#';
        </cfquery>

    </cffunction>

    <cffunction name="getAuditionByDate">
        <cfargument name="startDate">

        <cfquery name="q_get_by_date" datasource="#application.datasource#">
            select id from audition where '#startDate#' BETWEEN startDate and COALESCE(endDate, startDate);
        </cfquery>

        <cfreturn q_get_by_date.id>

    </cffunction>

    <cffunction name="getAll">

        <cfquery name="q_all_auditions_data" datasource="#application.datasource#">
            SELECT a.`id`,
            pt.type as presentationType,
            t.type as auditionType,
            `auditionTypeId`, 
            `presentationTypeId`, 
            `startDate`, 
            `endDate`, 
            `deadLine`, 
            `auditionTime`, 
            `enrollmentDateTime`, 
            `membershipFee`, 
            `uniqueKey`, 
            `isOpen`,
            `finished` 
            FROM `audition` a
            INNER JOIN auditionPresentationType pt on pt.id = a.presentationTypeId
            INNER JOIN auditionType t on t.id = a.auditionTypeId
            WHERE 1=1
            ORDER BY startDate DESC
        </cfquery>

        <cfreturn q_all_auditions_data>

    </cffunction>

    <cffunction name="hasCandidates">
        <cfargument name="id">

        <cfquery name="q_candidate_check" datasource="#application.datasource#">
            SELECT id from candidates
            where auditionId = '#arguments.id#'
            limit 1
        </cfquery>

        <cfreturn q_candidate_check.recordcount > 0>

    </cffunction>

</cfcomponent>
