module Benchmark
  module Alba
    class UserSerializer < SerializerBase
      attributes :name, :email, :language, :country

      attributes created_at: cast_as_xml_datetime,
        updated_at: cast_as_xml_datetime
    end
  end
end
