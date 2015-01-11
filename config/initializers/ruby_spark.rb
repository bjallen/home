RubySpark.configuration do |config|
  config.access_token = ENV["SPARK_API_TOKEN"]
  config.timeout = 10.seconds
end
