class PrototypesController < ApplicationController
  # before_action :処理させたいメソッド名 only:オプション[:httpメソッド]
  # before_action :set_comment, only: [:edit, :show,]

  # except除外する
  before_action :move_to_index, except: [:index,:new,:create,:show]

  def index
    @prototypes = Prototype.all
    # @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else   
      render :new
    end  
  end

  def edit
    # binding.pry
    
    
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def update
    prototype = Prototype.find(params[:id])

    if prototype.update(prototype_params)
      redirect_to action: :show
    else
        render :create
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to action: :index
  end

  private
  def prototype_params
    params.require(:prototype).permit(:image, :title,:catch_copy,:concept).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      # user_signed_in?
      # user_signed_in? && current_user.id == @prototype.user_id

      redirect_to root_path
    end
  end

  # def set_comment
  #   @comment = Comment.find(params[:id])
  # end
end
