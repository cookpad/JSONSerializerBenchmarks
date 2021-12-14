Rails.application.routes.draw do
  namespace :benchmark, constraints: { format: :json } do
    namespace(:active_model_serializers) { resources :recipes }
    namespace(:alba) { resources :recipes }
    namespace(:blueprinter) { resources :recipes }
    namespace(:j_builder) { resources :recipes }
    namespace(:panko) { resources :recipes }
  end
end
