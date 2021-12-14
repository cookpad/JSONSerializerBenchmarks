module Benchmark
  module Blueprinter
    class UserSerializer < ::Blueprinter::Base
      identifier :id
      fields :name, :email, :created_at, :updated_at, :language, :country
    end
  end
end
