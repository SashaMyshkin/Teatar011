<style>
    body {
      background-color: #343a40;
      color: #fff;
    }
    .container {
      margin-top: 100px;
    }
    .btn-primary {
      background-color: #007bff;
      border-color: #007bff;
    }
    .btn-primary:hover {
      background-color: #0056b3;
      border-color: #0056b3;
    }
    .form-control {
      background-color: #495057;
      color: #fff;
      border-color: #495057;
    }
    .form-control:focus {
      background-color: #495057;
      color: #fff;
      border-color: #495057;
      box-shadow: 0 0 0 0.2rem rgba(38,143,255,.5);
    }
    .btn-link {
      color: #007bff;
    }
    .btn-link:hover {
      color: #0056b3;
    }
  </style>

<div class="container">
    <h2 class="text-center mb-4">Zaboravljena lozinka</h2>
    <form id="forgot-password-form" name="forgot-password-form">
        <div class="form-group">
            <label for="email">Imejl adresa</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Unesite svoju imail adresu">
        </div>
        <button id="forgot-password-button" type="button" class="btn btn-primary btn-block">Pošalji link za oporavak</button>
    </form>
    <div class="text-center mt-3">
        <a href="index.cfm" class="btn btn-link">Nazad</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function(event) {
			const forgotPasswordForm = document.querySelector("#forgot-password-form");
			const forgotPasswordButton = document.querySelector("#forgot-password-button");
	
			forgotPasswordButton.addEventListener('click', async ()=>{

				const options = {
					method: 'POST',
					body: new FormData(forgotPasswordForm)
				};

				const fetchResult = await fetch("./auth/controller/zaboravljenaLozinka.cfc?method=zaboravljenaLozinka", options);
				const data = await fetchResult.json();

                console.log(data)

				if(!data.error){
					alertify.set('notifier','position', 'top-right');
					alertify.notify(data.clientMessage, 'success', 2/*, ()=>location.href = "index.cfm"*/);
				} else {
					alertify.set('notifier','position', 'top-right');
					alertify.notify(data.clientMessage, 'error', 5);
					if (data.consoleMessage != '') console.error(data.consoleMessage, data.cfcatch);
				}

			});
		});
</script>