class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @user = current_user
    @links = current_user.links if current_user
  end
end
