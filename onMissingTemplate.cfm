<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <cfif session.defaultScript eq "en">
      <title>404 - Not Found</title>
    <cfelseif session.defaultScript eq "sr-Cyrl">
      <title>404 - Страница не постоји</title>
    <cfelse>
      <title>404 - Stranica ne postoji</title>
    </cfif>
    
    <style>
      /* Base styles */
      body {
          margin: 0;
          padding: 0;
          display: flex;
          align-items: center;
          justify-content: center;
          height: 100vh;
          background-color: #000;
          color: #fff;
          font-family: 'Arial', sans-serif;
      }

      .container {
          text-align: center;
          padding: 20px;
          border: 2px solid #444;
          border-radius: 10px;
          background-color: #111;
      }

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
</head>
<body>
    <div class="container">
        <div class="error-message">
            <h1>404</h1>
            <cfif session.defaultScript eq "en">
              <p>Oops! The page you're looking for can't be found.</p>
              <a href="/" class="home-link">Return Home</a>
            <cfelseif session.defaultScript eq "sr-Cyrl">
              <p>Упс... Страница коју тражите не постоји.</p>
              <a href="/" class="home-link">Врати се на почетну</a>
            <cfelse>
              <p>Ups... Stranica koju tražite ne postoji.</p>
              <a href="/" class="home-link">Vrati se na početnu</a>
            </cfif>
        </div>
    </div>
</body>
</html>
