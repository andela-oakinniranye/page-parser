module RequestHelper
  RSpec.configure do |config|
    config.include self, type: :request
  end

  def json
    JSON.parse(response.body)
  end
end
