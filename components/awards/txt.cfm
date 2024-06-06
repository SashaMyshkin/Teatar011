
<cfscript>
    switch (session.defaultScript) {
        case 'sr-Latn':
            txtFestival = "Festival";
            txtAward = "Nagrada";
            txtRecipient = "Primalac";
            txtPerformance = "Predstava";
        break;
        case 'sr-Cyrl':
            txtFestival = "Фестивал";
            txtAward = "Награда";
            txtRecipient = "Прималац";
            txtPerformance = "Представа";
            break;
        case 'en':
            txtFestival = "Festival";
            txtAward = "Award";
            txtRecipient = "Recipient";
            txtPerformance = "Play";
            break;
        default:
            
    }
</cfscript>
