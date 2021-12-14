module Benchmark
  module Blueprinter
    class CommentSerializer < SerializerBase
      identifier :id

      fields :content, :created_at, :updated_at, :approved_at, :restricted_at
    end
  end
end