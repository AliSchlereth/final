class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links
      @hot_links = current_user.links.hot
    else
      redirect_to :login
    end
  end

  def edit
    @link = Link.find(params[:id])
  end
end
