require "rails_helper"

RSpec.describe "Benchmark::ActiveModelSerializers::Recipes", type: :request do
  it_behaves_like "Benchmark Spec", "active_model_serializers"
end
