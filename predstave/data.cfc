<cfcomponent>
    <cfinclude template="txt.cfm">
    <cfset plays = [
        {
            name:'#txtTheEveningRose#',
            path:'vecernja-ruza',
            alt:'#txtTheEveningRoseAlt#',
            poster:'/assets/img/vecernja-ruza/poster.png',
            type: 'V'

        },
        {
            name:'#txtSimplyIdiots#',
            path:'jednostavno-idioti',
            alt:'#txtSimplyIdiotsAlt#',
            poster:'/assets/img/jednostavno-idioti/poster.png',
            type: 'V'

        },
        {
            name:'#txtOnTheSurface#',
            path:'na-povrsini',
            alt:'#txtOnTheSurfaceAlt#',
            poster:'/assets/img/na-povrsini/poster.png',
            type: 'V'

        }/*,
        {
            name:'#txtDirtyDancing#',
            path:'prljavi-ples',
            alt:'#txtDirtyDancingAlt#',
            poster:'/assets/img/prljavi-ples/poster.png',
            type: 'V'

        },
        {
            name:'#txtWestSideStory#',
            path:'prica-sa-zapadne-strane',
            alt:'#txtWestSideStoryAlt#',
            poster:'/assets/img/prica-sa-zapadne-strane/poster.png',
            type: 'V'

        }*/

    ]>

    <cffunction name="getPlays" access="public" returntype="array">
        <cfreturn variables.plays>
    </cffunction>
</cfcomponent>