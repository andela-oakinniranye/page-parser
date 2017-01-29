redis_db = ENV['REDISTOGO_URL']

Redis.current = ConnectionPool.new(size: (Sidekiq.server? ? 5 : 1), timeout: 5) do
  Redis.new url: redis_db
end

Sidekiq.configure_server do |config|
  config.redis = Redis.current
end

Sidekiq.configure_client do |config|
  config.redis = Redis.current
end
