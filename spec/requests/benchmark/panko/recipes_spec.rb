require 'rails_helper'

RSpec.describe "Benchmark::Panko::Recipes", type: :request do
  it_behaves_like "Benchmark Spec", "panko"
end
