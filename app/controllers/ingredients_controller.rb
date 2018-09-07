class IngredientsController < ApplicationController


  def create
    @user =  User.find(params[:user_id])
    @recipe =  Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.create(ingredient: params[:ingredient], qty: params[:qty])
    if @ingredient.save
      flash[:success] = 'Ingredient was successfully add'
      redirect_to user_recipe_path(params[:user_id],params[:recipe_id]) and return
    else
      flash[:success] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to user_recipe_path(params[:user_id],params[:recipe_id]) and return
    end
  end


  def edit
    @user = User.find(params[:user_id])
    @recipe =  @user.recipes.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe =  @user.recipes.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    if @ingredient.update(ingredient_params)
    flash[:success] = 'Ingredient was successfully edited'
    redirect_to user_recipe_path(@user.id, @recipe.id)
    end

  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:recipe_id])
    @ingredient = @recipe.ingredient.find(params[:id])
    if @ingredient.destroy
    flash[:success] = 'Ingredient was successfully deleted'
    redirect_to user_recipe_path(@user.id, @recipe.id)
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
