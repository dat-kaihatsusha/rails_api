require 'rails_helper'

describe "authentications", type: :request do
  it "v1 GET /index" do
    put "/api/token"
    expect(response).to have_http_status(:bad_request)
    expect(@response.body).to eq("Not supported version")
  end
end
