<style>
    body {
		background-color: #343a40; /* Dark background color */
		display: flex;
		justify-content: center;
		align-items: center;
		height: 100vh;
		margin: 0;
    }
    .login-container {
		background-color: #2c3e50; /* Darker background color */
		color: #ffffff; /* Light text color */
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
		width: 300px;
    }
    .form-control {
		background-color: #34495e; /* Darker input field background color */
		border: none;
		border-radius: 5px;
		color: #ffffff; /* Light text color */
    }
    .form-control:focus {
		background-color: #2c3e50; /* Darker input field background color on focus */
		color: #ffffff; /* Light text color on focus */
    }
    .btn-primary {
		background-color: #3498db; /* Button color */
		border: none;
		border-radius: 5px;
    }
    .btn-primary:hover {
      	background-color: #2980b9; /* Button color on hover */
    }
    .forgot-password-link {
      	color: #ffffff; /* Light text color */
    }
    .forgot-password-link:hover {
		color: #cccccc; /* Text color on hover */
		text-decoration: none;
    }
</style>

<cfoutput>
	<div class="login-container">
		<h2 class="text-center mb-4">Naziv preduzeca</h2>
		<form id="login-form" name="login-form" autocomplete="off" method="POST">
			<div class="form-group">
				<label for="username">Korisnicko ime</label>
				<input id="username" name="username" type="text" class="form-control" placeholder="Unesite svoje korisnicko ime" autocomplete="off">
			</div>
			<div class="form-group">
				<label for="password">Lozinka</label>
				<input id="password" name="password" type="password" class="form-control" placeholder="Unesite svoju lozinku" autocomplete="off">
			</div>
			  <button type="button" class="btn btn-primary btn-block" id="login-button">Prijavi se</button>
			<div class="text-center mt-3">
				<a href="index.cfm?akcija=zaboravljena-lozinka" class="forgot-password-link">Zaboravljena lozinka?</a>
			</div>
			<div class="text-center mt-3">
				<a href="index.cfm" class="forgot-password-link">Nazad</a>
			</div>
		</form>
	</div>
	
	<script>
	
		document.addEventListener("DOMContentLoaded", function(event) {
			const loginForm = document.querySelector("##login-form");
			const loginButton = document.querySelector("##login-button");
	
			loginButton.addEventListener('click', async ()=>{

				const options = {
					method: 'POST',
					body: new FormData(loginForm)
				};
				const fetchResult = await fetch("./auth/controller/login.cfc?method=login", options);
				const data = await fetchResult.json();

				if(!data.error){
					alertify.set('notifier','position', 'top-right');
					alertify.notify(data.clientMessage, 'success', 2, ()=>location.reload());
				} else {
					alertify.set('notifier','position', 'top-right');
					alertify.notify(data.clientMessage, 'error', 2);
					if (data.consoleMessage != '') console.error(data.consoleMessage, data.cfcatch);
				}

			});
		});
		
	</script>
</cfoutput>
