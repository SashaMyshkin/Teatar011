
<style>
    <cfinclude template="../styles.css">
</style>

<cfinclude template="txt.cfm">

<cfoutput>
    <header class="jumbotron jumbotron-fluid text-white text-center">
        <div class="container">
            <h1 class="display-4">#txtName#</h1>
            <p class="lead">#txtSlogan#</p>
        </div>
    </header>
    
    <br>
    
    <section class="container" style="max-width:1000px">
    
        <!-- Section 1 -->
        <div class="row play-section">
            <div class="col-lg-4 text-center">
                <img src="/assets/img/na-povrsini/poljubac.jpg" alt="Play Scene 1" width="370">
            </div>
            <div class="col-lg-8 text-center">
                <p class="about">#txtParagraph1#</p>
                <p class="about">#txtParagraph2#</p>
                <p class="about">#txtParagraph3#</p>
            </div>
        </div>
    
        
    
        <!-- Section 2 -->
        <div class="row play-section">
            <div class="col-md-4 text-center pb-3">
                <img src="/assets/img/na-povrsini/daca-majka.jpg" alt="Play Scene 2" width="370">
            </div>
            <div class="col-md-4 text-center pb-3">
                <img src="/assets/img/na-povrsini/daca-marlena.jpg" alt="Play Scene 2" width="370">
            </div>
            <div class="col-md-4 text-center pb-3">
                <img src="/assets/img/na-povrsini/lucija.jpg" alt="Play Scene 2" width="370">
            </div>
        </div>
    </section>
</cfoutput>



