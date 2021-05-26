require 'rails_helper'

RSpec.describe "authentications", type: :request do
  let(:valid_headers) {
    {
      "Authorization" => "Bearer valid_token",
      "X-Api-Version" => "v1",
    }
  }
  let(:valid_params) {
    {
      "email" => "admin@gmail.com",
      "password" => "1"
    }
  }

  let(:invalid_authorization_headers) {
    {
      "X-Api-Version" => "v1"
    }
  }

  #group case ログイン/デバイストークン
  describe "PUT /token" do
    context "request failed headers" do
      it "header version failed" do
        get '/api/plan'
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
    end
    # it "renders access_token successful response" do
    #   put api_token_url, headers: valid_headers, params: { account: valid_params }, as: :json
    #   expect(response).to have_http_status(:ok)
    # end
  end

  #group case ログアウト
  describe "DELETE /revoke_token" do
    context "request failed header" do
      it "header version failed" do
        delete '/api/logout'
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        delete '/api/logout', headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
    # it "renders access_token successful response" do
    #   put api_token_url, headers: valid_headers, params: { account: valid_params }, as: :json
    #   expect(response).to have_http_status(:ok)
    # end
  end

end
