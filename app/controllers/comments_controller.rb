class CommentsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comment.build
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comment.create(comment: params[:comment], recipe_id: params[:recipe_id])
    if @comment.save
      flash[:notice] = 'comment was successfully added'
      redirect_to recipes_path
    end
  end


end