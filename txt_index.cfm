
<cfscript>
    switch (session.lang) {
        case 'sr-Latn':
            txt_p1 = "Teatar 011 je pozorište koje posvećeno radi i stvara punih #year(now())-2008# godina. Od male dramske sekcije u okviru jedne srednje škole, vremenom se razvio u studio glume koji danas broji preko 40 umetnika među kojima, rame uz rame, stoje i profesionalni glumci i talentovani amateri.";
            txt_p2 = "Na repertoaru se nalaze tematski raznovrsne i neretko društveno angažovane predstave koje imaju za cilj da pobude misao, podignu svest o različitim gorućim pitanjima, ali isto tako i da nasmeju i zabave. ";
            txt_p3 = "Teatar 011 rado učestvuje na festivalima širom Srbije i regiona odakle je poneo brojne nagrade od kojih smo naročito ponosni na Zlatnu masku za najbolju predstavu u celini na Festivalu festivala u Trebinju 2024. godine.";
            break;
        case 'sr-Cyrl':
            txt_p1 = "Театар 011 је позориште које посвећено ради и ствара пуних #year(now())-2008# година. Од мале драмске секције у оквиру једне средње школе, временом се развио у студио глуме који данас броји преко 40 уметника међу којима, раме уз раме, стоје и професионални глумци и талентовани аматери.";
            txt_p2 = "На репертоару се налазе тематски разноврсне и неретко друштвено ангажоване представе које имају за циљ да побуде мисао, подигну свест о различитим горућим питањима, али исто тако и да насмеју и забаве. ";
            txt_p3 = "Театар 011 радо учествује на фестивалима широм Србије и региона одакле је понео бројне награде од којих смо нарочито поносни на Златну маску за најбољу представу у целини на Фестивалу фестивала у Требињу 2024. године.";

            break;
        case 'en':
            txt_p1 = "Teatar 011 is a theatre that has been dedicated to working and creating for a full #year(now())-2008# years. From a small drama section within a high school, it gradually developed into an acting studio that today includes over 40 artists, among whom both professional actors and talented amateurs stand side by side.";   
            txt_p2 = "The repertoire includes thematically diverse and often socially engaged performances aimed at provoking thought, raising awareness of various pressing issues, but also at making people laugh and entertain them.";
            txt_p3 = "Teatar 011 gladly participates in festivals across Serbia and the region, from which it has brought numerous awards, particularly proud of the Golden Mask for the best overall performance at the Festival of Festivals in Trebinje in 2024.";
            break;
        default:
            
    }
</cfscript>
