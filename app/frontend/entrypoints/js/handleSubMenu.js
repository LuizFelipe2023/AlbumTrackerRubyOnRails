export function initializeDropdownSubmenus() {
  const dropdownSubmenus = document.querySelectorAll('.dropend');
  
  dropdownSubmenus.forEach(function(item) {
    item.addEventListener('mouseenter', function() {
      const submenu = this.querySelector('.dropdown-menu');
      if (submenu) {
        submenu.classList.add('show');
      }
    });
    
    item.addEventListener('mouseleave', function() {
      const submenu = this.querySelector('.dropdown-menu');
      if (submenu) {
        submenu.classList.remove('show');
      }
    });
  });
  
  document.addEventListener('click', function(e) {
    if (!e.target.matches('.dropdown-toggle')) {
      const openDropdowns = document.querySelectorAll('.dropdown-menu.show');
      openDropdowns.forEach(function(dropdown) {
        dropdown.classList.remove('show');
      });
    }
  });
}

// Para uso imediato (opcional)
// document.addEventListener('DOMContentLoaded', initializeDropdownSubmenus);