<cfoutput>
    <cfinclude template="txt_index.cfm">

    <cfif attributes.metaTags eq "true">
        <title>#txt_teatar_011#</title>
        <meta name="description" content="#txt_description#">
        <meta name="keywords" content="teatar,teatar 011,Studio glume teatar 011">
        <link rel="canonical" href="https://www.teatar011.com/" />
        <meta property="og:type" content="website">
        <meta property="og:url" content="https://www.teatar011.com/">
        <meta property="og:title" content="#txt_teatar_011#">
        <meta property="og:description" content="#txt_description#">
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
            <img  class="rounded" alt="Slika članova teatra iz Trebinja sa Festivala festivala 2024. godine" src="#application.root#/assets/img/pocetna/teatar011.jpg" 
            style="width:100%;">
        </p>
        
        <p class="par">#txt_p2#</p>
        

        <p class="par">
            <img class="rounded" alt="Jovana Jović u ulozi Svetlane, sva krvava, u sceni kod Uroša Meštara" src="#application.root#/assets/img/vecernja-ruza/svetlana.jpg" 
            style="width:100%;">
        </p>

        <p class="par">#txt_p3#</p>

        <p class="par">
            <img class="rounded" alt="Scena iz predstave Jednostavno idioti u kojoj Rodžer juri Lenarta da ga bije" src="#application.root#/assets/img/jednostavno-idioti/tuca.jpg" 
            style="width:100%;">
        </p>


    </cfif>
    
</cfoutput>
