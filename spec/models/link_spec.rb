require 'rails_helper'

RSpec.describe Link, type: :model do

  describe "Association" do
    it { expect(subject).to have_many :contents }
  end

  describe "Validations" do
    it { expect(subject).to validate_presence_of :url }
  end

  describe "Callbacks" do
    it "should index page in the background" do
      expect(PageIndexerJob).to receive(:perform_later)

      create(:link)
    end
  end
end
