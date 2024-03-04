class CookiesManager {
    constructor(){}

    static parseCookies() {
        var cookies = {};
        var cookieString = document.cookie;
    
        // If no cookies are present, return an empty object
        if (cookieString === '') {
            return cookies;
        }
    
        // Split the cookie string into individual cookies
        var cookieArray = cookieString.split('; ');
    
        // Loop through each cookie and extract key-value pairs
        cookieArray.forEach(function(cookie) {
            var parts = cookie.split('=');
            var key = decodeURIComponent(parts[0]);
            var value = decodeURIComponent(parts[1]);
            cookies[key] = value;
        });
    
        return cookies;
    }

    static async setScreenWidthAndHeight(){

        const cookies = this.parseCookies();

        if(!cookies.SCREENHEIGHT || !cookies.SCREENWIDTH){
            let url = 'website/controller/cookies.cfc?method=screenWidthAndHeight';
            url += `&screenHeight=${window.innerHeight}&screenWidth=${window.innerWidth}`
            const result = await fetch(url);
            const json = await result.json();
        }   
    }
}