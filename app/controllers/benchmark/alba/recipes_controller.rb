module Benchmark
  module Alba
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.for_benchmark_index
        render json: RecipeSerializer.new(@recipes).serialize(root_key: "data", meta: { page: 2, per_page: 20 })
      end
    end
  end
end
