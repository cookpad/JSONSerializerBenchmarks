module Benchmark
  module Panko
    class UserSerializer < SerializerBase
      attributes :name, :email, :language, :country, :created_at, :updated_at

      def created_at
        object.created_at.xmlschema
      end

      def updated_at
        object.updated_at.xmlschema
      end
    end
  end
end
