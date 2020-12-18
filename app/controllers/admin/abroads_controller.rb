class Admin::AbroadsController < ApplicationController
  before_action:if_not_admin, only: [:index]
  
  def index
    @user = User.all
  end
  
  def new
    
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
