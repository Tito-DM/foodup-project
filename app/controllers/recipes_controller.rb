class RecipesController < ApplicationController

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
  end

   private
  def recip_params
      params.require(:recipe).permit(:name, :food_origen, :ingredient, :step)
  end

end