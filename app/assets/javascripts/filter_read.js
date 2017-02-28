$(document).ready(function(){
  $('#read-button').on('click', filterByRead);
  $('#unread-button').on('click', filterByUnRead);

})

function filterByRead() {
  var unReadLinks = $('#links-list').children('.denote-unread');
  for (i = 0; i < unReadLinks.length; i++) {
    document.getElementById(unReadLinks[i].id).style.display = "none";
  }
}

function filterByUnRead() {
  var readLinks = $('#links-list').children('.denote-read');
  for (i = 0; i < readLinks.length; i++) {
    document.getElementById(readLinks[i].id).style.display = "none";
  }
}
