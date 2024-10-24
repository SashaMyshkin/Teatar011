<cfoutput>
    <cfparam name="url.q" default="">
    <cfset DATA = createObject('component', 'DataPlays')>

    <style>
        <cfinclude template="styles.css">
    </style>

    <cfif url.q eq "">

        <cfset plays = DATA.getPlays()>

        <div class="container">
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#plays#" item="play" index="index">
                    <div class="col" style="max-width:350px" onclick="">
                        <a href = '?q=#play.pathname#'>
                            <div class="card text-center bg-dark" style="color: var(--gold-main)">
                                <img src="#application.root##play.img#" class="card-img" alt="#play.alt#">
                                <div class="card-body">
                                    <p class="card-text"><i style="color: var(--gold-main)">#play.slogan#</i></p>
                                </div>
                            </div>
                        </a>
                    </div>
                </cfloop>
            </div>
        </div>
    <cfelse>
        <cfset play = DATA.getPlay('#url.q#')>

        <header class="jumbotron text-white text-center">
            <div class="container">
                <h1 class="display-4">#play.performanceName#</h1>
                <p class="lead"><i>#play.slogan#</i></p>
            </div>
        </header>

        <br>
        <cfloop array="#play["paragraphs"]#" item="item" index="index">
            <div class="holder">
                <cfif item.img neq "">
                    <img class="<cfif index % 2 neq 0>img-left<cfelse>img-right</cfif>" 
                        src="#application.root##item.img#" alt="#item.alt#" style="width:350px">
                </cfif>
                <p style="text-align:justify">#item.paragraph#</p>
            </div> 
        </cfloop>   

        <hr style="max-width:1000px; margin:20px auto;">

        <cfmodule template="../components/roles/index.cfm" identifier="" pathname="#q#">

        <cfmodule template="../components/awards/index.cfm" member="" performance="#q#">
    </cfif>
</cfoutput>