
<style>
    <cfinclude template="../styles.css">
</style>

<cfinclude template="txt.cfm">

<cfoutput>
    <br> 
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
            <div class="col-lg-5 text-center pb-3">
                <img src="/assets/img/svetlana-pavlovic/profilna.jpg" alt="Play Scene 1" width="370">
            </div>
            <div class="col-lg-7 text-center">
                <p class="about">#txtParagraph1#</p>
                <p class="about">#txtParagraph2#</p>
                <p class="about">#txtParagraph3#</p>
                <p class="about">#txtParagraph4#</p>
                <p class="about">#txtParagraph5#</p>
            </div>
        </div>
    </section>
</cfoutput>



