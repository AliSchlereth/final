var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){

  $('#links-list').on('click', 'button.mark-read', function(){
    var $this = $(this);
    var linkId = $this.parents('.link').data('id');

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    })
    .done(updateReadStatus)
    .fail(onFail);
  })
})

function updateReadStatus(data) {
  var linkID = data.id;
  $('#link-' + linkID).children('.link_read').html("true");
}

function onFail(errors) {
  console.error(errors);
}
