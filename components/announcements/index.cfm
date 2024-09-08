<cfinclude template="styles.cfm">
<cfoutput>
  <section class="announcement">
    <div class="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <picture>
                    <source srcset="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/largedesc-21x9-slide1.jpg" media="(min-width: 1200px)">
                    <source srcset="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/smalldesc-16x9-slide1.jpg" media="(min-width: 800px)">
                    <source srcset="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/tablet-4x3-slide1.jpg" media="(min-width: 600px)">
                    <img src="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/mobile-9x16-slide1.jpg" alt="Description of the image">
                </picture>
            </div>
            <div class="carousel-item">
                <img src="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/largedesc-21x9-slide2.jpg" alt="Hero Image">
            </div>
            <div class="carousel-item">
                <img src="#application.root#assets/img/let-iznad-kukavicjeg-gnezda/najava/largedesc-21x9-slide3.jpg" alt="Hero Image">
            </div>
        </div>
        <div class="caption">
            <h1>Let iznad kukavičjeg gnezda</h1>
            <address>Akademija 28, Beograd</address>
            <time datetime="2024-07-01T12:00">July 1, 2024, 12:00 PM</time>
        </div>
    </div>
  </section>
  <script>
    let currentIndex = 0;
  
    function showNextImage() {
    const items = document.querySelectorAll('.carousel-item');
    items[currentIndex].classList.remove('active');
    currentIndex = (currentIndex + 1) % items.length;
    items[currentIndex].classList.add('active');
    }
  
    setInterval(showNextImage, 4000);
  </script>
</cfoutput>