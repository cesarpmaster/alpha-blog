export default function setupFlashMessages() {
  const FIVE_SECONDS = 5000;

  document.querySelectorAll(".flash_message").forEach(flashMessage => {
    window.setTimeout(() => {
      flashMessage.classList.add("hide");
    }, FIVE_SECONDS);
  });
};