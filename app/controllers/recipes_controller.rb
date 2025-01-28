class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ edit update destroy ]

  inertia_share flash: -> { flash.to_hash }

  # GET /recipes
  def index
    @recipes = Recipe.all
    render inertia: "Recipe/Index", props: {
      recipes: @recipes.map do |recipe|
        serialize_recipe(recipe)
      end
    }
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    render inertia: "Recipe/New", props: {
      recipe: serialize_recipe(@recipe)
    }
  end

  # GET /recipes/1/edit
  def edit
    render inertia: "Recipe/Edit", props: {
      recipe: serialize_recipe(@recipe)
    }
  end

  # recipe /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @Recipe.save
      redirect_to @recipe, notice: "recipe was successfully created."
    else
      redirect_to new_recipe_url, inertia: { errors: @recipe.errors }
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "recipe was successfully updated."
    else
      redirect_to edit_recipe_url(@recipe), inertia: { errors: @recipe.errors }
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy!
    redirect_to recipes_url, notice: "recipe was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(:name)
    end

    def serialize_recipe(recipe)
      recipe.as_json(only: [
        :id, :name
      ])
    end
end
