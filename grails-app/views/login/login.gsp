<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="google-signin-client_id"
		  content="40581836864-3bu5riuquuir497l491vslm6rfvibk42.apps.googleusercontent.com">
	<asset:stylesheet src="login.css"/>
	<script src="https://accounts.google.com/gsi/client" async defer></script>
	<title>Login - Website Monitoring & Reporting System</title>
</head>

<body>
<div class="container">
	<div class="form-login">
		<div class="form-title">
			<h2>Website Monitoring & Reporting System</h2>
		</div>

		<div class="login-content">
			<div id="alert-container">
			</div>

			<!-- Google Sign In Button -->
			<div id="googleSignInDiv" class="g_id_signin"></div>

			<div class="messagetext">
				<p>
					Just sign in with your <span>@fairetch.com.sg</span> organizational account.
				</p>
			</div>

		</div>
	</div>
</div>

<script>
    function handleCredentialResponse(response) {

        fetch("${createLink(controller: 'login', action: 'googleCallback')}", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({credential: response.credential})
        })
            .then(res => res.json())
            .then(data => {
                if (data.success) {
                    showAlert('success', 'Login successful! Redirecting...');
                    setTimeout(() => {
                        window.location.href = "${createLink(controller: 'hello', action: 'overview')}";
                    }, 1000);
                } else {
                    showAlert('error', data.message || 'Login failed. Please try again.');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                showAlert('error', 'Connection error. Please check your internet connection and try again.');
            });
    }

    function showAlert(type, message) {
        const alertContainer = document.getElementById('alert-container');
        alertContainer.innerHTML = `
            <div class="alert alert-\${type}">
                \${message}
            </div>
        `;

        // Auto hide success/info alerts after 3 seconds
        if (type === 'success' || type === 'info') {
            setTimeout(() => {
                alertContainer.innerHTML = '';
            }, 3000);
        }
    }

    function toggleDebugInfo() {
        const debugInfo = document.getElementById('debug-info');
        debugInfo.style.display = debugInfo.style.display === 'none' ? 'block' : 'none';
    }

    window.onload = function () {
        try {
            google.accounts.id.initialize({
                client_id: "40581836864-3bu5riuquuir497l491vslm6rfvibk42.apps.googleusercontent.com",
                callback: handleCredentialResponse,
                auto_select: true, // otomatis pilih akun kalau pernah login
                cancel_on_tap_outside: false,
                use_fedcm_for_prompt: true // Enable FedCM for better UX
            });

            // Render tombol Sign In dengan styling yang sesuai
            google.accounts.id.renderButton(
                document.getElementById("googleSignInDiv"),
                {
                    theme: "filled_blue", // Sesuaikan dengan theme CSS
                    size: "large",
                    width: 350, // Sesuaikan dengan lebar form
                    text: "signin_with",
                    shape: "rectangular"
                }
            );

            // Munculkan Google One Tap
            google.accounts.id.prompt((notification) => {
                console.log('One Tap notification:', notification);
                // Handle One Tap notifications jika diperlukan
            });

        } catch (error) {
            console.error('Google Sign-In initialization error:', error);
            showAlert('error', 'Failed to initialize Google Sign-In. Please refresh the page.');
        }
    }
</script>
</body>
</html>