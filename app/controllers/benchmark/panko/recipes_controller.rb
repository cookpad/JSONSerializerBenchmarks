module Benchmark
  module Panko
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.for_benchmark_index
        render json: {
          data: ::Panko::ArraySerializer.new(@recipes, each_serializer: RecipeSerializer).to_a,
          meta: { page: 2, per_page: 20}
        }
      end
    end
  end
end
