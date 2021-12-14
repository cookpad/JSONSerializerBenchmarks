module Benchmark
  module Alba
    class CommentSerializer < SerializerBase
      attributes :content
      attributes created_at:    cast_as_xml_datetime,
                 updated_at:    cast_as_xml_datetime,
                 approved_at:   cast_as_xml_datetime,
                 restricted_at: cast_as_xml_datetime
    end
  end
end
