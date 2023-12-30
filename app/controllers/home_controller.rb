class HomeController < ApplicationController

  def index
    @recipes = Recipe.search(params[:cuisine], params[:ingredient])
  end

  def search
  end
end
