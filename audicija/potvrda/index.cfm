
<style>
    .logo img {
        max-width: 100px;
        margin-bottom: 20px;
        border-radius:50%;
    }
</style>

<cfparam name="url.uq" default="">
<cfparam name="form.theWay" default="">

<cfset DATA = createObject('component', 'ConfirmationData')>

<cfset checkerQuery = DATA.checkCandidate(url.uq)>

<cfoutput>

    <cfif checkerQuery.id eq "">
        <cfheader statusCode="404" statustext="Not Found">
        <cflocation url="../../404.cfm" addtoken="false">
    </cfif>
    
    <div style="height:75px;"></div>

    <p class="text-center"> 
        <div class="logo text-center">
            <img src="https://teatar011.com/assets/img/logo.png" alt="Teatar 011 Logo">
        </div>
    </p>

    <cfif checkerQuery.confirmed eq 1>
        <p class="mt-2 mb-4  text-center " style="font-size:2rem;"> 
            <b style="color:green">Svoj dolazak ste već potvrdili.</b>
        </p>
        <cfabort>
    </cfif>

    <cfif form.theWay neq "">
        <cfset DATA.confirm(url.uq, form.theWay)>
        <cfset DATA.notifyMe(checkerQuery.name, checkerQuery.surname, form.theWay)>

        <p class="mt-2 mb-4  text-center" style="font-size:2rem;"> 
            <b style="color:green">Uspešno ste potvrdili svoj dolazak. </b> 
        </p>

        <p class="mt-2 mb-4  text-center" style="font-size:2rem;"> 
            <b style="">Vidimo se :) </b> 
        </p>

        <cfabort>
    </cfif>

    <div class="container">
        
        <p class="mt-2 mb-4  text-center" style="font-size:1.3rem"> 
            Na audiciji Teatra 011 želim da se predstavim:
        </p>
        <form id="confirmation-form" name="confirmation-form" method="POST" action="?uq=#url.uq#">
            <p class="text-center"> 
                <input class="form-check-input" type="radio" name="theWay" id="theWay1" value="ja">
                <label class="form-check-label" for="theWay1" style="font-size:0.9rem">
                    Svojim programom (monolog, pesma, imitacija)
                </label>
            </p>
            <p class="text-center"> 
                <input class="form-check-input" type="radio" name="theWay" id="theWay2" value="vi" checked>
                <label class="form-check-label" for="theWay2" style="font-size:0.9rem">
                    Improvizacijama koje će mi komisija zadati
                </label>
            </p>
            <p class="mt-5 mb-5 text-center mb-2"> 
                <button class="btn btn-primary btn-lg" type="submit"> Potvrdi dolazak</button>
            </p>
        </form>
        
        <p class="text-center link-warning" style="font-size:0.8rem"> 
            Ni jedan od ovih načina nema prednost nad drugim.
        </p>
        <p class="  text-center " style="font-size:0.8rem"> 
            <i>*Budite bez brige! Ovo nije audicija za FDU niti bismo hteli da ona izgleda tako.
            Pred Vama će sedeti ljudi koji će voleti da zablistate, a ako Vas trema bude sputavala, 
            daće sve od sebe da je zajedno prevaziđete.</i>
        </p>
    </div>
</cfoutput>

