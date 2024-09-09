<cfoutput>
    <cfparam name="url.q" default="">
    <cfset DATA = createObject('component', 'DataArtists')>

    <style>
        <cfinclude template="styles.css">
    </style>

    <cfif url.q eq "">
        
        <cfset artists = DATA.getArtists()>
    
        <div class="container">
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#artists#" item="artist" index="index">
                    <div class="col" style="max-width:350px" onclick="">
                        <a href = '?q=#artist.identifier#'>
                            <div class="card text-center bg-dark" style="color: var(--gold-main)">
                                <img src="#application.root##artist.img#" class="card-img" alt="#artist.alt#">
                                <div class="card-body">
                                    <h5 class="card-title">#artist.fullname#</h5>
                                    <p class="card-text">#artist.status#</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </cfloop>
            </div>
        </div>
    <cfelse>

        <cfset artist = DATA.getArtist('#url.q#')>

        <header class="jumbotron text-white text-center">
            <div class="container">
                <h1 class="display-4">#artist.fullname#</h1>
                <p class="lead"><i>#artist.motto#</i></p>
            </div>
        </header>

        <br>
        
        <div class="holder">
            <img src="#application.root##artist.img#" alt="#artist.alt#" style="width:350px;">
            <cfloop array="#artist["paragraphs"]#" item="item" index="index">
                <p style="text-align:justify">#item.paragraph#</p>
            </cfloop>
        </div>

        <hr style="max-width:1000px; margin:20px auto;">

        <cfmodule template="../components/roles/index.cfm" identifier="#q#" pathname="">

        <cfmodule template="../components/awards/index.cfm" member="#q#" performance="">

    </cfif>
</cfoutput>






