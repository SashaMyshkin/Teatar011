
<cfparam name="url.pk" default="">

<cfset DATA = createObject('component', 'data')>
<cfset CONVERTER = createObject('component', '../utilis/ScriptConverter')>

<cfinclude template="txt.cfm">

<cfoutput>

    <cfif url.pk eq "">

        <style>
            .card {
                transition: transform 0.3s ease; /* Smooth transition for scaling */
                cursor:pointer;
            }
            .card:hover {
                transform: scale(1.1); /* Scale the image by 10% on hover */
                box-shadow: 0 0 20px rgba(255, 255, 255, 0.7); /* White shadow for shining effect */
            }
            .card:active {
                box-shadow: 0 0 20px rgba(255, 255, 255, 0.7);
            }
        </style>

        <cfset artists = DATA.getArtists()>

        <div class="container">
            <!-----h2 class="mt-5 mb-4 text-light text-center">#txtPlays#</!-----h2------>

            <br>
    
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#artists#" item="artist" index="index">
                    <div class="col" style="max-width:350px" onclick="window.location.assign('/ansambl/#artist.pathname#') ">
                        <div class="card text-center bg-dark" style="color: var(--gold-main)">
                            <img src="#artist.img#" class="card-img" alt="Photo number #index#">
                            <div class="card-body">
                                <h5 class="card-title">
                                    <cfif session.defaultScript eq "sr-Cyrl">
                                        #UcFirst(CONVERTER.toCyrillic(artist.fullname), true, false)#
                                    <cfelse>
                                        #artist.fullname#
                                    </cfif>
                                </h5>
                                <cfif session.defaultScript eq "sr-Cyrl">
                                    <p class="card-text">#ucase(left(CONVERTER.toCyrillic(artist.status), 1)) & mid(CONVERTER.toCyrillic(artist.status), 2)#</p>  
                                <cfelseif session.defaultScript eq "sr-Latn">
                                    <p class="card-text">#artist.status#</p>
                                </cfif>
                            </div>
                        </div>
                    </div>
                </cfloop>
            </div>
        </div>
    </cfif>
    
</cfoutput>