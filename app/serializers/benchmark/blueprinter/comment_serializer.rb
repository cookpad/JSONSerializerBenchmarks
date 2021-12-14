module Benchmark
  module Blueprinter
    class CommentSerializer < ::Blueprinter::Base
      identifier :id

      fields :content, :created_at, :updated_at, :approved_at, :restricted_at
    end
  end
end