require 'rails_helper'

RSpec.shared_examples :shared_fetchers do |tag_type|
  let(:parser) do
    page_parser = WebPageParser.new(url)
    page_parser.fetch_page
    page_parser
  end

  let(:web_page) { OpenStruct.new({url: url, document: parser.parsed_document }) }

  subject { described_class.new(tag_type, web_page) }

  describe "#matches" do
    it { expect(subject.matches).to be_a Nokogiri::XML::NodeSet }
  end

  describe "#values" do
    it { expect(subject.values).to be_a Enumerable }
  end
end
