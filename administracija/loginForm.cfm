<cfinclude template="txt.cfm">

<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="icon" href="#application.root#/logo.png" type="image/png">
            <title>#txtWelcome#</title>
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    font-family: Arial, sans-serif;
                    background-color: ##222;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                }
                
                .login-container {
                    background-color: ##333;
                    border-radius: 8px;
                    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
                    padding: 20px;
                    width: 300px;
                }
                
                .login-container h2 {
                    color: ##fff;
                    text-align: center;
                }
                
                .login-form {
                    margin-top: 20px;
                }
                
                .form-group {
                    margin-bottom: 20px;
                    overflow: hidden;
                }
                
                .form-group label {
                    display: block;
                    color: ##fff;
                    margin-bottom: 5px;
                }
                
                .form-group input {
                    width: 100%;
                    padding: 8px;
                    border-radius: 4px;
                    border: 1px solid ##444;
                    background-color: ##222;
                    color: ##fff;
                }
                
                .form-group input:focus {
                    outline: none;
                    border-color: ##555;
                }
                
                .form-group input::placeholder {
                    color: ##999;
                }
                
                .form-group button {
                    width: 100%;
                    padding: 10px;
                    border: none;
                    border-radius: 4px;
                    background-color: ##4CAF50;
                    color: ##fff;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }
                
                .form-group button:hover {
                    background-color: ##45a049;
                }

                img{
                    border-radius: 50%;
                    display:block;
                    margin:auto;
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
        </head>
        <body>
            <div class="login-container">
                <img src="#application.root#/logo.png" style="width:55px;"> 
                <h2>#txtAdministration#</h2>

                
                <form class="login-form" action="#application.root#" method="POST">
                    <div class="form-group">
                        <label for="username">#txtUsername#:</label>
                        <input type="text" id="j_username" name="j_username" placeholder="#txtEnterUsername#" required maxlength="30">
                    </div>
                    <div class="form-group">
                        <label for="password">#txtPassword#:</label>
                        <input type="password" id="j_password" name="j_password" placeholder="#txtEnterPassword#" required maxlength="30">
                    </div>
                    <div class="form-group">
                        <button type="submit">#txtLogin#</button>
                    </div>
                </form>
            </div>
        </body>
    </html>

</cfoutput>

