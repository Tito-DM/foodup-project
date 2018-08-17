class IngredientsController < ApplicationController

  def new
  end

  def create
    @ingredient = Ingredient.new(ingredient: params[:ingredient], qty: params[:qty])
    @ingredient.save
    flash[:notice] = 'Ingredient was successfully add'
    redirect_to recipe_path(params[:recipe_id])
  end


end
