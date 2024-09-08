<cfoutput>
    <cfinclude template="txt_index.cfm">

    <cfif attributes.metaTags eq "true">
        <title>#txt_teatar_011#</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link rel="alternate" hreflang="en" href="">
        <link rel="alternate" hreflang="fr" href="">
        <link rel="alternate" hreflang="es" href="">
        <link rel="alternate" hreflang="de" href="">
    <cfelse>

        <style>
            <cfinclude template="index.css">
        </style>

        
        <!------p class="par">
            <h1 style="text-align:center">#txt_teatar_011#</h1>
        </!------p------>

        <h1 class="mt-5 mb-5" style="text-align:center">#txt_teatar_011#</h1>

        <p class="par">#txt_p1#</p>

        <p class="par">
            <img  class="rounded" alt="" src="#application.root#/assets/img/pocetna/teatar011.jpg" 
            style="width:100%;">
        </p>
        
        <p class="par">#txt_p2#</p>
        

        <p class="par">
            <img class="rounded" alt="" src="#application.root#/assets/img/vecernja-ruza/svetlana.jpg" 
            style="width:100%;">
        </p>

        <p class="par">#txt_p3#</p>

        <p class="par">
            <img class="rounded" alt="" src="#application.root#/assets/img/jednostavno-idioti/tuca.jpg" 
            style="width:100%;">
        </p>


    </cfif>
    
</cfoutput>
