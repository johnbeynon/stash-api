if ENV.has_key?("REDIS_URL")
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new
end
