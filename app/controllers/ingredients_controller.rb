class IngredientsController < ApplicationController

  def new
    @recipe =  Recipe.new
    @ingredient = @recipe.ingredient.build
  end

  def create
    @recipe =  Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.create(ingredient: params[:ingredient], qty: params[:qty])
    if @ingredient.save

      flash[:notice] = 'Ingredient was successfully add'
      redirect_to recipe_path(params[:recipe_id]) and return
    else
      flash[:notice] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to recipe_path(params[:recipe_id]) and return
    end
  end

   def show
    @recipe =  Recipe.find(recip_params)
    @ingredient = @recipe.ingredient.find(params[:id])
  end

  def edit
    @recipe =  Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
  end

  def update
    @recipe =  Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    @ingredient.update_attributes(ingredient: params[:ingredient], qty: params[:qty])
    flash[:notice] = 'Ingredient was successfully deleted'
    redirect_to recipe_path( @ingredient.recipe.id)

  end

  def destroy
    @recipe =  Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    if @ingredient.destroy
    flash[:notice] = 'Ingredient was successfully deleted'
    redirect_to recipe_path( @ingredient.recipe.id)
    end
  end

  private
  def errors_message
    @ingredient.errors.full_messages.each do |msg|
      message = msg
    end
  end

  def ingredient_params
    params.require(:ingredient).permit(:ingredient, :qty)
  end

end
