module Benchmark
  module Blueprinter
    class RecipeSerializer < ::Blueprinter::Base
      identifier :id
      fields :title, :content, :created_at, :updated_at, :state, :published_at

      association :user, blueprint: UserSerializer, name: :author
      association :comments, blueprint: CommentSerializer

    end
  end
end
