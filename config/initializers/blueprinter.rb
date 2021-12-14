Blueprinter.configure do |config|
  config.datetime_format = ->(datetime) { datetime.nil? ? datetime : datetime.xmlschema }
end