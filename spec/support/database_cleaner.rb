RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation, { pre_count: true, reset_ids: false }
    DatabaseCleaner.strategy = :transaction
  end

  config.prepend_before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    retries = 3
    begin
      DatabaseCleaner.clean
    rescue ActiveRecord::StatementInvalid, PG::TRDeadlockDetected
      if retries > 0
        retries -= 1
        sleep 1
        retry
      end
    end
  end

  config.around(:each, type: :feature) do |example|
    current_strategy = DatabaseCleaner.connections.first.strategy
    DatabaseCleaner.strategy = :truncation, { pre_count: true, reset_ids: false }
    example.run_with_retry retry: 2
    DatabaseCleaner.strategy = current_strategy
  end

  config.around(:each, truncate: true) do |example|
    current_strategy = DatabaseCleaner.connections.first.strategy
    DatabaseCleaner.strategy = :truncation, { pre_count: true, reset_ids: false }
    example.run
    DatabaseCleaner.strategy = current_strategy
  end
end
