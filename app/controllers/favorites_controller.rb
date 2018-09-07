class FavoritesController < ApplicationController
   before_action :require_user

  def index
    @user =  User.find(params[:user_id])
    @recipe =  Recipe.find(params[:recipe_id])
    @favorite =  @recipe.favorite.new
    @favorite.user = @user
    redirect_to root_path and return if @favorite.save
end


end