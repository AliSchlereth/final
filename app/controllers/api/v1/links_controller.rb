class Api::V1::LinksController < ApplicationController

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      render json: @link, status: 201
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def update
    @link = Link.find params[:id]
    if params[:read] == "true"
      mark_as_read
    else
      mark_as_unread
    end
  end

  private

  def mark_as_read
    @link.assign_attributes link_params
    just_read = @link.read_changed? && @link.read
    if @link.save
      service = HotReadsService.new(@link)
      service.update
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def mark_as_unread
    @link.assign_attributes link_params
    if @link.save
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  def link_params
    params.permit(:title, :url, :read)
  end
end
