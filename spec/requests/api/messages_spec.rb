require 'rails_helper'
RSpec.describe "/messages", type: :request do
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

  describe "GET /index" do
    it "renders a successful response" do
      # Message.create! valid_attributes
      get api_messages_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
    context "request failed headers" do
      it "header version failed" do
        get api_messages_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_messages_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
end
