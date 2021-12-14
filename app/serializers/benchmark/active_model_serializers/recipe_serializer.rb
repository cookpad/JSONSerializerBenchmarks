module Benchmark
  module ActiveModelSerializers
    class RecipeSerializer < SerializerBase
      attributes :id, :title, :content, :state

      attribute(:created_at) { object.created_at.xmlschema }
      attribute(:updated_at) { object.updated_at.xmlschema }
      attribute(:published_at) { object.published_at.try(:xmlschema) }

      belongs_to :user, serializer: UserSerializer, key: "author"

      has_many :comments
    end
  end
end
