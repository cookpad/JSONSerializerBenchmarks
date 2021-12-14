require "rails_helper"

RSpec.describe "Benchmark::Blueprinter::Recipes", type: :request do
  it_behaves_like "Benchmark Spec", "blueprinter"
end
