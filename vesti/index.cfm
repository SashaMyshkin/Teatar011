<cfoutput>
  <cfparam name="url.q" default="">
  <cfset DATA = createObject('component', 'DataNews')>

  <style>
    <cfinclude template="styles.css">
  </style>

  

  <cfif url.q eq "">
        <div style="height:55px"></div>
        <cfset news = DATA.getAllNews()>
    
        <div class="container">
            <div class="row row-cols-1 row-cols-lg-4 row-cols-md-2 g-5 justify-content-center">
                <cfloop array="#news#" item="news_item" index="index">
              
                    <a href = '?q=#news_item.identifier#' class="card text-bg-dark" style="width: 90%;">
                      <div class="row g-0">
                        <div class="col-md-2">
                          <img src="https://teatar011.com#news_item.img#" class="img-fluid rounded-start" alt="#news_item.alt#">
                        </div>
                        <div class="col-md-10">
                          <div class="card-body">
                            <h5 class="card-title" style="color: var(--gold-main)">#news_item.title#</h5>
                            <p class="card-text">#news_item.summary#</p>
                            <p class="card-text"><small class="">#news_item.published_at#</small></p>
                          </div>
                        </div>
                      </div>
                    </a>
          
                  
                </cfloop>
            </div>
        </div>
    <cfelse>
       <cfset single_news = DATA.getSingleNews()>

       <header class="jumbotron text-white text-center">
            <div class="container">
                <h1 class="display-4" style="color: var(--gold-main)">#single_news.title#</h1>
                <cfif single_news.subtitle neq "">
                  <p class=""><i>#single_news.subtitle#</i></p>
                </cfif>
            </div>
        </header>

        <cfloop array="#single_news["paragraphs"]#" item="item" index="index">
            <div class="holder">
                <cfif item.img neq "">
                    <img class="<cfif index % 2 neq 0>img-left<cfelse>img-right</cfif>" 
                        src="https://teatar011.com#item.img#" alt="#item.alt#" style="width:350px">
                </cfif>
                <p style="text-align:justify">#item.paragraph#</p>
            </div> 
        </cfloop>   
    </cfif>


</cfoutput>