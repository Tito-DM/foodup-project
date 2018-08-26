class StepsController < ApplicationController

  def create
    @user =  User.find(params[:user_id])
    @recipe = Recipe.find(params[:recipe_id])
    @step =  @recipe.steps.new(step: params[:step])

    if @step.save
      flash[:notice] = 'Step was successfully add'
      redirect_to user_recipe_path(params[:user_id],params[:recipe_id]) and return
    else
      flash[:notice] = errors_message.to_s.gsub!(/[\[\"\]]/, "")
      redirect_to user_recipe_path(params[:user_id],params[:recipe_id]) and return
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.find(params[:recipe_id])
    @step   = @recipe.steps.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipe.find(params[:recipe_id])
    @step  = @recipe.steps.find(params[:id])
    if @step.update(step_params)
    flash[:notice] = 'step was successfully deleted'
    redirect_to user_recipe_path(@user.id, @recipe.id)
    end

  end

  def destroy

    @user = User.find(params[:user_id])
    @recipe =  @user.recipe.find(params[:recipe_id])
    @step = @recipe.steps.find(params[:id])
    if @step.destroy
    flash[:notice] = 'step was successfully deleted'
    redirect_to user_recipe_path(@user.id, @recipe.id)
    end
  end

  private
  def errors_message
    @step.errors.full_messages.each do |msg|
      message = msg
    end
  end

  def step_params
    params.require(:step).permit(:step)
  end

end