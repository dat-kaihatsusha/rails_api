require "rails_helper"

describe "ApiTest", type: :request do
  example "v1 ping" do
    get "/api/ping"
    expect(response).to have_http_status(:bad_request)
    expect(@response.body).to eq("Not supported version")
    
    get "/api/ping", headers: { "X-Api-Version" => "v1" }
    expect(response).to have_http_status(:ok)
    expect(JSON.parse(@response.body)).to eq("ok")
  end
end