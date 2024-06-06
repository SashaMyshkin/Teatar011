<cfoutput>
    <cfif attributes.metaTags eq "true">
        <cfset DATA = createObject('component', '../MetaTags')>
        <cfset metaTags = DATA.getMetaTags("#cgi.SCRIPT_NAME#?#cgi.QUERY_STRING#")>
        <title>#metaTags.title#</title>
        <meta name="description" content="#metaTags.description#">
    <cfelse>

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
                        <div class="col" style="max-width:350px" onclick="window.location.href = 'index.cfm?defaultScript=#session.defaultScript#&q=#artist.identifier#'">
                            <div class="card text-center bg-dark" style="color: var(--gold-main)">
                                <img src="#artist.img#" class="card-img" alt="#artist.alt#">
                                <div class="card-body">
                                    <h5 class="card-title">#artist.fullname#</h5>
                                    <p class="card-text">#artist.status#</p>
                                </div>
                            </div>
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
                <img src="#artist.img#" alt="#artist.alt#" style="width:350px;">
                <cfloop array="#artist["paragraphs"]#" item="item" index="index">
                    <p style="text-align:justify">#item.paragraph#</p>
                </cfloop>
            </div>

            <cfmodule template="../components/awards/index.cfm" member="#q#" performance="">

        </cfif>
        
    </cfif>
</cfoutput>






