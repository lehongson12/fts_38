Sidekiq.configure_server do |config|
  config.redis = {
    url: "redis://redis.example.com:6379/10",
    namespace: "tr4w"
}
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: "redis://redis.example.com:6379/10",
    namespace: "tr4w"
}
end
