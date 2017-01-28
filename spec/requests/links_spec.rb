require 'rails_helper'

RSpec.describe "Links", type: :request do

  describe "GET /links" do
    before do
      create_list(:link, 20)

      get links_path
    end

    it { expect(response).to be_success }

    it "should have all the created links" do
      expect(json["links"].size).to be 20
    end
  end

  describe "GET /links/:id" do
    let(:link) { create(:link) }

    before do
      get link_path(link.id)
    end

    it { expect(response).to be_success }

    it "should return the right link" do
      expect(json['link']['id']).to be link.id
    end

  end

  describe "POST /links" do

    before do
      post links_path, params: { link: link_params }
    end

    context "when it is a valid attribute" do
      let(:link_params) { attributes_for(:link) }

      it { expect(response).to be_success }

      it "should create a new link" do
        expect(json['link']['url']).to eql link_params[:url]
      end
    end
  end
end
