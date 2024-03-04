<cfcomponent>

    <cfset _RESPONSE = createObject('component','../../utilis/Response')>
    <cfset _MODEL = createObject('component','../model/Announcement')>
    <cfset _QUERY = createObject('component', '../../utilis/Query')>

    <cffunction name="getImages" returnformat="JSON" returntype="struct" access="remote">

        <cfset var res = _RESPONSE.ResponseNew()>
        <cfset var res["images"] = arrayNew()>

        <cftry>

            <cfif structKeyExists(cookie, 'SCREENHEIGHT') AND structKeyExists(cookie, 'SCREENWIDTH')>
                <cfset var data = _MODEL.getData(cookie.SCREENHEIGHT, cookie.SCREENWIDTH)>
                <cfset var res["images"] = _QUERY.createStructuredQuery(data)>
                <cfset var res["getDataResult"] = _MODEL.getData(cookie.SCREENHEIGHT, cookie.SCREENWIDTH)>
            </cfif>

            <cfcatch>
                <cfset var res["error"] = true>
            </cfcatch>
        </cftry>

       <cfreturn res>
    </cffunction>
</cfcomponent>