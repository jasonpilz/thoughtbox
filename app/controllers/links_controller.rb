class LinksController < ApplicationController
  def index
    redirect_to login_path unless current_user
    @user = current_user
  end
end
