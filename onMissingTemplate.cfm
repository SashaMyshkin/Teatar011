
    
    <style>


     

      /* Typography */
      h1 {
          font-size: 6em;
          margin: 0;
          color: #f00;
      }

      p {
          font-size: 1.5em;
          margin: 20px 0;
      }

      /* Link styles */
      .home-link {
          text-decoration: none;
          color: #0f0;
          font-size: 1.2em;
          border: 2px solid #0f0;
          padding: 10px 20px;
          border-radius: 5px;
          transition: background-color 0.3s, color 0.3s;
      }

      .home-link:hover {
          background-color: #0f0;
          color: #000;
      }

      /* Media queries for responsiveness */
      @media (max-width: 600px) {
          h1 {
              font-size: 4em;
          }

          p {
              font-size: 1.2em;
          }

          .home-link {
              font-size: 1em;
              padding: 8px 16px;
          }
      }

    </style>

    <div class="container404">
        <div class="error-message">
            <h1>404</h1>
            <cfif session.lang eq "en">
              <p>Oops! The page you're looking for can't be found.</p>
              <a href="/" class="home-link">Return Home</a>
            <cfelseif session.lang eq "sr-Cyrl">
              <p>Упс... Страница коју тражите не постоји.</p>
              <a href="/" class="home-link">Врати се на почетну</a>
            <cfelse>
              <p>Ups... Stranica koju tražite ne postoji.</p>
              <a href="/" class="home-link">Vrati se na početnu</a>
            </cfif>
        </div>
    </div>

