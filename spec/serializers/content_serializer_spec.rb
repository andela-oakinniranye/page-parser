require "rails_helper"

RSpec.describe ContentSerializer, type: :serializer do
  let(:content) { build(:content_with_h1) }
  subject { described_class.new(content) }

  it { expect{subject}.not_to raise_error }

  describe "#as_json" do
    it { expect_to_have_keys(subject.as_json, :id, :tag, :body, :link)}
  end
end
