var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-unread', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: false}
    })
    .done(updateUnReadStatus)
    .fail(onFail);
  })
})

function updateUnReadStatus(data) {
  var linkID = data.id;
  $('#link-' + linkID).children('.link_read').html("false");
  var markUnReadButton = $('#link-' + linkID).children('.link_buttons').children('.mark-unread');
  markUnReadButton.removeClass('mark-unread').addClass('mark-read').html("Mark as Read");
  $('#link-' + linkID).removeClass('denote-read');
}

function onFail(errors) {
  console.error(errors);
}
