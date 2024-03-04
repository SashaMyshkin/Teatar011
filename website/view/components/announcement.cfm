<cfset _CONTROLLER = createObject('component', '../../controller/Announcement')>

<style>
    .announcement {
        z-index:2; 
        color: var(--gold-main)!important; 
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
    }

    #playName{
        font-size: 3.8rem;
    }

    #dateAndTime{
        font-size: 1.4rem;
    }

    #place{
        font-size: 1.4rem;
    }

    @media screen and (max-width: 768px) {
        #playName{
            font-size: 2rem;
        }

        #dateAndTime{
            font-size: 1rem;
        }

        #place{
            font-size: 1rem;
        }
    }
</style>

<cfoutput>

    <br><br><br>

    <cfif structKeyExists(cookie, "SCREENHEIGHT") and structKeyExists(cookie, "SCREENWIDTH")>
        <cfset images = _CONTROLLER.getImages().images>
        <div id="carouselExampleCaptions" class="carousel slide carousel-fade overflow-hidden" data-bs-ride="carousel" style="height:100vh">
            
            <div id="announcement" 
            class="position-absolute bottom-0 start-50 w-50 text-light text-center announcement">
                <p id="playName" style=""><i>Вечерња ружа</i></p>
                <p id="dateAndTime" style="">4. 1. 2024. у 20.00ч</p>
                <p id="place" style="">Академија 28, Београд</p>
            </div>
            <div class="carousel-inner">
                <cfloop array="#images#" item="anImage" index="index">
                    <div class="carousel-item <cfif index eq 1>active</cfif>">
                        <img src="#anImage.src#" class="img-fluid" alt="#anImage.alt#">
                    </div>
                </cfloop>
            </div> 
        </div>
    <cfelse>
    
    </cfif>

</cfoutput>



