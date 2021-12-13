require 'rails_helper'

RSpec.describe "Benchmark::JBuilder::Recipes", type: :request do
  it_behaves_like "Benchmark Spec", "j_builder"
end
