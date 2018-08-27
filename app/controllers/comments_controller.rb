class CommentsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:recipe_id])
    @comment = @recipe.comment.build
  end

  def create
    @user = User.find(params[:user_id])
    @recipe =  @user.recipes.find(params[:recipe_id])
    @comment = @recipe.comment.create(comment: params[:comment], recipe_id: params[:recipe_id])
    if @comment.save
      flash[:notice] = 'comment was successfully added'
      redirect_to user_recipes_path(@user.id)
    end
  end


end