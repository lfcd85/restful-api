class RecipesController < ApplicationController
  def index
    @recipes = Recipe.select(:id, :title, :making_time, :serves, :ingredients, :cost)
    render json: { recipes: @recipes }
  end

  def show
    @recipe = Recipe.select(:title, :making_time, :serves, :ingredients, :cost).find(params[:id])
    render json: {
      message: "Recipe details by id",
      recipe: [
        @recipe.as_json(except: :id)
      ]
    }
  end

  def create
  end

  def update
  end

  def destroy
  end
end
