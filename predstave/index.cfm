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
        <cfset DATA.generateICSFile()>
        <cfset play = DATA.getPlay('#url.q#')>
        <cfset scheduledPerformancesData = DATA.getScheduledPerformance()>

        <header class="jumbotron text-white text-center">
            <div class="container">
                <h1 class="display-4">#play.performanceName#</h1>

                <cfif scheduledPerformancesData.performanceId neq "">
                    <p style="font-size:14px; <cfif scheduledPerformancesData.cancelled eq 1>text-decoration: line-through red;</cfif>" > <i> #dateFormat(scheduledPerformancesData.dateAndTime, "dd. mm. yyyy.")# u 
                        #TimeFormat(scheduledPerformancesData.dateAndTime, "HH.mm")# č. -
                        #scheduledPerformancesData.hall#, #scheduledPerformancesData.city#</i> &nbsp;
                        <!-- Button trigger modal -->
                        <cfif scheduledPerformancesData.cancelled eq 0>
                            <button type="button" class="btn btn-sm btn-secondary" style="font-size:10px;" data-bs-toggle="modal" data-bs-target="##calendar">
                                Podsetnik
                            </button>
                        </cfif>
                    </p>
                    <cfif scheduledPerformancesData.cancelled eq 1><span>OTKAZANO!<span></cfif>
                </cfif>
                
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

         <!-- Modal -->
        <div class="modal fade " id="calendar" tabindex="-1" aria-labelledby="calendarLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content bg-dark">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="calendarLabel">Podsetnik</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Ukoliko želite da dodate izvođenje predstave u svoj kalendar, pratite sledeće korake:</p>

                        <ol>
                            <li>Preuzmite fajl: <a href="#application.root#/predstave/ics/#url.q#.#scheduledPerformancesData.id#.ics" download="#url.q#.#scheduledPerformancesData.id#.ics">#url.q#.ics</a></li>
                            <li>Otvorite preuzeti fajl. </li>
                            <li>Sačuvajte događaj u svom kalendaru.</li>
                            
                        </ol>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Zatvori</button>
                    </div>
                </div>
            </div>
        </div>

    </cfif>
</cfoutput>