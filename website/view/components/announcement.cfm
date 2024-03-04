<cfset _MODEL = createObject('component', '../../model/Announcement')>
<cfset _QUERY = createObject('component', '../../../utilis/Query')>
<cfset images = _MODEL.getData().images>

<cfoutput>

    <cfif structKeyExists(cookie, "SCREENHEIGHT") and structKeyExists(cookie, "SCREENWIDTH")>
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade overflow-hidden" data-bs-ride="carousel" style="height:100vh">
            
            <div id="announcement" 
            class="position-absolute bottom-0 start-50 w-50 text-light text-center" 
            style="z-index:2; color: var(--gold-main)!important; text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);" >
                <p style="font-size: 5rem"><i>Вечерња ружа</i></p>
                <p style="font-size: 1.8rem">4. јануар 2024. у 20.00ч</p>
                <p style="font-size: 1.5rem">Академија 28, Београд</p>
            </div>
            <div class="carousel-inner">
                <cfloop array="#_QUERY.createStructuredQuery(images)#" item="anImage" index="index">
                    <div class="carousel-item <cfif index eq 1>active</cfif>">
                        <img src="#anImage.src#" class="img-fluid" alt="#anImage.alt#">
                    </div>
                </cfloop>
            </div> 
        </div>
    <cfelse>
    
    </cfif>

</cfoutput>



