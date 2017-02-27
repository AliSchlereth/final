class LinksController < ApplicationController
  def index
    if current_user
      @hot_links = Link.hot
    else
      redirect_to :login
    end
  end
end
