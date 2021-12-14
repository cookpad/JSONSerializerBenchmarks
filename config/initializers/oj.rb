if ENV['OJ']
  # Read here for more details:
  # https://github.com/ohler55/oj/blob/develop/pages/Rails.md
  require "oj"

  Oj.optimize_rails()
end