<cfoutput>
    <style>
        <cfinclude template="styles.css">
    </style>
    
    <cfinclude template="txt.cfm">
    
    <cfset DATA = createObject('component', 'DataAwards')>
    <cfset awards = DATA.getAwards(attributes.member, attributes.performance)>

    <cfif Len(awards) neq 0>
        <div class="table-holder">
            <table class="table table-dark table-sm">
                <tr>
                    <td>#txtFestival#</td>
                    <td>#txtAward#</td>
                    <cfif attributes.member eq "">
                        <td>#txtRecipient#</td>
                    </cfif>
                    <cfif attributes.performance eq "">
                        <td>#txtPerformance#</td>
                    </cfif>
                </tr>
                <cfloop array="#awards#" item="award" index="index">
                    <tr>
                        <td>#award.festivalName#</td>
                        <td>#award.award# <cfif award.note neq ""> (#award.note#) </cfif></td>
                        <cfif attributes.member eq "">
                            <td>#award.memberFullName#</td>
                        </cfif>
                        <cfif attributes.performance eq "">
                            <td>#award.performanceName#</td>
                        </cfif>
                    </tr>
                </cfloop>
            </table>
        </div>
    </cfif>
    
    
</cfoutput>

