<cfswitch expression="#session.defaultScript#">
    <cfcase value="sr-Latn">
        <cfset txtAdministration = "Administracija">
        <cfset txtUsername = "Korisničko ime">
        <cfset txtEnterUsername = "Unesite svoje korisničko ime">
        <cfset txtPassword = "Lozinka">
        <cfset txtEnterPassword = "Unesite svoju lozinku">
        <cfset txtLogin = "Uloguj se">
        <cfset txtWelcome = "Dobro došli">
    </cfcase>
    <cfcase value="sr-Cyrl">
        <cfset txtAdministration = "Администрација">
        <cfset txtUsername = "Корисничко име">
        <cfset txtEnterUsername = "Унесите своје корисничко име">
        <cfset txtPassword = "Лозинка">
        <cfset txtEnterPassword = "Унесите своју лозинку">
        <cfset txtLogin = "Улогуј се">
        <cfset txtWelcome = "Добро дошли">
    </cfcase>
    <cfcase value="en">
        <cfset txtAdministration = "Administration">
        <cfset txtUsername = "Username">
        <cfset txtEnterUsername = "Enter your username">
        <cfset txtPassword = "Password">
        <cfset txtEnterPassword = "Enter your password">
        <cfset txtLogin = "Log in">
        <cfset txtWelcome = "Welcome">
    </cfcase>
</cfswitch>