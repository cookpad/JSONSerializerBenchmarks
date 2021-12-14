module Benchmark
  class Report
    class FileParser
      attr_reader :filepath

      def initialize(filepath)
        @filepath = filepath
      end

      def name
        filepath.split("/").last.sub(".txt", "")
      end

      def duration
        @_duration ||= fetch_duration
      end

      def to_s
        <<~OUTPUT
        Test:\t#{name.ljust(24)}\t#{duration} seconds
        OUTPUT
      end

        private

        def fetch_duration
          match_data = File.read(filepath).match(/Time taken for tests\:\s+(?<duration>[\d\.]+) seconds/)
          return "n/a" unless match_data

          match_data[:duration]
        end
    end

    attr_reader :results

    alias to_s results

    def initialize
      @results = parse_results
    end

      private

      def parse_results
        Dir["./benchmarks/*.txt"].map { |filepath| FileParser.new(filepath) }.sort_by(&:duration).join("")
      end
  end
end