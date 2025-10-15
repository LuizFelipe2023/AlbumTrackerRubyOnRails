export function initializeGenreForm() {
  const form = document.querySelector('.genre-form');
  
  if (!form) return;

  const nameInput = form.querySelector('#genre_name');
  
  if (nameInput) {
    nameInput.addEventListener('focus', function() {
      this.style.borderColor = '#333';
      this.style.boxShadow = '0 0 0 2px rgba(51, 51, 51, 0.1)';
    });
    
    nameInput.addEventListener('blur', function() {
      this.style.boxShadow = 'none';
      if (!this.value && this.hasAttribute('required')) {
        this.style.borderColor = '#e0e0e0';
      }
    });

    nameInput.addEventListener('input', function() {
      if (!this.value.trim()) {
        this.classList.add('is-invalid');
        this.classList.remove('is-valid');
      } else {
        this.classList.remove('is-invalid');
        this.classList.add('is-valid');
      }
    });

    if (!nameInput.value.trim() && nameInput.hasAttribute('required')) {
      nameInput.classList.add('is-invalid');
    } else if (nameInput.value.trim()) {
      nameInput.classList.add('is-valid');
    }
  }
}