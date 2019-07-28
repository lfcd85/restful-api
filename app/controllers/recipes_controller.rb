class RecipesController < ApplicationController
  def index
    @recipes = Recipe.select(:id, :title, :making_time, :serves, :ingredients, :cost)
    render json: { recipes: @recipes }
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end
end
