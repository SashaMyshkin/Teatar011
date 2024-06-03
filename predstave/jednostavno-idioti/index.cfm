
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
            <div class="col-md-6">
                <img src="/assets/img/jednostavno-idioti/tuca.jpg" alt="Play Scene 1">
            </div>
            <div class="col-md-6">
                <p class="about">#txtParagraph1#</p>
            </div>
        </div>
    
        
    
        <!-- Section 2 -->
        <div class="row play-section">
            <div class="col-md-6 order-md-2">
                <img src="/assets/img/jednostavno-idioti/uvodna.jpg" alt="Play Scene 2">
            </div>
            <div class="col-md-6 order-md-1">
                <p class="about">#txtParagraph2#</p>
            </div>
        </div>
    
        
    
        <!-- Section 3 -->
        <!-----div class="row play-section">
            <div class="col-md-6">
                <img src="/assets/img/jednostavno-idioti/zelene-zavese.jpg" alt="Play Scene 3">
            </div>
            <div class="col-md-6">
                <p class="about">#txtParagraph3# 
                    <ul>
                        <li>#txtBAP#</li>
                        <li>#txtKula#</li>
                        <li>#txtTrebinje#</li>
                        <li>#txtFEDRAS#</li>
                        <li>#txtBRAMDAN#</li>
                        <li>#txtMartinoviDani#</li>
                    </ul>
                </p>
            </div>
        </!-----div---------->
    </section>
</cfoutput>



