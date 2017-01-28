require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) {
    { url: url }
  }

  let(:invalid_attributes) {
    { content: 'h1' }
  }

  describe "GET #index" do
    it "assigns all links as @links" do
      link = Link.create! valid_attributes
      get :index
      expect(assigns(:links)).to eq([link])
    end
  end

  describe "GET #show" do
    it "assigns the requested link as @link" do
      link = Link.create! valid_attributes
      get :show, params: {id: link.to_param}
      expect(assigns(:link)).to eq(link)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Link" do
        expect {
          post :create, params: {link: valid_attributes}
        }.to change(Link, :count).by(1)
      end

      it "assigns a newly created link as @link" do
        post :create, params: {link: valid_attributes}
        expect(assigns(:link)).to be_a(Link)
        expect(assigns(:link)).to be_persisted
      end

      it "redirects to the created link" do
        post :create, params: {link: valid_attributes}
        expect(response).to be_success
        expect(response.header['Location']).to eql link_url(Link.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved link as @link" do
        post :create, params: {link: invalid_attributes}
        expect(assigns(:link)).to be_a_new(Link)
      end
    end
  end

end
