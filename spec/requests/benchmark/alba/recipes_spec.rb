require 'rails_helper'

RSpec.describe "Benchmark::Alba::Recipes", type: :request do
  it_behaves_like "Benchmark Spec", "alba"
end
