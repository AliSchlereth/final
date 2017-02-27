class LinksController < ApplicationController
  def index
    if current_user
      @links = current_user.links.reverse
      @hot_links = Link.hot
    else
      redirect_to :login
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      redirect_to root_path
    else
      flash[:danger] = @link.errors.full_messages[0]
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
