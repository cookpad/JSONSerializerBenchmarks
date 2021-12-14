module Benchmark
  module Alba
    class RecipeSerializer < SerializerBase
      include ::Alba::Resource
      attributes :title, :content, :state

      attributes created_at: cast_as_xml_datetime,
                 updated_at: cast_as_xml_datetime,
                 published_at: cast_as_xml_datetime

      one :user, resource: UserSerializer, key: :author
      many :comments, resource: CommentSerializer
    end
  end
end
