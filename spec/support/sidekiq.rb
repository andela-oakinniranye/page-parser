RSpec.configure do |config|
  config.before(:each) do | example |
    # Clears out the jobs for tests using the fake testing
    Sidekiq::Worker.clear_all
    if example.metadata[:sidekiq] == :inline
      Sidekiq::Testing.inline!
    else
      Sidekiq::Testing.fake!
    end
  end
end
