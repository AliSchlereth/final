module ApplicationHelper

  def link_read_status(link)
    if link.read == true
      "denote-read"
    else
      "not-read"
    end
  end

end
