// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'

import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap-icons/font/bootstrap-icons.css";
import "bootstrap";

import Choices from "choices.js";
import "choices.js/public/assets/styles/choices.min.css";

console.log("Bootstrap e Bootstrap Icons carregados com sucesso ⚡️");
console.log("Choices.js carregado com sucesso ⚡️");


import "./css/home.css"                    
import "./css/favorites.css"    
import "./css/navbar.css"  
import "./css/footer.css"         

import "./css/users.css"                
import "./css/form_users.css"              
import "./css/usersShow.css"               

import "./css/stylesIndex.css"             
import "./css/styleForm.css"               
import "./css/showStyle.css"               

import "./css/bands.css"                   
import "./css/bandForm.css"                
import "./css/bandShow.css"                

import "./css/genres.css"                  
import "./css/genreForm.css"               
import "./css/genreShow.css"               

import "./css/albums.css"                  
import "./css/albumForm.css"               
import "./css/showAlbum.css"               


import "./css/reviews.css"                 
import "./css/reviewForm.css"              
import "./css/showReview.css"              
import "./css/albums_reviews.css"          

import { initFavorites } from "./js/favorites";
import { initializeUserForm } from "./js/userForm";
import { initializeStyleForm } from "./js/styleForm";
import { initializeBandForm } from "./js/bandForm";
import { initializeGenreForm } from "./js/genreForm";
import { initializeReviewForm } from "./js/reviewForm";
import { initializeDropdownSubmenus } from "./js/handleSubMenu";

document.addEventListener("DOMContentLoaded", () => {
  const multipleSelects = document.querySelectorAll("select[multiple]");
  multipleSelects.forEach((select) => {
    new Choices(select, {
      removeItemButton: true,
      searchEnabled: true,
      shouldSort: false
    });
  });

  initFavorites()
  initializeUserForm()
  initializeStyleForm()
  initializeBandForm()
  initializeGenreForm()
  initializeReviewForm()
  initializeDropdownSubmenus()
});