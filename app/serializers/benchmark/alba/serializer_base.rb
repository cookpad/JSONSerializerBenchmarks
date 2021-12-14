module Benchmark
  module Alba
    class SerializerBase
      include ::Alba::Resource

      def self.cast_as_xml_datetime
        [String, datetime_to_xml_proc]
      end

      def self.datetime_to_xml_proc
        ->(object) { object&.xmlschema }
      end
    end
  end
end
