class RecipesController < ApplicationController
  def index
    @recipes = Recipe.search(params[:cuisine], params[:ingredient])
  end
end
