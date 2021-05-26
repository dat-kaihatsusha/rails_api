require 'rails_helper'

RSpec.describe "/payments", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {
      "Authorization" => "Bearer valid_token",
      "X-Api-Version" => "v1"
    }
  }
  let(:invalid_authorization_headers) {
    {
      "X-Api-Version" => "v1"
    }
  }
  let(:invalid_version_headers) {
    {
      "Authorization" => "Bearer valid_token"
    }
  }
  #group case 取得
  describe "GET /index" do
    it "renders a successful response" do
      # Payment.create! valid_attributes
      get api_payments_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_payments_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_payments_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 取得 Google Play, App Store の購入情報
  describe "PUT /create" do
    context "with valid parameters" do
      it "render successful response register" do
        put api_register_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        put api_register_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        put api_register_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
end
