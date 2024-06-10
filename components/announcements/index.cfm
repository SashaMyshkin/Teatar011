<style>
    @import url('https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@400&display=swap');

    .text-shadow{
        
        color: gold;
            text-shadow: 4px 4px 6px black;
        background-color: rgba(0, 0, 0, 0.5);
        border-radius: 10px 10px;
        max-width:500px;
        margin: 0 auto;
    }

    .title-play {
        font-family: 'Playfair Display', serif;
        font-size: 2.4em;
        color: var(--gold-main);
        font-style: italic;
    }

    .where {
        font-size: 1.5em;
    }
</style>

<div id="carouselExampleDark" class="carousel carousel-dark slide carousel-fade" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="3000">
        <picture>
            <!-- Large desktops -->
            <source srcset="/assets/img/let-iznad-kukavicjeg-gnezda/largedesc-21x9-slide1.jpg" media="(min-width: 1200px)">
            <!-- Desktops and tablets in landscape -->
            <source srcset="/assets/img/let-iznad-kukavicjeg-gnezda/smalldesc-16x9-slide1.jpg" media="(min-width: 768px)">
            <!-- Tablets in portrait mode -->
            <source srcset="/assets/img/let-iznad-kukavicjeg-gnezda/tablet-4x3-slide1.jpg" media="(min-width: 480px)">
            <!-- Mobile devices -->
            <source srcset="/assets/img/let-iznad-kukavicjeg-gnezda/mobile-9x16-slide1.jpg" media="(min-width: 320px)">
            <!-- Default/fallback image for unsupported browsers -->
            <img src="/assets/img/let-iznad-kukavicjeg-gnezda/mobile-9x16-slide1.jpg" alt="A descriptive alt text" class="d-block w-100">
          </picture>
        <div class="carousel-caption text-shadow" >
            <p class="title-play">Let iznad kukavičjeg gnezda</p>
            <p class="where" >23. 06. 2024. u 20.00č<br>Akademija 28, Beograd</p>
        </div>
      </div>
      
    </div>
  </div>