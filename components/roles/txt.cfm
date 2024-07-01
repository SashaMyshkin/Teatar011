
<cfscript>
    switch (session.lang) {
        case 'sr-Latn':
            txtCast = "Podela uloga";
            txtRoles = "Uloge u predstavama";

        break;
        case 'sr-Cyrl':
            txtCast = "Подела улога";
            txtRoles = "Улоге у представама";
            break;
        case 'en':
            txtCast = "Cast";
            txtRoles = "Roles in performances";
        
            break;
        default:
            
    }
</cfscript>
