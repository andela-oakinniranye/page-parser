require 'rails_helper'

RSpec.describe Fetchers::HeaderFetcher, type: :fetcher  do
  it_behaves_like :shared_fetchers, :h1

  let(:webpage) { OpenStruct.new(url: url, document: double('document'))}
  subject { described_class.new(url, webpage)}

  describe "#values" do
    let(:values) { ["Whatever", nil, nil, "should", "work", 1, nil, "i", nil, "guess"] }
    before do
      allow(subject).to receive(:matches).and_return(transformed_values)
    end

    it { expect(subject.values).to eql values.compact }

    def transformed_values
      values.map do |val|
        OpenStruct.new(text: val) if val
      end
    end
  end
end
