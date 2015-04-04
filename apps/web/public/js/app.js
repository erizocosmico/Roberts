$(document).ready(function() {
  $('select').material_select();
  $('.modal-trigger').leanModal();
  $(".button-collapse").sideNav();

  $('#cancel-modal-manage').click(function () {
    $('#modal-manage').closeModal();
  });

  var priorityRow = $('#priority-row');
  $('#action').change(function () {
    priorityRow['slide' + (this.value != 1 ? 'Up' : 'Down')]();
  });

  var footer = $('footer');
  var adjustFooter = function () {
    if (window.innerHeight > document.body.offsetHeight) {
      footer.css({
        position: 'fixed',
        bottom: 0,
        left: 0,
        right: 0
      });
    } else {
      footer.css({
        position: 'static'
      });
    }
  };

  adjustFooter();
  $(window).on('resize', adjustFooter);
});
