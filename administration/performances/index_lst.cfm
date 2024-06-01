<p>Your Magic numbers</p>
<p>It will take us a little while to calculate your ten magic numbers. It takes a lot of work to find numbers that truly fit your personality. So relax for a minute or so while we do the hard work for you.</p>
<p>We are sure you will agree it was worth the short wait!</p>
<cfflush>

<cfflush interval=10>
<!--- Delay Loop to make it seem harder. --->

<!--- Now slowly output 10 random numbers. --->
<cfloop index="Myindex" from="1" to="10" step="1">
<cfloop index="randomindex" from="1" to="1000000" step="1">
<cfset random=rand()>
</cfloop>
<cfoutput>
<p>Magic number #Myindex# is:&nbsp;&nbsp;#RandRange
    (100000, 999999)#</p><br><br>
</cfoutput>
</cfloop>