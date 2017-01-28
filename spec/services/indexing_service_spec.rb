require 'rails_helper'

RSpec.describe IndexingService do

  before do
    allow_any_instance_of(WebPageParser).to receive(:fetch_document).and_return(raw_html)
  end

  let(:link) { create(:link) }
  subject { described_class.new(link) }

  describe "#index_content!" do

    before do
      expect(link.completed_at).to be_blank

      subject.index_content!
    end

    it "should index the content on the link url" do
      contents = link.contents

      expect(contents.size).to eql 4
    end

    it "should index the right content" do
      contents = link.contents

      expect(contents.map(&:body)).to match_array [h1, h2, h3, url]
      expect(contents.map(&:tag)).to match_array ['h1', 'h2', 'h3', 'url']
    end

    it "should populate the completed_at time" do
      expect(link.completed_at).not_to be_blank
    end
  end
end
