<cfinclude template="txt.cfm">

<style>
    .nav-link{
        color: var(--gold-main)!important;
    }

    .navbar {
            background-color: #111;
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
                <img src="#application.root#/logo.png" alt="Avatar Logo" style="width:45px;" class="rounded-pill star"> 
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="##boxMenu">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between" id="boxMenu">
                <ul class="navbar-nav text-center" style="">
                    
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="##" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Audicija
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="#application.root#audicija/osnovni-podaci/">Osnovni podaci</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="#application.root#audicija/svi-kandidati/">Pregled svih kandidata</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="#application.root#audicija/komentari/">Komentari</a></li>
                          <li><a class="dropdown-item disabled" href="#application.root#audicija/uzi-krug/" >Odabir kandidata za uži krug</a></li>
                          <li><a class="dropdown-item disabled" href="" >Odredi satnicu</a></li>
                          <li><a class="dropdown-item disabled" href="" >Odluka o prijemu u teatar</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item disabled" href="" >Kreiraj uži krug </a></li>
                          <li><a class="dropdown-item disabled" href="" >Kreiraj satnicu </a></li>
                          <li><a class="dropdown-item disabled" href="" >Biranje budućih članova </a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item disabled" href="#application.root#audicija/mejlovi/" >Slanje mejlova</a></li>
                        </ul>
                    </li>
                    
                </ul>
                <ul class="navbar-nav text-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#application["root"]#logout.cfm"> #txtLogout# </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div style="height:70px"></div>
</cfoutput>