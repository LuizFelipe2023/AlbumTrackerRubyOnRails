export function initFavorites() {
  document.querySelectorAll(".favorite-btn").forEach((button) => {
    button.addEventListener("click", async () => {
      const type = button.dataset.favoritableType;
      const id = button.dataset.favoritableId;
      const favorited = button.dataset.favorited === "true";

      try {
        let response, data;

        if (!favorited) {
          response = await fetch("/favorites", {
            method: "POST",
            headers: {
              "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
              "Content-Type": "application/json",
              "Accept": "application/json",
            },
            body: JSON.stringify({ [`${type.toLowerCase()}_id`]: id }),
          });
          data = await response.json();

          button.classList.remove("btn-outline-primary");
          button.classList.add("btn-outline-danger");
          button.dataset.favorited = "true";
          button.dataset.favoriteId = data.favorite_id; // salva o ID retornado pelo Rails
          button.innerHTML = '<i class="bi bi-heart-fill"></i>';
        } else {
          const favoriteId = button.dataset.favoriteId;
          response = await fetch(`/favorites/${favoriteId}`, {
            method: "DELETE",
            headers: {
              "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
              "Accept": "application/json",
            },
          });
          data = await response.json();

          button.classList.remove("btn-outline-danger");
          button.classList.add("btn-outline-primary");
          button.dataset.favorited = "false";
          button.dataset.favoriteId = "";
          button.innerHTML = '<i class="bi bi-heart"></i>';
        }

        const countBadge = document.querySelector(
          `[data-count-type="${type}"][data-count-id="${id}"]`
        );
        if (countBadge) {
          const currentCount = parseInt(countBadge.textContent.match(/\d+/)) || 0;
          const newCount = data.status === "added" ? currentCount + 1 : currentCount - 1;
          countBadge.innerHTML = `<i class="bi bi-heart me-1"></i>${newCount}`;
        }
      } catch (error) {
        console.error("Erro ao atualizar favorito:", error);
      }
    });
  });
}
