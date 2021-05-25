require 'rails_helper'

RSpec.describe "/accounts", type: :request do
  # let(:valid_attributes) {
  #   skip("Add a hash of attributes valid for your model")
  # }
  #
  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }
  #
  let(:valid_headers) {
    {
      "Authorization" => "Bearer valid_token",
      "X-Api-Version" => "v1"
    }.merge(FactoryBot.attributes_for(:Account))
  }
  #
  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Account.create! valid_attributes
  #     get api_accounts_url, headers: valid_headers, as: :json, headers: { "Authorization" => "Bearer valid_token", "X-Api-Version" => "v1" }
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "GET /show" do
  #   it "renders a successful response" do
  #     account = Account.create! valid_attributes
  #     get api_account_url(account), as: :json
  #     expect(response).to be_successful
  #   end
  # end

  describe "PUT /create" do
    context "with invalid header" do
      it "not version api" do
        put "/api/account"
        expect(response).to have_http_status(:bad_request)
        expect(@response.body).to eq("Not supported version")
      end
      it "not unauthorized api" do
        put "/api/account"
        expect(response).to have_http_status(:bad_request)
      end
    end
    # context "with valid parameters" do
    #
    # it "creates a new Account" do
    #   expect {
    #     put api_accounts_url,
    #          params: { api_account: valid_attributes }, headers: valid_headers, as: :json
    #   }.to change(Account, :count).by(1)
    # end
    #
    # it "renders a JSON response with the new api_account" do
    #   put api_accounts_url,
    #        params: { api_account: valid_attributes }, headers: valid_headers, as: :json
    #   expect(response).to have_http_status(:created)
    #   expect(response.content_type).to match(a_string_including("application/json"))
    # end
    # end

    # context "with invalid parameters" do
    #   it "does not create a new Account" do
    #     expect {
    #       put api_accounts_url,
    #            params: { api_account: invalid_attributes }, as: :json
    #     }.to change(Account, :count).by(0)
    #   end
    #
    #   it "renders a JSON response with errors for the new api_account" do
    #     put api_accounts_url,
    #          params: { api_account: invalid_attributes }, headers: valid_headers, as: :json
    #     expect(response).to have_http_status(:unprocessable_entity)
    #     expect(response.content_type).to eq("application/json")
    #   end
    # end
  end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested api_account" do
  #       account = Account.create! valid_attributes
  #       patch api_account_url(account),
  #             params: { account: new_attributes }, headers: valid_headers, as: :json
  #       account.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "renders a JSON response with the api_account" do
  #       account = Account.create! valid_attributes
  #       patch api_account_url(account),
  #             params: { account: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the api_account" do
  #       account = Account.create! valid_attributes
  #       patch api_account_url(account),
  #             params: { account: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json; charset=utf-8")
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested api_account" do
  #     account = Account.create! valid_attributes
  #     expect {
  #       delete api_account_url(account), headers: valid_headers, as: :json
  #     }.to change(Account, :count).by(-1)
  #   end
  # end
end
