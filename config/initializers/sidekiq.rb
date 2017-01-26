redis_db = ENV['REDIS_URL']

Redis.current = ConnectionPool.new(size: (Sidekiq.server? ? 5 : 1), timeout: 5) do
  Redis.new url: redis_db
  # host: redis_config['host'], port: redis_config['port'], db: redis_config['database']
end

Sidekiq.configure_server do |config|
  config.redis = Redis.current
end

Sidekiq.configure_client do |config|
  config.redis = Redis.current
end
