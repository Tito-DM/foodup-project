class DislikesController < ApplicationController
  before_action :require_user

  def index
    @user =  User.find(params[:user_id])
    @recipe =  Recipe.find(params[:recipe_id])
    @dislike = @recipe.dislike.new
    @dislike.user = @user
    redirect_to root_path and return  if @dislike.save
  end
end
