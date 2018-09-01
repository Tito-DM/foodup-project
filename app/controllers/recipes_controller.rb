class RecipesController < ApplicationController
   before_action :set_user,only: [:new,:edit,:update,:show,:destroy,:create]
  before_action :require_user, except: [:index,:view]
  before_action :require_same_user, only: [:edit,:update,:show,:destroy]
  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = @user.recipes.build
  end

  def create
    @recipe = @user.recipes.create(recip_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to user_recipe_path(@user.id, @recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = @user.recipes.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    redirect_to user_path(@user.id) if @recipe.update(recip_params)
  end


  def show
    @recipe = @user.recipes.find(params[:id])
  end

  def destroy
    @recipe =  @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to user_path(@user.id)
  end

  def view
    @recipe = Recipe.find(params[:id])
  end


   private
  def recip_params
    params.require(:recipe).permit(:name, :origin, :description, :image)
  end

  def require_same_user
    @recipe = @user.recipes.find(params[:id])
    if current_user != @recipe.user
      flash[:denger] = 'you can only edit or delete your recipe'
      redirect_to root_path
    end
  end

   def set_user
    @user = User.find(params[:user_id])
  end

end