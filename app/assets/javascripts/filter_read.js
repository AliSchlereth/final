$(document).ready(function(){
  $('#read-button').on('click', filterByRead);
  $('#unread-button').on('click', filterByUnRead);
  $('#filter-input').on('keyup', filterBySearch);
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

function filterBySearch() {
  var input = this.value.toUpperCase();
  var allLinks = $('#links-list').children();
  var link, linkDiv;
  for (var i = 0; i < allLinks.length; i++) {
    linkDiv = document.getElementById(allLinks[i].id)
    link = $('#' + allLinks[i].id).children('.link-url, .link-title').text()
    if (link.toUpperCase().indexOf(input) > -1) {
      linkDiv.style.display = ""
    } else {
      linkDiv.style.display = "none"
    }
  }
}
