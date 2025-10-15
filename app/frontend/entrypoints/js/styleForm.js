export function initializeStyleForm() {
  const form = document.querySelector('.style-form');
  
  if (!form) return;

  const inputs = form.querySelectorAll('.form-control, .form-select');
  
  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.style.borderColor = '#333';
    });
    
    input.addEventListener('blur', function() {
      if (!this.value) {
        this.style.borderColor = '#e0e0e0';
      }
    });
  });
}