require "rails_helper"

RSpec.describe ErrorSerializer, type: :serializer do
  subject { described_class.new("Error Message") }

  it { expect{subject}.not_to raise_error }

  describe "#as_json" do
    it { expect_to_have_keys(subject.as_json, :message)}
  end
end
