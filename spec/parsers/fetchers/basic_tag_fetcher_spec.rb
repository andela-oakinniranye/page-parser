require 'rails_helper'

RSpec.describe Fetchers::BasicTagFetcher, type: :fetcher do
  it_behaves_like :shared_fetchers, :div
end
