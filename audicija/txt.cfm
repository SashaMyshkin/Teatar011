
<cfscript>
    switch (session.lang) {
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
            txtNoExperiance = "*Ukoliko nemate glumačkog iskustva, recite nam zašto želite da se bavite glumom.";

            txtNameRequired = "Ime je obavezan podatak.";
            txtSurnameRequired = "Prezime je obavezan podatak.";
            txtEmailRequired = "Imejl je obavezan podatak.";
            txtEmailNotValid = "Unesite Imejl u adekvatnoj formi.";
            txtExperienceRequired = "Obavezno je popuniti polje <i>Dosadašnja iskustva.</i>";
            txt150wordsMin = "Potrebno je uneti minimum 100 reči u polje <i>Dosadašnja iskustva.</i>";
            txtWhichOneRequired = "Molimo vas, navedite koju predstavu ste gledali.";
            txtBirth = "Datum rođenja";
            txtError = "Desila se neočekivana greška. Molimo Vas obratite se našoj tehničkoj podršci na mejl: it@teatar011.com";

            txtDateOfBirthRequired = "Datum rođenja je obavezan podatak";
            txtApplicationSubmitted = "Već je zabeležena jedna prijava za audiciju sa ove imejl adrese."; 

            txtSuccess = "Vaša prijava je uspešno zabeležena. Na adresu koju ste uneli poslat je mejl sa dodatnim uputstvima";

            txtPhoneRequired = "Telefon je obavezan podatak";
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
            txtNoExperiance = "*Уколико немате глумачког искуства, реците нам зашто желите да се бавите глумом.";

            txtNameRequired = "Име је обавезан податак.";
            txtSurnameRequired = "Презиме је обавезан податак.";
            txtEmailRequired = "Имејл је обавезан податак.";
            txtEmailNotValid = "Унесите Имејл у адекватној форми.";
            txtExperienceRequired = "Обавезно је попунити поље <i>Досадашња искуства.</i>";
            txt150wordsMin = "Потребно је унети минимум 100 речи у поље <i>Досадашња искуства.</i>";
            txtWhichOneRequired = "Молимо вас, наведите коју представу сте гледали.";
            txtBirth = "Датум рођења";
            txtError = "Десила се неочекивана грешка. Молимо Вас обратите се нашој техничкој подршци на мејл: it@teatar011.com";
            txtDateOfBirthRequired = "Датум рођења је обавезан податак";
            txtApplicationSubmitted = "Већ је забележена једна пријава за аудицију са ове имејл адресе."; 
            txtSuccess = "Ваша пријава је успешно забележена. На адресу коју сте унели послат је мејл са додатним упутствима";
            txtPhoneRequired = "Телефон је обавезан податак";


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
            txtNoExperiance = "*If you don’t have any acting experience, let us know why you want to get into acting.";

            txtNameRequired = "Name is a required field.";
            txtSurnameRequired = "Surname is a required field.";
            txtEmailRequired = "Email is a required field.";
            txtEmailNotValid = "Please enter a valid email address.";
            txtExperienceRequired = "The field <i>Previous experience</i> is required.";
            txt150wordsMin = "You must enter at least 100 words in the field <i>Previous experience</i>.";
            txtWhichOneRequired = "Please specify which performance you have watched.";
            txtBirth = "Date of birth";
            txtError = "An unexpected error has occurred. Please contact our technical support at email: it@teatar011.com";
            txtDateOfBirthRequired = "Date of birth is a required field.";
            txtApplicationSubmitted = "An audition application has already been recorded from this email address.";
            txtPhoneRequired = "Please enter your phone number";

            break;
        default:
            
    }
</cfscript>
