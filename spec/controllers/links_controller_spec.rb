# spec/controllers/links_controller_spec.rb

require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  let(:valid_attributes) do
    { title: 'Test Link', url: 'http://example.com' }
  end

  let(:invalid_attributes) do
    { title: '', url: '' }
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      link = Link.create! valid_attributes
      get :show, params: { id: link.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      link = Link.create! valid_attributes
      get :edit, params: { id: link.to_param }
      expect(response).to be_successful
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested link" do
      link = Link.create! valid_attributes
      expect do
        delete :destroy, params: { id: link.to_param }
      end.to change(Link, :count).by(-1)
    end

    it "redirects to the links list" do
      link = Link.create! valid_attributes
      delete :destroy, params: { id: link.to_param }
      expect(response).to redirect_to(links_url)
    end
  end
end
