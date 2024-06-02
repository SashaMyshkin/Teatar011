

<style>
    .footer {
            background-color: #2d2d2d;
            color: #e5e5e5;
            padding: 40px 0;
        }
        .footer a {
            color: #e5e5e5;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }
        .footer .social a {
            font-size: 24px;
            margin: 0 10px;
        }
</style>

<br><br>

<cfinclude template="txt.cfm">

<cfoutput>
    <footer class="footer mt-auto py-3">
        <div class="container">
            <div class="row justify-content-around">
    
                <!-- Contact Information -->
                <div class="col-md-3">
                    <h5>#txtContact#</h5>
                    <ul class="list-unstyled">
                        <li>#txtEmail#: <a href="mailto:info@teatar011.com">info@teatar011.com</a></li>
                        <li>#txtPhone#: <a href="tel:+381691199011">+381691199011</a></li>
                        <li>#txtAddress#: #txtVojvode#</li>
                    </ul>
                </div>
                <!-- Social Media Links -->
                <div class="col-md-3">
                    <h5>#txtFollow#</h5>
                    <div class="social">
                        <a href="https://www.facebook.com/Teatar011/" class="text-light"><i class="fab fa-facebook"></i></a>
                        <a href="https://www.instagram.com/_teatar_011/" class="text-light"><i class="fab fa-instagram"></i></a>
                        <a href="https://www.youtube.com/@teatar0116" class="text-light"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col text-center">
                    <p>&copy; 2024 Teatar 011. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>
</cfoutput> 
