module Benchmark
  module ActiveModelSerializers
    class CommentSerializer < SerializerBase
      attributes :id
      attribute :content
      attribute(:created_at) { object.created_at.xmlschema }
      attribute(:updated_at) { object.updated_at.xmlschema }
      attribute(:approved_at) { object.approved_at.try(:xmlschema) }
      attribute(:restricted_at) { object.restricted_at.try(:xmlschema) }
    end
  end
end