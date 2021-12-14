module Benchmark
  module Blueprinter
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.for_benchmark_index
        render json: RecipeSerializer.render(@recipes, root: :data, meta: { page: 2, per_page: 20 })
      end
    end
  end
end