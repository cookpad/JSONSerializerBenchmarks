module Benchmark
  module Panko
    class RecipeSerializer < SerializerBase
      attributes :title, :content, :state, :published_at, :created_at, :updated_at
      has_many :comments, serializer: CommentSerializer
      has_one :user, serializer: UserSerializer, name: :author

      def created_at
        object.created_at.xmlschema
      end

      def updated_at
        object.updated_at.xmlschema
      end

      def published_at
        object.published_at.xmlschema
      end
    end
  end
end
