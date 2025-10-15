export function initializeUserForm() {
  const form = document.querySelector('.user-form');
  
  if (!form) return;

  const inputs = form.querySelectorAll('.form-control');
  

  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.parentElement.classList.add('focused');
    });
    
    input.addEventListener('blur', function() {
      this.parentElement.classList.remove('focused');
    });
  });
  
  const password = document.getElementById('user_password');
  const passwordConfirmation = document.getElementById('user_password_confirmation');
  
  if (password && passwordConfirmation) {
    function validatePassword() {
      if (password.value !== passwordConfirmation.value) {
        passwordConfirmation.classList.add('is-invalid');
      } else {
        passwordConfirmation.classList.remove('is-invalid');
      }
    }
    
    password.addEventListener('input', validatePassword);
    passwordConfirmation.addEventListener('input', validatePassword);
  }
}