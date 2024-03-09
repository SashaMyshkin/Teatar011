<cfinclude template="txt.cfm">

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
    <nav class="navbar navbar-expand-sm navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="##">
                <img src="#application.root#assets/img/logo.png" alt="Avatar Logo" style="width:45px;" class="rounded-pill star"> 
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##boxMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="boxMenu">
                <ul class="navbar-nav text-center" style="">
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#announcements/">#txtAnnoucements#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#performances/">#txtPerformances#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#members/">#txtMembers#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#audition/">#txtAudition#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#awards/">#txtAwards#</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#news/">#txtNews#</a>
                    </li>
                    
                </ul>
                <ul class="navbar-nav text-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#application.adminroot#logout.cfm"> #txtLogout# </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div style="height:70px"></div>
</cfoutput>