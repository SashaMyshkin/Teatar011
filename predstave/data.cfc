<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset plays = [
        {
            name:'#txtTheEveningRose#',
            path:'vecernja-ruza',
            alt:'#txtTheEveningRoseAlt#',
            poster:'/assets/img/vecernja-ruza/poster.png',
            type: 'V'

        }
    ]>

    <cffunction name="getPlays" access="public" returntype="array">
        <cfreturn variables.plays>
    </cffunction>
</cfcomponent>