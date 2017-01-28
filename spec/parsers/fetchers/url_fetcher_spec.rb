require 'rails_helper'

RSpec.describe Fetchers::UrlFetcher, type: :fetcher  do
  it_behaves_like :shared_fetchers, :a
  
  let(:webpage) { OpenStruct.new(url: url, document: double('document'))}
  subject { described_class.new(url, webpage)}

  describe "#url_for" do
    it "should return a valid url" do
      made_url = subject.url_for('/fetcher')
      expected_url = URI::parse("#{url}/fetcher")

      expect(made_url).to eql(expected_url)
    end
  end

  describe "#valid_url?" do
    context "when it's a valid url" do
      it "should be true" do
        valid_url_check = !!subject.valid_url?("/oreoluwa")
        expect(valid_url_check).to be true
      end
    end

    context "when it's an invalid url" do
      it "should be false" do
        invalid_url_check = subject.valid_url?("javascript: void(0)")
        expect(invalid_url_check).to be false
      end
    end
  end
end
