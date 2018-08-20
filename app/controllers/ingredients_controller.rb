class IngredientsController < ApplicationController

  def new
  end

  def create
    @ingredient = Ingredient.new(ingredient: params[:ingredient], qty: params[:qty])
    @ingredient.recipe = Recipe.find(params[:recipe_id])
    if @ingredient.save

      flash[:notice] = 'Ingredient was successfully add'
      redirect_to recipe_path(params[:recipe_id]) and return
    else
      flash[:notice] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to recipe_path(params[:recipe_id]) and return
    end
  end

   def show

    @ingredient = Ingredient.find(params[:id])
  end

  def errors_message
    @ingredient.errors.full_messages.each do |msg|
      message = msg
    end

  end

end
