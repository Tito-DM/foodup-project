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
      render recipe_path(params[:recipe_id])
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

   private
  def recip_params
      params.require(:recipe).permit(:name, :origin)
  end

end