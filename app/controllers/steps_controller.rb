class StepsController < ApplicationController

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step =  @recipe.steps.new(step: params[:step])

    if @step.save
      flash[:notice] = 'Step was successfully add'
      redirect_to recipe_path(params[:recipe_id]) and return
    else
      flash[:notice] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to recipe_path(params[:recipe_id]) and return
    end
  end

  def show
    @recipe =  Recipe.find(recip_params)
    @step   = @recipe.steps.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @step   = @recipe.steps.find(params[:id])
  end

  def update
    @recipe =  Recipe.find(params[:recipe_id])
    @step  = @recipe.steps.find(params[:id])
    if @step.update_attributes(step: params[:step])
    flash[:notice] = 'step was successfully deleted'
    redirect_to recipe_path(@step.recipe.id)
    end

  end

  def destroy
    @recipe =  Recipe.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])
    if @step.destroy
    flash[:notice] = 'step was successfully deleted'
    redirect_to recipe_path(@step.recipe.id)
    end
  end

  private
  def errors_message
    @step.errors.full_messages.each do |msg|
      message = msg
    end
  end

end