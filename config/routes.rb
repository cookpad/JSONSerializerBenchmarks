Rails.application.routes.draw do
  namespace :benchmark, constraints: { format: :json } do
    namespace :j_builder do
      resources :recipes
    end
    namespace :blueprinter do
      resources :recipes
    end
    namespace :json_api_resources do
      resources :recipes
    end
    namespace :fast_json do
      resources :recipes
    end
    namespace :jsonapi_rb do
      resources :recipes
    end
    namespace :active_model_serializers do
      resources :recipes
    end
  end
end
