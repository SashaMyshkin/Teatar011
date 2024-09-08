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
					<a style="text-decoration:none"
							<cfif attributes.identifier neq "">
								href="/predstave/?q=#role.pathname#"
							<cfelse>
								href="/ansambl/?q=#role.identifier#"
							</cfif>
						>
						<div class="role-item">
							
							<cfif role.img neq "">
								<div class="artist-image">
									<img src="#application.root##role.img#" alt="#role.alt#">
								</div>
							</cfif>
							<div class="role-details">
								<div class="role-name"  style="color: var(--gold-main)">#role.roleName#</div>
								<cfif attributes.identifier eq "">
									<div class="artist-name">
										
											#role.memberFullName#
										
									</div>
								</cfif>
								<cfif attributes.pathname eq "">
									<div class="play-title">
										
											#role.performanceName#
									
									</div>
								</cfif>
							</div>
							
							
						</div>
					</a>
				</cfloop>
			</div>
		</div>
	</cfif>
	
</cfoutput>

