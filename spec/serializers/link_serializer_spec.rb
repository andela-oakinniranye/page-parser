require "rails_helper"

RSpec.describe LinkSerializer, type: :serializer do
  let(:link) { create(:link) }
  subject { described_class.new(link) }

  it { expect{subject}.not_to raise_error }

  describe "#as_json" do
    it { expect_to_have_keys(subject.as_json, :id, :url, :completed, :_meta)}
  end

  describe "#include_contents?" do
    let(:other_subject) { described_class.new(link, include_contents: false) }

    it { expect(subject.as_json).to have_key(:contents) }
    it { expect(other_subject.as_json).not_to have_key(:contents) }
  end
end
