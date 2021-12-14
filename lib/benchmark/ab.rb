module Benchmark
  class AB
    require "open3"

    N_REQUESTS = 1_000
    CONCURRENCY = 2
    HOST = "http://127.0.0.1:3000".freeze

    attr_reader :serializer

    def initialize(serializer)
      @serializer = serializer
    end

    def run!
      puts "Running benchmark for #{serializer}"
      stdout_str, stderr_str, exit_code = Open3.capture3(command)

      if exit_code == 0
        store_results_file!(stdout_str)
      else
        print_error(stderr_str)
      end
    end

    private

      def filepath
        "./benchmarks/#{serializer}.txt"
      end

      def store_results_file!(benchmark_output)
        File.open(filepath, 'w+') { |f| f.rewind; f.write(benchmark_output) }
      end

      def print_error(error_message)
        puts error_message
      end

      def command
        "ab -n%{n_requests} -c%{concurrency} %{host}/benchmark/%{serializer}/recipes.json" % {
          n_requests: N_REQUESTS,
          concurrency: CONCURRENCY,
          host: HOST,
          serializer: serializer
        }
      end
  end
end