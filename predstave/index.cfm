
<cfparam name="url.pk" default="">

<cfset CONTROLLER = createObject('component', 'controller')>

<cfinclude template="txt.cfm">

<cfoutput>

    <cfif url.pk eq "">

        <style>
            img {
                transition: transform 0.3s ease; /* Smooth transition for scaling */
                cursor:pointer;
            }
            img:hover {
                transform: scale(1.1); /* Scale the image by 10% on hover */
                box-shadow: 0 0 20px rgba(255, 255, 255, 0.7); /* White shadow for shining effect */
            }
            img:active {
                box-shadow: 0 0 20px rgba(255, 255, 255, 0.7);
            }
        </style>

        <cfset plays = CONTROLLER.getPlays().data>

        <div class="container">
            <h2 class="mt-5 mb-4 text-light">#txtPlays#</h2>
    
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#plays#" item="play" index="index">
                    <div class="col" style="max-width:350px" onclick="location.href = 'index.cfm?pk=#play.id#'">
                        <div class="card bg-dark text-white">
                            <img src="#play.poster#" class="card-img" alt="#play.alt#">
                        </div>
                    </div>
                </cfloop>
            </div>
        </div>
    </cfif>
    
</cfoutput>