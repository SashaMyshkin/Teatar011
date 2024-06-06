
<cfif attributes.metaTags eq "true">
<cfelse>
    <cfoutput>
        <cfparam name="url.action" default="insert">
        <style>
            <cfinclude template = "styles.css">
        </style>
        <cfinclude template = "txt.cfm">
        <div class="holder">
            <div class="container-app">
                <form id="audition-form" name="audition-form" action="/audicija/index.cfm?">
                    <input type="hidden" value="#url.action#" id="action" name="action">
                    <h1>#txtAuditionApplication#</h1>
                    <div class="form-group">
                        <label for="full-name">#txtName#</label>
                        <input type="text" id="name" name="name" required max="30">
                    </div>
                    <div class="form-group">
                        <label for="full-name">#txtSurname#</label>
                        <input type="text" id="surname" name="surname" required max="30">
                    </div>
                    <div class="form-group">
                        <label for="email">#txtEmail#</label>
                        <input type="email" id="email" name="email" required max="50">
                    </div>
                    <div class="form-group">
                        <label for="phone">#txtPhone#</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="experience">#txtPreviousExperience#</label>
                        <textarea id="experience" name="experience" rows="5" required min="150" placeholder=""></textarea>
                    </div>
                    <div class="form-group">
                        <label for="role">#txtSex#</label>
                        <select>
                            <option value="M">#txtMale#</option>
                            <option value="F">#txtFemale#</option>
                            <option value="O">#txtOther#</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="role">#txtHowDidYouLearn#</label>
                        <select>
                            <option value="1">#txtSM#</option>
                            <option value="2">#txtFriends#</option>
                            <option value="3">#txtWeb#</option>
                            <option value="4">#txtOther#</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="role">#txtHaveYouWatched#</label>
                        <select>
                            <option value="1">#txtYes#</option>
                            <option value="2">#txtNo#</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="role">#txtWhichOne#</label>
                        <textarea id="experience" name="experience" rows="2" required placeholder=""></textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit">#txtSubmit#</button>
                    </div>
                </form>
            </div>
        </div>
    </cfoutput>    
</cfif>
