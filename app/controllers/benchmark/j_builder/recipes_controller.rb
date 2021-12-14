module Benchmark
  module JBuilder
    class RecipesController < ApplicationController
      def index
        @recipes = Recipe.for_benchmark_index
        # See views/benchmark/j_builder/ for templates
      end
    end
  end
end
