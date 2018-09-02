class FavoritesController < ApplicationController
  def create
    @user =  User.find(params[:user_id])
    @recipe =  Recipe.find(params[:recipe_id])
    @favorite = @recipe.favorite.create(favorite: params[:format].to_i)
    redirect_to root_path and return if @favorite.save
end


end