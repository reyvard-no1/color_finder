require 'rails_helper'

RSpec.describe "Palettes", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/palettes/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/palettes/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/palettes/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/palettes/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
