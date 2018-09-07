class RecipesController < ApplicationController
  before_action :set_user,only: [:new,:edit,:update,:show,:destroy,:create]
  before_action :require_user, except: [:index,:view]
  before_action :require_same_user, only: [:edit,:update,:show,:destroy]

  def index
    @recipe = Recipe.all.order(created_at: :desc)
    return @recipe = Recipe.where("name LIKE ? ", "%#{params[:search_field].downcase}%").all if params[:search] == 'name'
    return @recipe = Recipe.where("origin LIKE ? ", "%#{params[:search_field].downcase}%").all if params[:search] == 'origin'
    return @recipe = Recipe.joins(:user).where(:users => {:name => "%#{params[:search_field].downcase}%"})  if params[:search] =='create_by'
  end


  def new
    @recipe = @user.recipes.build
  end

  def create
    @recipe = @user.recipes.create(recip_params)
    if @recipe.save
      flash[:success] = 'Recipe was successfully created'
      redirect_to user_recipe_path(@user.id, @recipe)
    else
      render 'new'
    end
  end

  def edit
    @recipe = @user.recipes.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
    if params[:format]
      @recipe.update_attribute(:dislike,"#{params[:format].to_i}")
    end
    redirect_to user_path(@user.id) if @recipe.update(recip_params)
  end


  def show
    @recipe = @user.recipes.find(params[:id])
  end

  def destroy
    @recipe =  @user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to user_path(@user.id)
  end

  def view
    @recipe = Recipe.find(params[:id])
  end

  def dislike
     @user = User.find(params[:user_id])
     @recipe = Recipe.find(params[:id])
     @check = Recipe.check_dislike(@recipe,@user)
     if @check
      flash[:danger] = "u can only dislike or love it once"
      redirect_to root_path
     else
      redirect_to user_recipe_dislikes_path(@user,@recipe)
     end
  end

   def favorite
     @user = User.find(params[:user_id])
     @recipe = Recipe.find(params[:id])
     @check = Recipe.check_favorite(@recipe,@user)
     if @check
      flash[:danger] = "u can only dislike or love it once"
      redirect_to root_path
     else
     redirect_to user_recipe_favorites_path(@user,@recipe)
     end
  end


   private
  def recip_params
    params.require(:recipe).permit(:name, :origin, :description, :image)
  end

  def require_same_user
    @recipe = @user.recipes.find(params[:id])
    if current_user != @recipe.user
      flash[:denger] = 'you can only edit or delete your recipe'
      redirect_to root_path
    end
  end

   def set_user
    @user = User.find(params[:user_id])
  end

end


