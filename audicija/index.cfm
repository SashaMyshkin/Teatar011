
<cfif attributes.metaTags eq "true">
<cfelse>
    <cfoutput>
        <cfparam name="form.action" default="">
        <cfparam name="form.name" default="">
        <cfparam name="form.surname" default="">
        <cfparam name="form.email" default="">
        <cfparam name="form.biography" default="">
        <cfparam name="form.howHeardAboutUsId" default="">
        <cfparam name="form.sexID" default="">
        <cfparam name="form.haveYouWatched" default="0">
        <cfparam name="form.whatYouWatched" default="">
        <cfparam name="form.dateOfBirth" default="">
        <cfparam name="form.phone" default="">

        <style>
            <cfinclude template = "styles.css">
        </style>

        <cfinclude template = "txt.cfm">

        <cfset DATA = createObject('component', 'DataAudition')>
        <cfset ways = DATA.howHeardAboutUs()>
        <cfset sex = DATA.getSex()>

        <br><br>
        <img src="/assets/img/logo.png" width="100" style="border-radius:50%; display:block; margin:0 auto;">
        <br>
        <div class="holder">
            <div class="container-app">
                
                <form id="audition-form" name="audition-form" action="index.cfm?audicija=true" method="POST">
                    <input type="hidden" value="" id="action" name="action">
                    <input type="hidden" value="#DATA.getAuditionId()#" id="auditionId" name="auditionId">
                    <h1>#txtAuditionApplication#</h1>
                    <p style="text-align:center">Дошао је тренутак нове аудиције у Театру 011! </p>
                    <p style="text-align:center"> 27. и 28. јун у 19.00 часова.</p> 
                    <p style="text-align:justify">Имате могућност да нам се представите својим програмом (песма, монолог, имитација) или да изаберете могућност да вас ми проведемо кроз наше импровизације, у том случају довољно је да се само појавите у заказаном термину.</p>
                    <p style="text-align:justify">Ми једва чекамо да ТЕАТАР 011 обогатимо новим људима који ће са нама заиграти на позоришним даскама. Све што је потребно да урадите је да попуните пријаву и ми ћемо Вам се јавити мејлом са свим потребним детаљима.</p>
                    <div class="form-group-app">
                        <label for="full-name">#txtName#</label>
                        <input type="text" id="name" name="name"  max="30" value="#form.name#">
                    </div>
                    <div class="form-group-app">
                        <label for="full-name">#txtSurname#</label>
                        <input type="text" id="surname" name="surname"  max="30" value="#form.surname#">
                    </div>
                    <div class="form-group-app">
                        <label for="email">#txtEmail#</label>
                        <input type="email" id="email" name="email"  max="50" value="#form.email#">
                    </div>
                    <div class="form-group-app">
                        <label for="phone">#txtPhone#</label>
                        <input type="tel" id="phone" name="phone" value="#form.phone#">
                    </div>
                    <div class="form-group-app">
                        <label for="dateOfBirth">#txtBirth#</label>
                        <input type="date" id="dateOfBirth" name="dateOfBirth" value="#form.dateOfBirth#">
                    </div>
                    <div class="form-group-app">
                        <label for="biography">#txtPreviousExperience#</label>
                        <textarea id="biography" name="biography" rows="9"  placeholder="">#form.biography#</textarea>
                        <small>#txtNoExperiance#</small>
                    </div>
                    <div class="form-group-app">
                        <label for="sexId">#txtSex#</label>
                        <select name="sexId" id="sexId">
                            <cfloop array="#sex#" item="sex">
                                <option value="#sex.id#" <cfif form.sexId eq sex.id>selected</cfif>> #sex.sex#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="form-group-app">
                        <label for="role">#txtHowDidYouLearn#</label>
                        <select name="howHeardAboutUsId" id="howHeardAboutUsId">
                            <cfloop array="#ways#" item="way">
                                <option value="#way.id#" <cfif way.id eq form.howHeardAboutUsId>selected</cfif>>#way.way#</option>
                            </cfloop>
                        </select>
                    </div>
                    <div class="form-group-app">
                        <label for="role">#txtHaveYouWatched#</label>
                        <select name="haveYouWatched" id="haveYouWatched">
                            <option value="1" <cfif form.haveYouWatched eq "1">selected</cfif>>#txtYes#</option>
                            <option value="0" <cfif form.haveYouWatched eq "0">selected</cfif>>#txtNo#</option>
                        </select>
                    </div>
                    <div class="form-group-app">
                        <label for="role">#txtWhichOne#</label>
                        <textarea id="whatYouWatched" name="whatYouWatched" rows="1" placeholder="">#form.whatYouWatched#</textarea>
                    </div>
                    <div class="form-group-app">
                        <button type="button" onclick="doAction('ins')">#txtSubmit#</button>
                    </div>
                </form>
                <script>
                    function doAction(action) {
                        document.getElementById('action').value = action;
                        document.getElementById('audition-form').submit();
                    }
                </script>
            </div>
        </div>

        



        <cfif form.action eq "ins">
           
            <cfset response = DATA.manageApplication(form)>

            <cfif not response["error"]>
                <script>
                    alertify.set('notifier','position', 'top-center');
                    alertify.success(`#response["clientMessage"]#`, 10);
                </script>
            <cfelse>
                <script>
                    alertify.set('notifier','position', 'top-center');
                    alertify.error(`#response["clientMessage"]#`, 10);
                    console.log(`#response["consoleMessage"]#`);     
                </script>
            </cfif>

        </cfif>
    </cfoutput>    
</cfif>
