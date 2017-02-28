module ApplicationHelper

  def link_read_status(link)
    if link.read == true
      "denote-read"
    else
      "denote-unread"
    end
  end

end
