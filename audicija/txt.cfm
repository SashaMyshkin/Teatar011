
<cfscript>
    switch (session.defaultScript) {
        case 'sr-Latn':
            txtAuditionApplication = "Prijava za audiciju";
            txtName = "Ime";
            txtSurname = "Prezime";
            txtEmail = "Imejl";
            txtPhone = "Telefon";
            txtPreviousExperience = "Dosadašnja iskustva";
            txtSex = "Pol";
            txtMale = "Muški";
            txtFemale = "Ženski";
            txtOther= "Drugo";
            txtSubmit = "Pošalji";
            txtHowDidYouLearn = "Kako ste saznali za nas?";
            txtSM = "Preko društvenih mreža";
            txtFriends = "Preko prijatelja";
            txtWeb = "Pretragom na Internetu";
            txtHaveYouWatched = "Da li ste gledali neku od naših predstava?";
            txtYes = "Jesam";
            txtNo = "Nisam";
            txtWhichOne = "U koliko jeste gledali, molimo Vas, navedite koju:";
        break;
        case 'sr-Cyrl':
            txtAuditionApplication = "Пријава за аудицију";
            txtName = "Име";
            txtSurname = "Презиме";
            txtEmail = "Имејл";
            txtPhone = "Телефон";
            txtPreviousExperience = "Досадашња искуства";
            txtSex = "Пол";
            txtMale = "Мушки";
            txtFemale = "Женски";
            txtOther= "Друго";
            txtSubmit = "Пошаљи";
            txtHowDidYouLearn = "Како сте сазнали за нас?";
            txtSM = "Преко друштвених мрежа";
            txtFriends = "Преко пријатеља";
            txtWeb = "Претрагом на Интернету";
            txtHaveYouWatched = "Да ли сте гледали неку од наших представа?";
            txtYes = "Јесам";
            txtNo = "Нисам";
            txtWhichOne = "У колико јесте гледали, молимо Вас, наведите коју:";
            break;
        case 'en':
            txtAuditionApplication = "Audition application";
            txtName = "Name";
            txtSurname = "Surname";
            txtEmail = "Email";
            txtPhone = "Phone";
            txtPreviousExperience = "Previous experience";
            txtSex = "Sex";
            txtMale = "Male";
            txtFemale = "Female";
            txtOther= "Other";
            txtSubmit = "Submit";
            txtHowDidYouLearn = "How did you learn about us?";
            txtSM = "Through social media";
            txtFriends = "Through friends";
            txtWeb = "By searching the Internet";
            txtHaveYouWatched = "Have you watched any of our performances?";
            txtYes = "Yes, I have";
            txtNo = "No, I haven't";
            txtWhichOne = "If you have watched, please specify which one:";

            break;
        default:
            
    }
</cfscript>
