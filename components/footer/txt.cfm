
<cfscript>
    switch (session.defaultScript) {
        case 'sr-Latn':
            txtEmail="Imejl";
            txtPhone = "Telefon";
            txtAddress = "Adresa";
            txtVojvode = "Vojvode Micka Krstića 1J/3";
            txtContact = "Kontakt";
            txtFollow = "Pratite nas";
        break;
        case 'sr-Cyrl':
            txtEmail="Имејл";
            txtPhone = "Телефон";
            txtAddress = "Адреса";
            txtVojvode = "Војводе Мицка Крстића 1J/3";
            txtContact = "Контакт";
            txtFollow = "Пратите нас";
            break;
        case 'en':
            txtEmail="Email";
            txtPhone = "Phone";
            txtAddress = "Address";
            txtVojvode = "Vojvode Micka Krstića 1J/3";
            txtContact = "Contact us";
            txtFollow = "Follow us";
            break;
        default:
            
    }
</cfscript>
