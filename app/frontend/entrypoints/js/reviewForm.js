export function initializeReviewForm() {
  const form = document.querySelector('.review-form');
  
  if (!form) return;

  const inputs = form.querySelectorAll('.form-control, .form-select');
  
  inputs.forEach(input => {
    input.addEventListener('focus', function() {
      this.style.borderColor = '#333';
      this.style.boxShadow = '0 0 0 2px rgba(51, 51, 51, 0.1)';
    });
    
    input.addEventListener('blur', function() {
      this.style.boxShadow = 'none';
      if (!this.value && this.hasAttribute('required')) {
        this.style.borderColor = '#e0e0e0';
      }
    });
  });

  const requiredFields = form.querySelectorAll('[required]');
  
  requiredFields.forEach(field => {
    field.addEventListener('input', function() {
      if (!this.value.trim()) {
        this.classList.add('is-invalid');
        this.classList.remove('is-valid');
      } else {
        this.classList.remove('is-invalid');
        this.classList.add('is-valid');
      }
    });

    if (!field.value.trim() && field.hasAttribute('required')) {
      field.classList.add('is-invalid');
    } else if (field.value.trim()) {
      field.classList.add('is-valid');
    }
  });

  const scoreField = form.querySelector('#review_score');
  if (scoreField) {
    scoreField.addEventListener('input', function() {
      const value = parseFloat(this.value);
      if (value < 0 || value > 10) {
        this.classList.add('is-invalid');
        this.classList.remove('is-valid');
      } else if (this.value.trim()) {
        this.classList.remove('is-invalid');
        this.classList.add('is-valid');
      }
    });
  }
}