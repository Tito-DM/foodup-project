class StepsController < ApplicationController

  def create

    @step = Step.new(step: params[:step])
    @step.recipe = Recipe.find(params[:recipe_id])

    if @step.save
    flash[:notice] = 'Step was successfully add'
    redirect_to recipe_path(params[:recipe_id]) and return
    else
      flash[:notice] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to recipe_path(params[:recipe_id]) and return
    end
  end

  private
  def errors_message
     @step.errors.full_messages.each do |msg|
      message = msg
    end
  end

end