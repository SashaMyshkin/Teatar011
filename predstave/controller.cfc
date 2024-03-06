<cfcomponent>

    <cfset RESPONSEOBJECT = createObject('component','../utilis/Response')>
    <cfset MODEL = createObject('component','model')>
    <cfset QUERY = createObject('component', '../utilis/Query')>

    <cffunction name="getPlays" returnformat="JSON" returntype="struct" access="remote">

        <cfset var res = RESPONSEOBJECT.ResponseNew()>
        <cfset var res["images"] = arrayNew()>

        <cftry>

            <cfset var data = MODEL.getPlays()>
            <cfset var res["data"] = QUERY.toArray(data)>

            <cfcatch>
                <cfset var res["error"] = true>
                <cfset var res["cfcatch"] = cfcatch>
            </cfcatch>
        </cftry>

       <cfreturn res>
    </cffunction>
</cfcomponent>