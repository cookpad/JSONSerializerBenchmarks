module Benchmark
  module ActiveModelSerializers
    class RecipesController < ApplicationController
      require "active_model_serializers/adapter/json"
      def index
        @recipes = Recipe.for_benchmark_index
        render json: ::ActiveModelSerializers::SerializableResource.new(
          @recipes,
          each_serializer: RecipeSerializer,
          adapter: :json,
          meta: { page: 2, per_page: 20 },
          root: "data"
        ).to_json
      end
    end
  end
end
