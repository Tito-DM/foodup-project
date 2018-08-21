class RecipesController < ApplicationController

  def index
    @recipe = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe =  Recipe.new(recip_params)
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

   private
  def recip_params
    params.require(:recipe).permit(:name, :origin, :description)
  end

end