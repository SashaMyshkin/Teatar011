
<cfscript>
    switch (session.defaultScript) {
        case 'sr-Latn':
            txtFestival = "Festival";
            txtAward = "Nagrada";
            txtRecipient = "Dobitnik";
            txtPerformance = "Predstava";
            txtAwards = "Nagrade";
        break;
        case 'sr-Cyrl':
            txtFestival = "Фестивал";
            txtAward = "Награда";
            txtRecipient = "Добитник";
            txtPerformance = "Представа";
            txtAwards = "Награде";
            break;
        case 'en':
            txtFestival = "Festival";
            txtAward = "Award";
            txtRecipient = "Recipient";
            txtPerformance = "Play";
            txtAwards = "Awards";
            break;
        default:
            
    }
</cfscript>
