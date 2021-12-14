module Benchmark
  module ActiveModelSerializers
    class UserSerializer < SerializerBase
      attributes :id
      attributes :name
      attributes :email
      attributes :language
      attributes :country
      attribute(:created_at) { object.created_at.xmlschema }
      attribute(:updated_at) { object.updated_at.xmlschema }

    end
  end
end
