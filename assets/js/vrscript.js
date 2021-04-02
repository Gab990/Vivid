AFRAME.registerComponent('x-button-listener', {
    init: function () {
      let el = this.el;
      let obj = document.getElementById("handmenu");
      el.addEventListener('xbuttondown', function (evt) {
          //console.log("Button was pressed");
        obj.setAttribute('visible', !obj.getAttribute('visible'));
      });
    }
  });