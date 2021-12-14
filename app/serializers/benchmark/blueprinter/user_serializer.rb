module Benchmark
  module Blueprinter
    class UserSerializer < SerializerBase
      identifier :id
      fields :name, :email, :created_at, :updated_at, :language, :country
    end
  end
end
