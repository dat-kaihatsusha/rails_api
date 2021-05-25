require 'rails_helper'

RSpec.describe "/api/plans", type: :request do
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  # let(:valid_headers) {
  #   {
  #     "Authorization" => "Bearer valid_token",
  #     "X-Api-Version" => "v1"
  #   }.merge(FactoryBot.attributes_for(:Api::Plan))
  # }
  #
  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Api::Plan.create! valid_attributes
  #     get api_plans_url, headers: valid_headers, as: :json, headers: { "Authorization" => "Bearer valid_token", "X-Api-Version" => "v1" }
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /show" do
  #   it "renders a successful response" do
  #     plan = Api::Plan.create! valid_attributes
  #     get api_plan_url(api_plan), as: :json
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Api::Plan" do
  #       expect {
  #         post api_plans_url,
  #              params: { api_plan: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(Api::Plan, :count).by(1)
  #     end
  #
  #     it "renders a JSON response with the new api_plan" do
  #       post api_plans_url,
  #            params: { api_plan: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new Api::Plan" do
  #       expect {
  #         post api_plans_url,
  #              params: { api_plan: invalid_attributes }, as: :json
  #       }.to change(Api::Plan, :count).by(0)
  #     end
  #
  #     it "renders a JSON response with errors for the new api_plan" do
  #       post api_plans_url,
  #            params: { api_plan: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json")
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested api_plan" do
  #       plan = Api::Plan.create! valid_attributes
  #       patch api_plan_url(api_plan),
  #             params: { api_plan: new_attributes }, headers: valid_headers, as: :json
  #       plan.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "renders a JSON response with the api_plan" do
  #       plan = Api::Plan.create! valid_attributes
  #       patch api_plan_url(api_plan),
  #             params: { api_plan: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the api_plan" do
  #       plan = Api::Plan.create! valid_attributes
  #       patch api_plan_url(api_plan),
  #             params: { api_plan: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json; charset=utf-8")
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested api_plan" do
  #     plan = Api::Plan.create! valid_attributes
  #     expect {
  #       delete api_plan_url(api_plan), headers: valid_headers, as: :json
  #     }.to change(Api::Plan, :count).by(-1)
  #   end
  # end
end
