<style>
	<cfinclude template="styles.css">
</style>

<cfinclude template="txt.cfm">

<cfset DATA = createObject('component', 'DataRoles')>

<cfset roles = DATA.getRoles(attributes.identifier, attributes.pathname)>

<cfoutput>
	<cfif Len(roles) gt 0>
		<h2 style="text-align: center; font-size:1.6rem;">
			<cfif attributes.identifier eq "">
				#txtCast#
			<cfelse>
				#txtRoles#
			</cfif>
		</h2>
		<div class="rolesHolder">
			<div class="role-list">
				<cfloop array="#roles#" item="role">
					<div class="role-item">
						<cfif role.img neq "">
							<div class="artist-image">
								<img src="#role.img#" alt="#role.alt#">
							</div>
						</cfif>
						<div class="role-details">
							<div class="role-name">#role.roleName#</div>
							<cfif attributes.identifier eq "">
								<div class="artist-name">#role.memberFullName#</div>
							</cfif>
							<cfif attributes.pathname eq "">
								<div class="play-title">#role.performanceName#</div>
							</cfif>
						</div>
					</div>
				</cfloop>
			</div>
		</div>
	</cfif>
	
</cfoutput>

