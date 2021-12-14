module Benchmark
  module Panko
    class CommentSerializer < SerializerBase
      attributes :content, :created_at, :updated_at, :approved_at, :restricted_at

      def created_at
        object.created_at.xmlschema
      end

      def updated_at
        object.updated_at.xmlschema
      end

      def approved_at
        object.approved_at&.xmlschema
      end

      def restricted_at
        object.restricted_at&.xmlschema
      end
    end
  end
end
