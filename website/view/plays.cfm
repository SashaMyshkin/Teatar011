<cfset _CONTROLLER = createObject('component', '../controller/Plays')>


<cfinclude template="txtPlays.cfm">

<cfoutput>
    <cfif url.pk eq "">

        <cfset plays = _CONTROLLER.getPlays().data>

        <div class="container">
            <h2 class="mt-5 mb-4 text-light">#txtPlays#</h2>
    
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#plays#" item="play" index="index">
                    <div class="col" style="max-width:350px" onclick="location.href = 'index.cfm?page=#url.page#&pk=#play.id#'">
                        <div class="card bg-dark text-white">
                            <img src="#play.poster#" class="card-img" alt="#play.alt#">
                        </div>
                    </div>
                </cfloop>
            </div>
        </div>
    </cfif>
    
</cfoutput>