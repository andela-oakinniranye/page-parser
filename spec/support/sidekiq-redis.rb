RSpec.configure do |config|
  REDIS = MockRedis.new
  
  config.before(:each) do
    REDIS.flushdb
    allow(Sidekiq).to receive(:redis).and_yield(REDIS) # Or else Sidekiq.redis will attempt to make a real connection
  end
end
