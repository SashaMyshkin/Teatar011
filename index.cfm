<cfoutput>
    <cfif attributes.metaTags eq "true">
    <cfelse>
        <cfinclude template="components/announcements/index.cfm">
        
        <!------section class="hero" id="hero">
            <img src="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/largedesc-21x9-slide3.jpg" alt="Hero Image">
            <hgroup style="">
                <h1>Teatar 011</h1>
                <p>16 godina sa Vama</p>
            </hgroup>
        </!------section->
        
        <section class="content about" id="about">
            <h2>O Nama</h2>
            <p>Studio glume Teatar 011 je pozorište koje s predanošću radi i stvara od 2008. godine. Iz male dramske sekcije jedne srednje škole, izrastao je u studio glume koji danas okuplja više od 40 umetnika, među kojima se nalaze i profesionalni glumci i talentovani amateri.</p>
            <img src="https://via.placeholder.com/800x400" alt="About Image">
        </section>
        
        <section class="content repertoire" id="repertoire">
            <h2>Repertoar</h2>
            <p>Naš repertoar obuhvata tematski raznovrsne i društveno angažovane predstave koje imaju za cilj da potaknu razmišljanje, podignu svest o različitim važnim pitanjima, ali i da nasmeju i zabave publiku.</p>
            <p>Posebnu pažnju posvećujemo dečijoj sceni, kako bismo kod najmlađih razvili ljubav prema pozorištu.</p>
            <img src="https://via.placeholder.com/800x400" alt="Repertoire Image">
        </section>
        
        <section-------------- class="content awards" id="awards">
            <h2>Nagrade</h2>
            <ul>
                <li>Nagradu za najbolju predstavu po oceni žirija publike na 66. Festivalu festivala u Trebinju 2023. godine za predstavu "Večernja ružu"</li>
                <li>Srebrnu plaketu na [broj] republičkom festivalu u Kuli 2017. godine za predstavu "Dragi Tata"</li>
                <li>Nagradu za najbolju predstavu po oceni stručnog žirija na 64. BAP-u 2024. godine za "Let iznad kukavičjeg gnezda".</li>
            </ul>
            <img src="https://via.placeholder.com/800x400" alt="Awards Image">
        </section-------------->
    </cfif>
    
</cfoutput>
