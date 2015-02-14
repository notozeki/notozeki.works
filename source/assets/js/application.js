//= require "jquery"
//= require "bootstrap-sprockets"

(function () {
  if (sessionStorage === undefined) {
    console.warn("Your browser does not support sessionStorage. Some features will be disabled.");
    return;
  }

  function openingAnimation() {
    // Once the animation was played, never play again during this session.
    if (sessionStorage.getItem('openingAnimationPlayed') == 'true') return;

    var container = document.getElementsByClassName('container')[0];
    var oldDisplayStyle = container.style.display;
    container.style.display = 'none';

    // Animation will start after the loading is completed.
    window.onload = function () {
      container.style.display = oldDisplayStyle;
      container.className += ' animate';
      sessionStorage.setItem('openingAnimationPlayed', 'true');
    };
  }

  document.addEventListener('DOMContentLoaded', openingAnimation, false);
})();
