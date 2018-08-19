class StepsController < ApplicationController

  def create
    byebug
    @step = Step.new(step: params[:step])
    @step.save
    flash[:notice] = 'Step was successfully add'
    redirect_to recipe_path(params[:recipe_id])
  end

end