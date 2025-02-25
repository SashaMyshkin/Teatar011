<cfcomponent>

    <cffunction name="getAllCandidates" access="public" returntype="query">

        <cfquery name="q_candidates" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex,
            c.shortlisted,
            c.auditionTime,
            c.timeEmail
            from candidates c
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where 1=1
            <cfif structKeyExists(session, 'candidateName') and session.name neq ''>
                and c.name like '%#form.name#%'
            </cfif>
            <cfif structKeyExists(form, 'surname') and form.surname neq ''>
                and c.surname like '%#form.surname#%'
            </cfif>
            <cfif structKeyExists(form, 'sex') and form.sex neq ''>
                and s.id = '#form.sex#'
            </cfif>
            <cfif structKeyExists(form, 'confirmed') and form.confirmed neq ''>
                and c.confirmed = '#form.confirmed#'
            </cfif>
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates>
    </cffunction>

    <cffunction name="getAllShortlisted" access="public" returntype="query">

        <cfquery name="q_shortlisted" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex
            from candidates c
            inner join audition a on a.id = c.auditionId and isOpen = 1
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where shortlisted = 1
            order by c.id desc
        </cfquery>

        <cfreturn q_shortlisted>
    </cffunction>

    <cffunction name="getShortlistedUnnotified" access="public" returntype="query">

        <cfquery name="q_shortlisted_unnotified" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            c.email, 
            c.uniqueKey
            from candidates c
            inner join audition a on a.id = c.auditionId and isOpen = 1
            where 
            shortlisted = 1
            and confirmationEmail = 0
            order by c.id desc
        </cfquery>

        <cfreturn q_shortlisted_unnotified>
    </cffunction>

    

    <cffunction name="shortlistTheCandidate" access="public" returntype="void">
        <cfquery name="q_shortlist_update" datasource="#application.datasource#">
            update candidates set shortlisted = <cfif structKeyExists(form, 'shortlisted')>1<cfelse>0</cfif> where id = '#url.q#'
        </cfquery>
    </cffunction>

    <cffunction name="getConfirmedUnnotifiedCandidates" access="public" returntype="query">

        <cfquery name="q_candidates" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            c.email, 
            SUBSTRING(auditionTime, 1, 5) auditionTime
            
            from candidates c
            inner join audition a on a.id = c.auditionId and active = 1
            where 1=1
            and shortlisted = 1
            and confirmationEmail = 1
            and confirmed = 1
            and theWay is not null
            and auditionTime is not null
            and timeEmail is null
           
            order by c.id desc
        </cfquery>

        <cfreturn q_candidates>
    </cffunction>

    <cffunction name="getConfirmedCandidates" access="public" returntype="query">

        <cfquery name="q_confirmed_candidates" datasource="#application.datasource#">
            select c.id, 
            c.name, 
            c.surname, 
            DATE_FORMAT(c.dateOfBirth, '%d.%m.%Y') dateOfBirth, 
            h.way heardAboutUs, 
            c.whatYouWatched playsWatched,
            c.email,
            confirmed,
            s.sex,
            c.shortlisted
            from candidates c
            inner join audition a on a.id = c.auditionId and active = 1
            inner join howHeardAboutUs h on h.id = c.howHeardAboutUsId
            inner join sex s on s.id = c.sexId
            where 1=1
            and confirmed = 1
            <cfif structKeyExists(form, 'name') and form.name neq ''>
                and c.name like '%#form.name#%'
            </cfif>
            <cfif structKeyExists(form, 'surname') and form.surname neq ''>
                and c.surname like '%#form.surname#%'
            </cfif>
            <cfif session.time neq "">
                and c.auditionTime like '%#session.time#%'
            </cfif>
            order by c.id desc
        </cfquery>

        <cfreturn q_confirmed_candidates>
    </cffunction>

    <cffunction name="getComment" access="public" returntype="query">
        <cfquery name="q_comment" datasource="#application.datasource#">
            select id, comment from candidatesComments 
            where 1=1
            and user_id = '#session.userId#'
            and candidate_id = '#url.q#'
        </cfquery>
        <cfreturn q_comment>
    </cffunction>

    <cffunction name="leaveTheComment" access="public" returntype="void">
        
        <cfset commentQuery = getComment()>
        
        <cfif commentQuery.id eq "">
            <cfquery name="q_comment_ins" datasource="#application.datasource#">
                insert into candidatesComments (comment, user_id, candidate_id)
                values ('#form.comment#', '#session.userId#', '#url.q#')
            </cfquery>
        <cfelse>
            <cfquery name="q_comment_ins" datasource="#application.datasource#">
                update candidatesComments set comment = '#form.comment#' where id = '#commentQuery.id#'
            </cfquery>
        </cfif>
        
    </cffunction>

    <cffunction name="getComments" access="public" returntype="query">
        
        <cfquery name="q_comments" datasource="#application.datasource#">
            select concat(u.name, ' ', u.surname) userFullname, 
            concat(c.name, ' ', c.surname) candidateFullname,
            cm.comment
            from candidates c
            inner join candidatesComments cm on cm.candidate_id = c.id
            inner join users u on u.id = cm.user_id
            where c.id = '#url.q#'
        </cfquery>

       
        
        <cfreturn q_comments>

    </cffunction>

    <cffunction name="getRejected" access="public" returntype="query">
        
        <cfquery name="q_rejected_candidates" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            c.email
            
            from candidates c
            inner join audition a on a.id = c.auditionId and active = 1
            where 1=1
            and present = 1
            and accepted = 0
            and resultsEmail = 0
           
            order by c.id desc
        </cfquery>
        
        <cfreturn q_rejected_candidates>

    </cffunction>

    <cffunction name="getAccepted" access="public" returntype="query">
        
        <cfquery name="q_accepted_candidates" datasource="#application.datasource#">
            select 
            c.id, 
            c.name, 
            c.surname, 
            c.email
            
            from candidates c
            inner join audition a on a.id = c.auditionId and active = 1
            where 1=1
            and present = 1
            and accepted = 1
            and resultsEmail = 0
           
            order by c.id desc
        </cfquery>


       
        
        <cfreturn q_accepted_candidates>

    </cffunction>
</cfcomponent>