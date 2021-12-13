class Benchmark::JBuilder::RecipesController < ApplicationController
  def index
    @recipes = Recipe.for_benchmark_index
  end
end
