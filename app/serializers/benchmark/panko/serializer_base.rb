module Benchmark
  module Panko
    class SerializerBase < ::Panko::Serializer
      def created_at
        object.created_at.xmlschema
      end

      def updated_at
        object.updated_at.xmlschema
      end
    end
  end
end