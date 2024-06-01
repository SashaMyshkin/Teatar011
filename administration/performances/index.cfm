<cfparam name="action" default="lst">

<cfset attribute = attributes.targetPage>

<cfswitch expression="#action#">
    <cfcase value="list">
        <cfmodule template="index_lst.cfm" >
    </cfcase>
    <cfcase value="edit">
        <cfmodule template="index_edit.cfm">
    </cfcase>
    <cfdefaultcase>
        <cfmodule template="index_lst.cfm">
    </cfdefaultcase>
</cfswitch>