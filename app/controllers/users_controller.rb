class UsersController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_url, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
end
