<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/customAlert.css">

<!-- Custom Alert Box -->
<div id="customAlert" class="custom-alert hidden">
	<div class="alert-content">
		<span class="close-btn" onclick="closeAlert()">&times;</span>
		<h3 id="alertTitle">Title</h3>
		<p id="alertMessage" style="color: black;">This is a custom alert Message!</p>
		<div class="alert-button">
			<button onclick="closeAlert()" class="ok-btn">OK</button>
		</div>
	</div>
</div>

<script>
	/* function showAlert(type, message) {
	    const alertBox = document.getElementById('customAlert');
	    const title = document.getElementById('alertTitle');
	    const messageEl = document.getElementById('alertMessage');

	    alertBox.querySelector('.alert-content').classList.remove('alert-success', 'alert-error', 'alert-warning');

	    switch(type.toLowerCase()) {
	        case 'success':
	            title.innerText = "Success";
	            alertBox.querySelector('.alert-content').classList.add('alert-success');
	            break;
	        case 'error':
	            title.innerText = "Error";
	            alertBox.querySelector('.alert-content').classList.add('alert-error');
	            break;
	        case 'warning':
	            title.innerText = "Warning";
	            alertBox.querySelector('.alert-content').classList.add('alert-warning');
	            break;
	        default:
	            title.innerText = "Alert";
	    }

	    messageEl.innerText = message;
	    alertBox.classList.remove('hidden');
	}

	function closeAlert() {
	    document.getElementById('customAlert').classList.add('hidden');
	} */
	
	function showAlert(type, message, callback) {
	    const alertBox = document.getElementById('customAlert');
	    const title = document.getElementById('alertTitle');
	    const messageEl = document.getElementById('alertMessage');

	    // Remove previous alert classes
	    alertBox.querySelector('.alert-content').classList.remove('alert-success', 'alert-error', 'alert-warning');

	    // Set title and class based on type
	    switch (type.toLowerCase()) {
	        case 'success':
	            title.innerText = 'Success';
	            alertBox.querySelector('.alert-content').classList.add('alert-success');
	            break;
	        case 'error':
	            title.innerText = 'Error';
	            alertBox.querySelector('.alert-content').classList.add('alert-error');
	            break;
	        case 'warning':
	            title.innerText = 'Warning';
	            alertBox.querySelector('.alert-content').classList.add('alert-warning');
	            break;
	        default:
	            title.innerText = 'Alert';
	    }

	    // Set message
	    messageEl.innerText = message;
	    alertBox.classList.remove('hidden');

	    // Store callback for use in closeAlert
	    alertBox.dataset.callback = callback ? 'true' : 'false';
	    alertBox.callback = callback;
	}

	function closeAlert() {
	    const alertBox = document.getElementById('customAlert');
	    alertBox.classList.add('hidden');

	    // Execute callback if it exists
	    if (alertBox.dataset.callback === 'true' && typeof alertBox.callback === 'function') {
	        alertBox.callback();
	    }
	}
</script>
