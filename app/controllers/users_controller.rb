class UsersController < ApplicationController
  def index
  end
  def new
    @user = User.new
  end
  def show
    
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, :notice => 'user created'
    else
      render 'new', :error => 'some errors found'
    end
    
  end
end
