class StepsController < ApplicationController

  def create

    @step = Step.new(step: params[:step])
    @step.recipe = Recipe.find(params[:recipe_id])
    if @step.save
    flash[:notice] = 'Step was successfully add'
    redirect_to recipe_path(params[:recipe_id])
    else
      render recipe_path(params[:recipe_id])
    end
  end

end