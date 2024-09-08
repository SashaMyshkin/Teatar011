<cfoutput>
    <style>
        <cfinclude template="styles.css">
    </style>
    
    <cfinclude template="txt.cfm">
    
    <cfset DATA = createObject('component', 'DataAwards')>
    <cfset awards = DATA.getAwards(attributes.member, attributes.performance)>

    <cfif Len(awards) neq 0>
        <div class="table-holder">
            <h3 style="text-align: center; font-size:1.2rem;">#txtAwards#</h3>
            <table class="table table-dark table-sm">
                <cfset tempFestival = "">
                <cfloop array="#awards#" item="award" index="index">
                    <cfif tempFestival neq award.festivalName>
                        <cfset tempFestival = award.festivalName>
                        <tr>
                            <td colspan="3" style="font-size:1.2rem"><b>#award.festivalName#</b></td>
                        </tr>
                    </cfif>
                    <tr>
                        
                        <td style="font-size:0.9rem">#award.award# <cfif award.note neq ""> (#award.note#) </cfif></td>
                        <cfif attributes.member eq "">
                            <td style="font-size:0.9rem">#award.memberFullName#</td>
                        </cfif>
                        <cfif attributes.performance eq "">
                            <td style="font-size:0.9rem">#award.performanceName#</td>
                        </cfif>
                    </tr>
                </cfloop>
            </table>
        </div>
    </cfif>
    
    
</cfoutput>

