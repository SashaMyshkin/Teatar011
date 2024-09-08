<style>
    .announcement {
    width: 100%;
    height: calc(100vh - 70px);
    display: flex;
    justify-content: center;
    align-items: center;
  }
  
  .carousel {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
  }
  
  .carousel-inner {
    width: 100%;
    height: 100%;
    display: flex;
    transition: transform 1s ease;
  }
  
  .carousel-item {
    min-width: 100%;
    min-height: 100%;
    transition: opacity 1s ease;
  }
  
  .carousel-item img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
  
  .caption {
    position: absolute;
    padding: 1.1rem;
    bottom: 0px;
    left: 0px;
    width: 100vw;
    text-align: center;
    background-color: hsla(1, 0%, 0%, 0.6);
  }

  .caption h1 {
    color: var(--gold-main);
    letter-spacing: 0.2rem;
  }

  .caption address{
    font-size: 1.3rem;
    margin: 0;
  }

  .caption time {
    font-size: 1.1rem;
  }

</style>