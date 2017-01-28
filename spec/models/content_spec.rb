require 'rails_helper'

RSpec.describe Content, type: :model do

  describe "Associations" do
    it { expect(subject).to belong_to :link }
  end

  describe "Validations" do
    it { expect(subject).to validate_presence_of :body }
    it { expect(subject).to validate_presence_of :tag }
  end

  describe "Callbacks" do
    subject { build(:content_with_h1) }

    it "should be called before save" do
      expect(subject).to receive(:clean_body)

      subject.save
    end
  end

  describe "#clean_body" do
    let(:body) { "Whatever this ought to be" }
    subject { build(:content_with_h1, body: "\n\r\r\n\t#{body}\t\n\r\r\n\t") }

    it "should strip the body of any unreadable characters" do
      subject.save

      expect(subject.body).to eql body
    end
  end
end
