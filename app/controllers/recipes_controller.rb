class RecipesController < ApplicationController

  def index
    @recipe = Recipe.all
  end

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.build
  end

  def create
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.create(recip_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to user_recipe_path(@user.id, @recipe)
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.find(params[:id])
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.find(params[:id])
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe =  @user.recipe.find(params[:id])
    @recipe.destroy
    redirect_to user_path(@user.id)
  end

  def view
    @recipe = Recipe.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.find(params[:id])
    redirect_to user_path(@user.id) if @recipe.update(recip_params)
  end

   private
  def recip_params
    params.require(:recipe).permit(:name, :origin, :description)
  end

end