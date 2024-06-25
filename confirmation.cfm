<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Потврда</title>

    <link rel="stylesheet" href="styles.css">

</head>

<body>

    <style>

        body {

    margin: 0;

    padding: 0;

    background-color: #000;

    color: #fff;

    font-family: Arial, sans-serif;

    display: flex;

    justify-content: center;

    align-items: center;

    height: 100vh;

}



.container {

    text-align: center;

}



.logo img {

    max-width: 200px;

    margin-bottom: 20px;

    border-radius:50%;

}



h1 {

    font-size: 3em;

    margin-bottom: 20px;

}



p {

    font-size: 1.2em;

    margin-bottom: 10px;

}



a {

    color: #fff;

    text-decoration: none;

    font-weight: bold;

}



a:hover {

    text-decoration: underline;

}



    </style>

<cfparam name="url.id" default="">
<cfparam name="url.uniqueKey" default="">

<cfquery name="sel_confirmation" datasource="#application.datasource#">
    select id, name, surname, confirmed
    from candidates 
    where 1=1
    and id="#url.id#"
    and uniqueKey = "#url.uniqueKey#"
</cfquery>


    <div class="container">

        <div class="logo">
            <img src="https://teatar011.com/assets/img/logo.png" alt="Teatar 011 Logo">
        </div>

        <cfif sel_confirmation.recordCount lt 1>
            <h1> Грешка </h1>
            <p>Постоји проблем са потврдом доласка на аудицију. Молимо Вас, пишите нам о овоме на мејл 
                <a href="mailto:info@teatar011.com">info@teatar011.com</a> како бисмо отклонили овај проблем.</p>
        <cfelse>
            <cfquery name="upd_confirmation" datasource="#application.datasource#">
                update candidates 
                set confirmed = 1
                where 1=1
                and id="#url.id#"
                and uniqueKey = "#url.uniqueKey#"
            </cfquery>
            <h1>Театар 011</h1>
            <p> Кандидат:  <cfoutput>#sel_confirmation.name# #sel_confirmation.surname#</cfoutput></p>
            <p>Успешно сте потврдили свој долазак на аудицију :) </p>
            <p>Видимо се &lt;3</p>

            <cfif sel_confirmation.confirmed neq "1">
                <cfmail to="uprava@teatar011.com" 
                    from="info@teatar011.com" 
                    subject="Potvrda dolaska - #sel_confirmation.name# #sel_confirmation.surname#" type="text/html">

                    <!DOCTYPE html>
                    <html lang="sr-Latn">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Potvrda</title>
                        </head>
                        <body>
                            Kandidat <cfoutput>#sel_confirmation.name# #sel_confirmation.surname#</cfoutput> potrdio dolazak.
                        </body>
                    </html>
           
                </cfmail>

                <cfmail to="n.pakljanac@gmail.com" 
                    from="info@teatar011.com" 
                    subject="Potvrda dolaska - #sel_confirmation.name# #sel_confirmation.surname#" type="text/html">

                    <!DOCTYPE html>
                    <html lang="sr-Latn">

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Potvrda</title>
                        </head>
                        <body>
                            Kandidat <cfoutput>#sel_confirmation.name# #sel_confirmation.surname#</cfoutput> potrdio dolazak.
                        </body>
                    </html>
           
                </cfmail>
            </cfif>
        </cfif>

    </div>



    

</body>

</html>

