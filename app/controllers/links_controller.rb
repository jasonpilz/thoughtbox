class LinksController < ApplicationController

  def index
    if current_user
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
    else
      flash[:error] = "Invalid link"
    end
    redirect_to root_path
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end
end
