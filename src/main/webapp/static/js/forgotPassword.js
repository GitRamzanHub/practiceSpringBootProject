let receivedOTP = '';

function sendOTP(){
	  
	  const email = $('#email').val();
	  if(!email){
		  showAlert('error','Please enter valid email address!');
		  return;
	  }
	  
	  $('#submitBtn').attr('disabled',true);
	  
	  $.ajax({
        url: '/sendOTP',
        type: 'POST',
        data: { email: email },
        success: function(resp) {
        	// received otp after email sent
        	if(resp != 'Error'){
        		console.log("OTP Received:: "+resp);
	        	receivedOTP = resp;
	           // 1. displaying the status message otp sent to your email address
			   showAlert('success', 'OTP has been sent to your email');
	           // $('#statusMessage').text('OTP has been sent to your email').show();
	           
	           // message after 3 sec
	           setTimeout(function(){
	        	   $('#statusMessage').text('');
	           }, 3000);
	           
	           // 2. Show OTP input boxes
	           displayOTPEnterBox();
        	}
			
			$('#submitBtn').removeAttr('disabled');
        	
        },
        error: function(xhr, status, error) {
            showAlert('error', 'Failed to send OTP, try again!');
			$('#submitBtn').removeAttr('disabled');
        }
    });
	  
  }

 function displayOTPEnterBox() {
    if ($('#otpContainer').length === 0) {
        const otpContainer = $('<div id="otpContainer" class="mb-3" style="text-align: center;"></div>');
        for (let i = 0; i < 6; i++) {
            const otpInput = $('<input type="text" maxlength="1" class="otp-box" id="otp' + i + '" style="margin: 0 4px; width: 35px; text-align: center;">');
            otpContainer.append(otpInput);
        }
        /*$('.custom-btn').closest('.text-center').before(otpContainer);
        $('#otp0').focus();*/
		
		$('.form-group').closest('.mb-3').after(otpContainer);
        $('#otp0').focus();
    }
 }
 
 function displayPasswordResetBlock() {
    if ($('#passwordResetContainer').length === 0) {
        const passResetContainer = $(`
            <div id="passwordResetContainer" class="password-transition">
                <div class="mb-3">
                    <div class="form-group" style="margin-bottom: 2px;">
                        <input type="password" id="newPassword" name="newPassword"  oninput="checkNewPasswordStrenth()" placeholder="New Password" required>
                        <label for="newPassword">New Password</label>
						<i class="fas fa-eye" id="newPassEyeIcon" onclick="toggleNewPassword()" style="cursor: pointer;"></i>                        
                    </div>
					<div class="form-group">
					<div id="newPasswordFeedback" style="font-size: 12px;"></div>
					</div>
                </div>
                <div class="mb-3">
                    <div class="form-group" style="margin-bottom: 2px;">
                        <input type="password" id="confirmedPassword" name="confirmedPassword"  oninput="checkConfirmedPasswordStrenth()" placeholder="Confirmed Password" required>
                        <label for="confirmedPassword">Confirmed Password</label>
						<i class="fas fa-eye" id="confirmedPassEyeIcon" onclick="toggleConfirmedPassword()" style="cursor: pointer;"></i>
					</div>
					<div class="form-group">
						<div id="confirmedPasswordFeedback" style="font-size: 12px;"></div>
					</div>
                </div>
            </div>
        `).css({ opacity: 0, transform: 'translateY(-10px)'});

        $('#otpContainer').after(passResetContainer);
        $('#newPassword').focus();

        // Trigger animation
        setTimeout(() => {
            passResetContainer.css({ opacity: 1, transform: 'translateY(0)' });
        }, 50);
    }
    
    // hide submit button & display change password button
    $('#submitBtn').attr('hidden', true);
    $('#changePasswordBtn').removeAttr('hidden');
}

$(document).on('input', '.otp-box', function () {
    if (this.value.length === 1) {
        const nextBox = $(this).next('.otp-box');
        if (nextBox.length > 0) {
            nextBox.focus();
        } else {
            // Last box filled – check all boxes and verify
            verifyEnteredOTP();
        }
    }
});
  
$(document).on('keydown', '.otp-box', function (e) {
  if (e.key === "Backspace" && this.value === '') {
      $(this).prev('.otp-box').focus();
  }
});

function verifyEnteredOTP() {
    let enteredOTP = '';
    
    for (let i = 0; i < 6; i++) {
        const digit = $('#otp' + i).val();
        if (!digit) {
            return; 
        }
        enteredOTP += digit;
    }

    if (enteredOTP === receivedOTP) {
        //$('#statusMessage').text('✅ OTP is Match').css('color', 'green').show();
        $('#statusMessage').text('OTP is Match').css('color', 'green').show();
        // displaying the New Password & Confirmed Password field
        displayPasswordResetBlock();
        // $('#resetPasswordBlock').removeAttr('hidden');
        
    } else {
        // $('#statusMessage').text('❌ OTP is not valid').css('color', 'red').show();
    	$('#statusMessage').text('OTP is not valid').css('color', 'red').show();
    }

    // Clear message after 3 seconds
    setTimeout(function () {
        $('#statusMessage').text('');
    }, 3000);
}

