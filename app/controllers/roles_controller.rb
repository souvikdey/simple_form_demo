class RolesController < ApplicationController
  def index
    @roles = Roles.all
  end

  def new
    @roles = Roles.new
  end

  def create
    @roles = Roles.new(params[:roles])
    if @roles.save
      redirect_to @roles, :notice => "Successfully created roles."
    else
      render :action => 'new'
    end
  end

  def show
    @roles = Roles.find(params[:id])
  end
end
