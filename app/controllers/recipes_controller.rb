class RecipesController < ApplicationController
  protect_from_forgery

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
    begin
      params.require([:title, :making_time, :serves, :ingredients, :cost])
    rescue ActionController::ParameterMissing
      return render json: {
        message: "Recipe creation failed!",
        required: "title, making_time, serves, ingredients, cost"
      }
    end

    @recipe = Recipe.create(params[:recipe].permit(:title, :making_time, :serves, :ingredients, :cost))
    render json: {
      message: "Recipe successfully created!",
      recipe: [
        @recipe.as_json(only: [:title, :making_time, :serves, :ingredients, :cost])
      ]
    }
  end

  def update
    @recipe = Recipe.update(params[:id], params[:recipe].permit(:title, :making_time, :serves, :ingredients, :cost))
    render json: {
      message: "Recipe successfully updated!",
      recipe: [
        @recipe.as_json(only: [:title, :making_time, :serves, :ingredients, :cost])
      ]
    }
  end

  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe.nil?
      return render json: { message: "No Recipe found" }, status: 404
    end

    @recipe.destroy!
    render json: { message: "Recipe successfully removed!" }
  end
end