function forgotPassword(){
				  
	  let newPassword = $('#newPassword').val() || '';
	  let confirmedPassword = $('#confirmedPassword').val() || '';
	  let userEmail = $('#email').val() || '';
	  
	  if(userEmail === ''){
		  showAlert('Warning', 'Please enter the email!');
		  return;
	  }
	  
	  if(newPassword === ''){
		  showAlert('Warning', "Please Enter New Password!");
		  return;
	  }
	  
	  if(confirmedPassword === ''){
		  showAlert('Warning', "Please Enter Confirmed Password!");
		  return;
	  }
	  
	  if(newPassword != confirmedPassword){
		  showAlert('Warning', 'Password should be Match!');
		  return;
	  }
	  
	  // Ajax call with email & newPassword
	  $('#changePasswordBtn').prop('disabled', true); // Disable button during AJAX

	      $.ajax({
	          url: '/resetPassword',
	          type: 'POST',
	          data: {
	              email: userEmail,
	              newPassword: newPassword
	          },
	          success: function(resp) {
	              console.log("resp :: ", resp);
	              // Show success alert with redirect callback
	              showAlert('success', resp.message || 'Password reset successfully!', function() {
	                  window.location.href = '/login';
	              });
	              $('#changePasswordBtn').prop('disabled', false); // Re-enable button
	          },
	          error: function(error) {
	              const errorMessage = error.responseJSON?.message || 'Failed to reset password.';
	              $('#statusMessage').text(errorMessage).css('color', 'red').show();
	              showAlert('error', errorMessage);
	              $('#changePasswordBtn').prop('disabled', false); // Re-enable button
	          }
	      });
	  
  }
  
  function checkNewPasswordStrenth(){
	
	const password = document.getElementById('newPassword').value;
	    const feedback = document.getElementById('newPasswordFeedback');
	    const strength = getPasswordStrength(password);

	    if (password.length === 0) {
	        feedback.textContent = '';
	        return;
	    }

	    feedback.textContent = strength.text;
	    feedback.style.color = strength.color;
  }
  
  function checkConfirmedPasswordStrenth(){
	const newPassword = document.getElementById('newPassword').value;
	const password = document.getElementById('confirmedPassword').value;
    const feedback = document.getElementById('confirmedPasswordFeedback');
    const strength = getPasswordStrength(password);
	const statusMessage = document.getElementById('statusMessage');

    if (password.length === 0) {
        feedback.textContent = '';
        return;
    }

    feedback.textContent = strength.text;
    feedback.style.color = strength.color;
	
	if(newPassword === password){
		statusMessage.innerText = "Password Match";
		statusMessage.style.color = 'green';
	}else{
		statusMessage.innerText = "Password not Match";
		statusMessage.style.color = 'red';
	}
  }
  
  function getPasswordStrength(password){
	let strength = 0;
	if(password.length >= 8){
		strength++;
	}
	if (/[A-Z]/.test(password)) strength++;
	   if (/[0-9]/.test(password)) strength++;
	   if (/[^A-Za-z0-9]/.test(password)) strength++; // Special character

	   if (strength <= 1) {
	       return { text: 'Weak', color: 'red' };
	   } else if (strength === 2 || strength === 3) {
	       return { text: 'Medium', color: 'orange' };
	   } else {
	       return { text: 'Strong', color: 'green' };
	   }
  }
  
  function toggleNewPassword(){
	  const newPasswordField = document.getElementById('newPassword');
	  const newPassEyeIcon = document.getElementById('newPassEyeIcon');
	  
      const isPassword = newPasswordField.type === 'password';
      newPasswordField.type = isPassword ? 'text' : 'password';

      // Toggle both eye and eye-slash icons
      newPassEyeIcon.classList.toggle('fa-eye');
      newPassEyeIcon.classList.toggle('fa-eye-slash');
	
  }
  
  function toggleConfirmedPassword(){
	const confirmPasswordField = document.getElementById('confirmedPassword');
	const confirmedPassEyeIcon = document.getElementById('confirmedPassEyeIcon');
	
	const isPassword = confirmPasswordField.type === 'password';
	confirmPasswordField.type = isPassword ? 'text' : 'password';
	
	confirmedPassEyeIcon.classList.toggle('fa-eye');
	confirmedPassEyeIcon.classList.toggle('fa-eye-slash');
  }