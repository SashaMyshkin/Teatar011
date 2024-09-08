<cfoutput>
    <cfif attributes.metaTags eq "true">
    <cfelse>

        <style>
            <cfinclude template="index.css">
        </style>
        <cfinclude template="txt_index.cfm">

        <p >
            <img alt="" src="#application.root#/assets/img/pocetna/teatar011.jpg" 
            style="width:100%;">
        </p>
        

        <p >#txt_p1#</p>

        <p >
            <img alt="" src="#application.root#/assets/img/vecernja-ruza/svetlana.jpg" 
            style="width:100%;">
        </p>

        <p >#txt_p2#</p>

        <p >
            <img alt="" src="#application.root#/assets/img/jednostavno-idioti/tuca.jpg" 
            style="width:100%;">
        </p>

        <p >#txt_p3#</p>



    </cfif>
    
</cfoutput>
