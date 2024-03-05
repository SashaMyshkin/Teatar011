<cfcomponent>

    <cfset _RESPONSE = createObject('component','../../utilis/Response')>
    <cfset _MODEL = createObject('component','../model/Plays')>
    <cfset _QUERY = createObject('component', '../../utilis/Query')>

    <cffunction name="getPlays" returnformat="JSON" returntype="struct" access="remote">

        <cfset var res = _RESPONSE.ResponseNew()>
        <cfset var res["images"] = arrayNew()>

        <cftry>

            <cfset var data = _MODEL.getData()>
            <cfset var res["data"] = _QUERY.createStructuredQuery(data)>

            <cfcatch>
                <cfset var res["error"] = true>
            </cfcatch>
        </cftry>

       <cfreturn res>
    </cffunction>
</cfcomponent>