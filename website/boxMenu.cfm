<style>
    .nav-link{
        color: var(--gold-main)!important;
    }

    .star {
        background: linear-gradient(-45deg, rgba(255,255,255,0) 0%, rgba(255,255,255,1) 100%);
        animation: shine 1s infinite alternate;
    }

    @keyframes shine {
        0% {
            box-shadow: 0 0 2px 2px rgba(255, 255, 255, 0.5);
        }
        100% {
            box-shadow: 0 0 10px 5px rgba(255, 255, 255, 0.5);
        }
    }
</style>
<cfoutput>
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background-color:rgba(4, 4, 4, 0.2)">
        <div class="container-fluid">
            <a class="navbar-brand" href="##">
                <img src="assets/img/logo.png" alt="Avatar Logo" style="width:45px;" class="rounded-pill star"> 
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##boxMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="boxMenu">
                <ul class="navbar-nav text-center" style="">
                    <li class="nav-item">
                        <a class="nav-link" href="##">#txtRepertoire#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="##">#txtPlays#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="##">#txtEnsemble#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="##">#txtAwards#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="##">#txtContact#</a>
                    </li>
                    
                </ul>
                <ul class="navbar-nav text-center">
                    <cfif session.script neq "cyrillic">
                        <li class="nav-item">
                            <a class="nav-link" href="index.cfm?script=cyrillic"> #txtCyrillic# </a>
                        </li>
                    </cfif>
                    <cfif session.script neq "latin">
                        <li class="nav-item">
                            <a class="nav-link" href="index.cfm?script=latin"> #txtLatin# </a>
                        </li>
                    </cfif>
                    <cfif session.script neq "english">
                        <li class="nav-item">
                            <a class="nav-link" href="index.cfm?script=english"> #txtEnglish# </a>
                        </li>
                    </cfif>
                    
                </ul>
            </div>
        </div>
    </nav>
</cfoutput>