

<cfcomponent>
    <cffunction name="createStructuredQuery" returntype="array" access="public" static="true">
        <cfargument name="queryObject" type="query" required="true">
    
        <cfset queryJSON = serializeJSON(queryObject)>
        <cfset queryColumns = deserializeJSON(queryJSON).columns>
        <cfset queryData = deserializeJSON(queryJSON).data>
        <cfset queryStruct = arrayNew()>
        <cfloop array="#queryData#" item="data" index="indexData">
            <cfset var tableRow = structNew()>
            <cfloop array="#queryColumns#" item="column" index="indexColumns">
                <cfset tableRow["#LCase(column)#"] = data[indexColumns]>
            </cfloop>
            <cfset xy = arrayAppend(queryStruct, tableRow)>
        </cfloop>
        <cfreturn queryStruct>
    </cffunction>
</cfcomponent>