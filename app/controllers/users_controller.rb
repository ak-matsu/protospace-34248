class UsersController < ApplicationController

  
  def show
    # binding.pry
    @user = User.find(params[:id])
    @name = @user.name
    @comments = @user.comments
    @prototype = @user.prototypes
  end

end