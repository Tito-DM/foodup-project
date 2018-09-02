class DislikesController < ApplicationController
  def create
    @user =  User.find(params[:user_id])
    @recipe =  Recipe.find(params[:recipe_id])
    @dislike = @recipe.dislike.create(dislike: params[:format].to_i)
    redirect_to root_path and return  if @dislike.save
  end
end
