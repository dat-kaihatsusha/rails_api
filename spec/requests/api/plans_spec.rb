require 'rails_helper'

RSpec.describe "/api/plans", type: :request do
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
  #group case プラン一覧
  describe "GET /index" do
    context "successful response" do
      it "renders a successful response" do
        # Api::Plan.create! valid_attributes
        get '/api/plan', headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        get '/api/plan', headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get '/api/plan', headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case プラン計画
  describe "PUT /create" do
    context "with valid parameters" do
      it "creates a new plan" do
        put '/api/plan', headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        put '/api/plan', headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        put '/api/plan', headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case プラン削除
  describe "DELETE /destroy" do
    context "renders a successful response" do
      it "destroys the requested api_plan" do
        # plan = Api::Plan.create! valid_attributes
        delete '/api/plan/1', headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        delete '/api/plan/1', headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        delete '/api/plan/1', headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 記録
  describe "PUT /record" do
    context "with valid parameters" do
      it "write a record" do
        put api_record_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        put api_record_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        put api_record_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case レコメンド
  describe "GET /recommend_plan" do
    it "get recommend_plan" do
      get api_recommend_plan_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_recommend_plan_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_recommend_plan_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 音楽一覧
  describe "GET /music_list" do
    it "get list music" do
      get api_music_list_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_music_list_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_music_list_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case ダッシュボード
  describe "GET /dashboard" do
    it "get dashboard" do
      get api_dashboard_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_dashboard_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_dashboard_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case お気に入り一覧
  describe "GET /love_list" do
    it "get list love" do
      get api_love_list_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_love_list_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_love_list_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 結果取得
  describe "GET /result" do
    it "get result" do
      get api_result_url, headers: valid_headers, as: :json
      expect(response).to have_http_status(:ok)
    end
    context "request failed headers" do
      it "header version failed" do
        get api_result_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        get api_result_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 記録
  describe "PUT|DELETE /create_love" do
    context "with valid parameters" do
      it "created with love" do
        put api_create_love_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        delete api_create_love_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        put api_create_love_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        put api_create_love_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
  #group case 休憩開始・終了
  describe "PUT|DELETE /create_time" do
    context "with valid parameters" do
      it "created with time" do
        put api_create_time_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        delete api_create_time_url, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end
    context "request failed headers" do
      it "header version failed" do
        put api_create_time_url, headers: invalid_version_headers, as: :json
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "header authorization failed" do
        put api_create_time_url, headers: invalid_authorization_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        expect(@response.body).to eq("Not authorization")
      end
    end
  end
end
