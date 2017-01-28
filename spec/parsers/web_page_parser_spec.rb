require 'rails_helper'

RSpec.describe WebPageParser do
  subject { described_class.new(url) }

  before do
    allow(subject).to receive(:fetch_document).and_return(raw_html)
  end


  describe ".strategies" do
    it "should return the registered strategies" do
      basic_strategies = [:h1, :h2, :h3, :a].map(&:to_s)
      registered_strategies = described_class.strategies.keys

      expect(registered_strategies).to match_array(basic_strategies)
    end
  end

  describe ".fetch" do
    it "should fail when fetcher is not defined" do
      expect{
        described_class.fetch(:h4)
      }.to raise_error WebPageParser::UndefinedFetcherError
    end

    it "should not fail when fetcher is defined" do
      expect{
        described_class.fetch(:title, with: 'SomeRandomFetcher')
      }.not_to raise_error
    end

    it "should assign strategies" do
      basic_strategies = described_class.strategies.keys
      described_class.fetch(:div, with: 'DivFetcher')
      all_strategies = described_class.strategies.keys

      expect(basic_strategies).not_to eql all_strategies
      expect(all_strategies).to include 'div'
    end
  end

  describe ".strategy_for" do
    it "should return the strategy for tags" do
      # because strategies could be overriden at runtime,
      # better to test with custom strategy
      described_class.fetch(:span, with: 'SpecSpanFetcher')

      expect(described_class.strategy_for('span')).to eql 'SpecSpanFetcher'
    end
  end

  describe "#fetch_page" do
    it "should return a nokogiri document" do
      expect(subject.fetch_page).to be_a Nokogiri::HTML::Document
    end
  end

  describe "#get" do
    before do
      subject.fetch_page
    end

    it "should get a tag with registered strategy" do
      a_tags = subject.get(:a)

      expect(a_tags.size).to be 1
      expect(a_tags).to include URI::parse(url)
    end

    it "should get a tag with registered strategy" do
      h1_tags = subject.get(:h1)

      expect(h1_tags.size).to be 1
      expect(h1_tags).to include h1
    end

    it "should get a tag with registered strategy" do
      h2_tags = subject.get(:h2)

      expect(h2_tags.size).to be 1
      expect(h2_tags).to include h2
    end

    it "should get a tag with registered strategy" do
      h3_tags = subject.get(:h3)

      expect(h3_tags.size).to be 1
      expect(h3_tags).to include h3
    end
  end
end
