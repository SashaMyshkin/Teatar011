<cfcomponent>
    <cffunction name="screenWidthAndHeight" returnformat="JSON" returntype="struct" access="remote">

        <cfcookie name="screenHeight" value="#screenHeight#" expires="never">
        <cfcookie name="screenWidth" value="#screenWidth#" expires="never">

       <cfreturn structNew()>
    </cffunction>
</cfcomponent>