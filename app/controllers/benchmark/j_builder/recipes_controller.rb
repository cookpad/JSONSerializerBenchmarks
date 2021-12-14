module Benchmark
  module JBuilder
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.for_benchmark_index
      end
    end
  end
end
